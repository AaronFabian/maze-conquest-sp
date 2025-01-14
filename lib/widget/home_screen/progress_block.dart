import 'package:flutter/material.dart';
import 'package:maze_conquest_sp/widget/home_screen/tween_linear_progress_indicator.dart';
import 'package:maze_conquest_sp/widget/tween_number.dart';

class ProgressBlock extends StatelessWidget {
  const ProgressBlock({super.key});

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
              TweenNumber(
                value: 1,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 48.0),
              ),
              const SizedBox(width: 14.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Text(
                      "from top position of 1225 players",
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
          const TweenLinearProgressIndicator(value: 85, maxValue: 100),
        ],
      ),
    );
  }
}
