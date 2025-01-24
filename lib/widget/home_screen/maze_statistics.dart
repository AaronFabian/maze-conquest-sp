import 'package:flutter/material.dart';

class MazeStatistics extends StatelessWidget {
  const MazeStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Global avg. maze depth explored is ${23}",
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
        )
      ],
    );
  }
}
