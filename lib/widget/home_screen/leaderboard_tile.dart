import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:maze_conquest_sp/model/mix_stats.dart';
import 'package:maze_conquest_sp/service/use_case/mix_stats_service.dart';

class LeaderboardTile extends StatefulWidget {
  const LeaderboardTile({super.key});

  @override
  State<LeaderboardTile> createState() => _LeaderboardTileState();
}

class _LeaderboardTileState extends State<LeaderboardTile> {
  Exception? error;
  List<ListTile> leaderboardTiles = [];
  bool isLoading = true;

  String lastCursor = "";
  bool hasNextPage = false;

  List<ListTile> _convertLeaderboardDataToMixStatsWidget(List<MixStats> leaderboard) {
    return leaderboard
        .map((mixStats) => ListTile(
              leading: CircleAvatar(
                key: ValueKey(mixStats.uid),
                backgroundImage: mixStats.safetyPhotoWidget,
              ),
              title: Text(mixStats.safetyOwnerUsername),
              subtitle: Text(mixStats.power.toString(), style: const TextStyle(fontFamily: "zig")),
              trailing: const Icon(Icons.favorite_rounded),
            ))
        .toList();
  }

  void _nextPage() async {
    final result = await MixStatsService(Dio()).leaderboard(lastCursor);
    if (result.error != null) {
      return setState(() {
        error = error;
        isLoading = false;
      });
    }

    if (result.value == null) throw Exception("Fatal error, leaderboard response data can't be null");
    final leaderboard = result.value!;
    final leaderboardTiles = _convertLeaderboardDataToMixStatsWidget(leaderboard.leaderboard);
    setState(() {
      this.leaderboardTiles = [...this.leaderboardTiles, ...leaderboardTiles];
      hasNextPage = leaderboard.hasNextPage;
      lastCursor = leaderboard.lastUidCursor;
      isLoading = false;
    });
  }

  void _getData() async {
    final result = await MixStatsService(Dio()).leaderboard(null);
    if (result.error != null) {
      return setState(() {
        error = result.error;
        isLoading = false;
      });
    }

    if (result.value == null) throw Exception("Fatal error, leaderboard response data can't be null");
    final leaderboard = result.value!;
    final leaderboardTiles = _convertLeaderboardDataToMixStatsWidget(leaderboard.leaderboard);

    setState(() {
      this.leaderboardTiles = leaderboardTiles;
      hasNextPage = leaderboard.hasNextPage;
      lastCursor = leaderboard.lastUidCursor;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    if (error != null && !isLoading) return const Text("Error while retrieving leaderboard data");

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 400,
          child: ListView(
            children: isLoading ? [] : leaderboardTiles,
          ),
        ),
        const Divider(color: Colors.black),
        hasNextPage
            ? TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 2),
                  minimumSize: const Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () => _nextPage(),
                child: const Text("Show more"),
              )
            : const SizedBox(),
        const SizedBox(height: 8)
      ],
    );
  }
}

/**
 * List.generate(
        15,
        (i) => ListTile(
              leading: CircleAvatar(
                key: ValueKey(i),
                child: const Text("T"),
              ),
              title: const Text("Title"),
              subtitle: const Text("999", style: TextStyle(fontFamily: "zig")),
              trailing: const Icon(Icons.favorite_rounded),
            )),
  )
 */
