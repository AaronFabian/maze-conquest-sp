import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RemoteBlock extends StatefulWidget {
  const RemoteBlock({super.key});

  @override
  State<RemoteBlock> createState() => _RemoteBlockState();
}

class _RemoteBlockState extends State<RemoteBlock> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 120, 127, 153), // Black background color
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true, // Add this
              builder: (BuildContext context) {
                return Container(
                  height: 500, // Set your desired height here
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  color: Colors.black,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Token',
                          style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: "zig"),
                        ),
                        const Text('Please enter the token from the maze conquest website'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 124),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: _textController,
                            onFieldSubmitted: (value) {
                              final token = value;
                              // do something..
                              context.goNamed("remote_map", pathParameters: {"token": token});
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) return 'Please enter 4 digit value';

                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cast_connected_outlined,
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                "Remote map",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
