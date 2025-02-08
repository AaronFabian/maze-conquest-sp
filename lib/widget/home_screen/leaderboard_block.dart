import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maze_conquest_sp/widget/home_screen/leaderboard_tile.dart';
import 'package:maze_conquest_sp/widget/home_screen/user_leaderboard.dart';

class LeaderboardBlock extends StatelessWidget {
  final User user;
  const LeaderboardBlock({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 51, 54, 69),
          borderRadius: BorderRadius.circular(26),
        ),
        child: Column(
          children: [
            // 01
            UserLeaderboard(user: user),

            const Divider(color: Colors.black),

            // 02
            const LeaderboardTile(),
          ],
        ),
      ),
    );
  }
}
