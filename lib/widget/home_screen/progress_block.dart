import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maze_conquest_sp/model/leaderboard.dart';
import 'package:maze_conquest_sp/service/use_case/leaderboard_service.dart';
import 'package:maze_conquest_sp/widget/home_screen/tween_linear_progress_indicator.dart';
import 'package:maze_conquest_sp/widget/tween_number.dart';

// Refactor is required
class ProgressBlock extends StatefulWidget {
  final User user;
  const ProgressBlock({super.key, required this.user});

  @override
  State<ProgressBlock> createState() => _ProgressBlockState();
}

class _ProgressBlockState extends State<ProgressBlock> {
  Leaderboard? _leaderboard;
  bool _isLoading = true;

  void _getData() async {
    final result = await LeaderboardService(Dio()).getLeaderboard(widget.user.uid);
    if (result.error != null) {
      if (result.error is DioException) {
        return setState(() {
          _isLoading = false;
          // _errorMessage = "Request Error: Application crash";
        });
      } else if (result.error is SocketException) {
        return setState(() {
          _isLoading = false;
          // _errorMessage = "Socket Error: Application crash";
        });
      } else {
        return setState(() {
          _isLoading = false;
          // _errorMessage = "Fatal Error: Application fatal crash";
        });
      }
    }

    // Ok
    setState(() {
      _isLoading = false;
      _leaderboard = result.value;
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      // color: const Color.fromARGB(255, 254, 222, 103),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        color: Color.fromARGB(255, 254, 222, 103),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PROGRESS",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.leaderboard_outlined,
                size: 42.0,
              ),
              const SizedBox(width: 14.0),
              _isLoading
                  ? Text(
                      "-",
                      style:
                          Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 48.0),
                    )
                  : TweenNumber(
                      value: _leaderboard?.userRank.toDouble() ?? 0,
                      style:
                          Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 48.0),
                    ),
              const SizedBox(width: 14.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Text(
                      "from top position of ${_isLoading ? "🔃" : _leaderboard?.totalUser ?? "E"} players",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black, fontSize: 14.0),
                    ),
                  ),
                  Text(
                    "#Top Player",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          _isLoading
              ? const SizedBox(
                  width: double.infinity,
                  height: 8.0,
                  child: LinearProgressIndicator(
                    backgroundColor: Color.fromARGB(255, 255, 254, 255),
                    value: 0,
                    semanticsLabel: "Linear progress indicator",
                  ),
                )
              : TweenLinearProgressIndicator(value: _leaderboard?.userPercentile ?? 0, maxValue: 100)
        ],
      ),
    );
  }
}
