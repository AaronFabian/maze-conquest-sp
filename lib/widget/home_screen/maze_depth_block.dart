import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maze_conquest_sp/model/world.dart';
import 'package:maze_conquest_sp/service/use_case/statistic_service.dart';
import 'package:maze_conquest_sp/service/use_case/user_service.dart';
import 'package:maze_conquest_sp/widget/tween_number.dart';

class MazeDepthBlock extends StatefulWidget {
  final User user;
  const MazeDepthBlock({super.key, required this.user});

  @override
  State<MazeDepthBlock> createState() => _MazeDepthBlockState();
}

class _MazeDepthBlockState extends State<MazeDepthBlock> {
  bool _isUserDataLoading = true;
  bool _isStatisticDataLoading = true;
  World? _maze;
  double? _userLevelPercentile;
  double? _usersLevelAverage;

  void _getUserData() async {
    final result = await UserService(Dio()).getUserMazeLevel(widget.user.uid);
    setState(() {
      _isUserDataLoading = false;
      _maze = result.value;
    });
  }

  void _getStatistic() async {
    final result = await StatisticService(Dio()).getPercentileFromLevel(widget.user.uid);
    if (result.error != null) {
      setState(() {
        _isStatisticDataLoading = false;
      });
      return;
    }

    final userStatistic = result.value!.firstWhere((statistic) => statistic.label == "user");
    final usersLevelAverageStatistic = result.value!.firstWhere((statistic) => statistic.label == "level");
    setState(() {
      _userLevelPercentile = userStatistic.value;
      _usersLevelAverage = usersLevelAverageStatistic.value;
      _isStatisticDataLoading = false;
    });
  }

  @override
  void initState() {
    _getUserData();
    _getStatistic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        color: Color.fromARGB(255, 201, 160, 255),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "MAZE DEPTH",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800),
          ),
          Row(
            children: [
              Image.asset("assets/images/maze.png"),
              const SizedBox(width: 8),
              _isUserDataLoading
                  ? Text("-",
                      style:
                          Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 48))
                  : TweenNumber(
                      value: _maze?.level.toDouble() ?? 0,
                      style:
                          Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 48))
            ],
          ),
          const SizedBox(height: 2),
          _isStatisticDataLoading
              ? Text(
                  "Global avg. maze depth explored is -",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                )
              : Text(
                  "Global avg. maze depth explored is ${_usersLevelAverage ?? "E"}",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                ),
          _isStatisticDataLoading
              ? Text(
                  "You are top -%",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                )
              : Text(
                  "You are top ${_userLevelPercentile?.toStringAsFixed(2) ?? "E"}%",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                )
        ],
      ),
    );
  }
}
