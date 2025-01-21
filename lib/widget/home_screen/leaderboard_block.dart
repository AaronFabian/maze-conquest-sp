import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maze_conquest_sp/widget/home_screen/leaderboard_tile.dart';
import 'package:maze_conquest_sp/widget/user_circle_profile_url.dart';

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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  userCircleProfileUrl(user),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rank #${1}",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Text(
                          "Top ${1}%",
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
                          "${1280} points",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                        ),
                        Text(
                          "${1} Out of 1225 players",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(color: Colors.black),
            const LeaderboardTile(),
          ],
        ),
      ),
    );
  }
}
