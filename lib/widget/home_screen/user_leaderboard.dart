import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maze_conquest_sp/model/leaderboard.dart';
import 'package:maze_conquest_sp/service/use_case/leaderboard_service.dart';
import 'package:maze_conquest_sp/widget/user_circle_profile_url.dart';

class UserLeaderboard extends StatefulWidget {
  final User user;
  const UserLeaderboard({super.key, required this.user});

  @override
  State<UserLeaderboard> createState() => _UserLeaderboardState();
}

class _UserLeaderboardState extends State<UserLeaderboard> {
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
    if (_isLoading) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Text("Loading",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          userCircleProfileUrl(widget.user),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rank #${_leaderboard?.userRank ?? "E"}",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  "Top ${_leaderboard?.userPercentile ?? "E"}%",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${_leaderboard?.userTotalPower ?? "E"} points",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                ),
                Text(
                  "${_leaderboard?.userRank ?? "E"} Out of ${_leaderboard?.totalUser ?? "E"} players",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
