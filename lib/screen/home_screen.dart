import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:maze_conquest_sp/widget/home_screen/avatar_label.dart';
import 'package:maze_conquest_sp/widget/home_screen/leaderboard_block.dart';
import 'package:maze_conquest_sp/widget/home_screen/lv_block.dart';
import 'package:maze_conquest_sp/widget/home_screen/maze_depth_block.dart';
import 'package:maze_conquest_sp/widget/home_screen/power_block.dart';
import 'package:maze_conquest_sp/widget/home_screen/progress_block.dart';
import 'package:maze_conquest_sp/widget/home_screen/remote_block.dart';
import 'package:maze_conquest_sp/widget/home_screen/stats_block.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 6.0),
              AvatarLabel(user: user),
              const ProgressBlock(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  shrinkWrap: true, // Ensures the grid takes only the space it needs
                  crossAxisCount: 2, // Two columns
                  crossAxisSpacing: 14.0, // Space between columns
                  mainAxisSpacing: 14.0, // Space between rows
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    4,
                    (index) {
                      switch (index) {
                        case 0:
                          return PowerBlock(user: user);
                        case 1:
                          return LvBlock(user: user);
                        case 2:
                          return MazeDepthBlock(user: user);
                        case 3:
                          return const StatsBlock();
                        default:
                          throw Exception("Unavailable widget");
                      }
                    },
                  ),
                ),
              ),
              const RemoteBlock(),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Leaderboard",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              LeaderboardBlock(user: user),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
