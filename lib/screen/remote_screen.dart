import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:maze_conquest_sp/helper/constant.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

enum SocketStatus {
  waiting,
  successConnected,
  closed,
  failed,
}

class RemoteScreen extends StatefulWidget {
  final String? token;
  const RemoteScreen(this.token, {super.key});

  @override
  State<RemoteScreen> createState() => _RemoteScreenState();
}

class _RemoteScreenState extends State<RemoteScreen> {
  final logger = Logger();
  final user = FirebaseAuth.instance.currentUser!;
  var socketStatus = SocketStatus.waiting;

  late final WebSocketChannel _channel;
  Timer? timer;

  void _displayDialog({
    required String title,
    required String content,
    required void Function(BuildContext ctx) action,
  }) {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext ctx) => AlertDialog(
                title: Text(title),
                content: Text(content),
                actions: [TextButton(onPressed: () => action(ctx), child: const Text("OK"))],
              ));
    } else {
      showDialog(
        context: context,
        builder: (BuildContext ctx) => AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [TextButton(onPressed: () => action(ctx), child: const Text("OK"))],
        ),
      );
    }
  }

  Future<void> _connectWebSocket() async {
    try {
      if (widget.token == null) throw Exception("Unexpected error, token not provided");

      // 01
      final uid = user.uid;

      // 02
      logger.d("Connect with socket: wss://$urlName/api/v1/ws/$uid${widget.token}");
      final wsUrl = Uri.parse("wss://$urlName/api/v1/ws/$uid${widget.token}");
      _channel = WebSocketChannel.connect(wsUrl);

      // closure
      var isDisplayingDialog = false;
      _channel.stream.listen(
        (message) {
          // print('Received: $message');
          final msg = json.decode(message) as Map<String, dynamic>;
          switch (msg["command"] as String) {
            // A message from backend to stop connecting
            case "idleStop":
              _channel.sink.close(status.normalClosure);
              break;

            case "checkForConnection":
              // Prevent user brutal behavior
              if (isDisplayingDialog) return;
              isDisplayingDialog = true;
              _displayDialog(
                title: "Check connection",
                content: "Connection status OK. Feature work properly",
                action: (ctx) {
                  ctx.pop();
                  isDisplayingDialog = false;
                },
              );
              break;

            // Ignore anything beyond this
          }
        },
        onError: (error) {
          setState(() => socketStatus = SocketStatus.failed);
          logger.w('WebSocket error: $error');
          logger.w("Error while connecting user with server, move back to home screen and restart channel !");
        },
        onDone: () {
          setState(() => socketStatus = SocketStatus.closed);
          logger.i('WebSocket closed. Should tell user and navigate into another screen');

          _displayDialog(
              title: "Remote disconnected",
              content: "The connection with server ended. Back to home screen",
              action: (ctx) => ctx.goNamed("home"));
        },
      );

      // Assume every time is success
      socketStatus = SocketStatus.successConnected;
    } catch (e) {
      socketStatus = SocketStatus.failed;
      logger.wtf('Failed to connect to WebSocket: $e');
    }
  }

  _startExecute(String key) {
    _channel.sink.add('{"command": "pressed", "key": "$key"}');
    timer?.cancel();

    timer = Timer.periodic(Duration(milliseconds: (1000 / 60).floor()), (timer) {
      _channel.sink.add('{"command": "isDown", "key": "$key"}');
    });
  }

  Widget _pad({double? size = 70, required Widget label, required String key}) {
    return GestureDetector(
      onTapDown: (tapDetails) {
        _startExecute(key);
      },
      onTapUp: (details) {
        timer?.cancel();
        _channel.sink.add('{"command": "cancel", "key": "$key"}');
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 1.2),
        ),
        alignment: Alignment.center,
        child: label,
      ),
    );
  }

  Widget _dPad() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _pad(
            key: "w",
            label: SvgPicture.asset(
              'assets/icons/arrow-up.svg',
              height: 22,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _pad(
                key: "a",
                label: SvgPicture.asset(
                  'assets/icons/arrow-left.svg',
                  height: 22,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              const SizedBox(width: 74),
              _pad(
                key: "d",
                label: SvgPicture.asset(
                  'assets/icons/arrow-right.svg',
                  height: 22,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ],
          ),
          _pad(
            key: "s",
            label: SvgPicture.asset(
              'assets/icons/arrow-down.svg',
              height: 22,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          )
        ],
      ),
    );
  }

  Widget _commandPad() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _pad(
            key: " ",
            size: 120,
            label: const Text(
              "space",
              style: TextStyle(fontFamily: "zig", fontSize: 18, color: Colors.white),
            ),
          ),
          const SizedBox(width: 20),
          _pad(
            key: "Enter",
            size: 120,
            label: const Text(
              "enter",
              style: TextStyle(fontFamily: "zig", fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _setLandscape() async {
    /**
     * Flutter will throw error if we don't await the SystemChrome
     * - setPreferenceSystemUIMode -> Forcing the screen to landscape
     * - setEnabledSystemUIMode -> Remove the top bar screen
     */

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  Future<void> _resetDeviceOrientation() async {
    // Reset the status bar
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);

    // Reset the screen to landscape mode when changing app screen
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
  }

  @override
  void initState() {
    super.initState();

    _setLandscape();

    _connectWebSocket();
  }

  @override
  void dispose() {
    _resetDeviceOrientation();

    // Ensure the WebSocket connection is properly closed
    _channel.sink.close(status.normalClosure, "User quit from the app and close the connection");

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var status = "Waiting"; // assuming every build it's should be waiting state
    var statusColor = Colors.yellow;
    if (socketStatus == SocketStatus.successConnected) {
      status = "OK";
      statusColor = Colors.green;
    } else if (socketStatus == SocketStatus.closed) {
      status = "Closed";
      statusColor = Colors.brown;
    } else if (socketStatus == SocketStatus.failed) {
      status = "Error";
      statusColor = Colors.red;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Stack(
          children: [
            TextButton(
              onPressed: () => context.goNamed("home"),
              child: const Text("back"),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Text("status: $status", style: TextStyle(color: statusColor)),
            ),
            Center(
              child: Row(
                children: [
                  _dPad(),
                  _commandPad(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
  Returns the color for the overlay when the button is pressed
  WidgetStateProperty<Color> _getButtonOverlayColor() {
    return WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.pressed)) {
          return Colors.grey.withAlpha(85); // Color when pressed
        }
        return Colors.transparent; // Default color
      },
    );
  }
*/
