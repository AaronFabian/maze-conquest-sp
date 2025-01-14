import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maze_conquest_sp/model/world.dart';
import 'package:maze_conquest_sp/service/user_service.dart';
import 'package:maze_conquest_sp/widget/tween_number.dart';

class MazeDepthBlock extends StatefulWidget {
  final User user;
  const MazeDepthBlock({super.key, required this.user});

  @override
  State<MazeDepthBlock> createState() => _MazeDepthBlockState();
}

class _MazeDepthBlockState extends State<MazeDepthBlock> {
  bool _isLoading = true;
  World? _maze;

  void _getData() async {
    final maze = await UserService.getUserMazeLevel(widget.user.uid);
    setState(() {
      _isLoading = false;
      _maze = maze;
    });
  }

  @override
  void initState() {
    _getData();
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
              _isLoading
                  ? Text("-",
                      style:
                          Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 48.0))
                  : TweenNumber(
                      value: _maze?.level.toDouble() ?? 0,
                      style:
                          Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 48.0))
            ],
          ),
          const SizedBox(height: 2),
          Text(
            "Average depth of player explored maze is ${23}",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.black,
                  fontSize: 12.0,
                ),
          ),
          Text(
            "You are top ${1}%",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
