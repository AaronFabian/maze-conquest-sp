import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maze_conquest_sp/service/response/server_response.dart';
import 'package:maze_conquest_sp/service/use_case/mix_stats_service.dart';
import 'package:maze_conquest_sp/service/use_case/statistic_service.dart';
import 'package:maze_conquest_sp/widget/tween_number.dart';

class PowerBlock extends StatefulWidget {
  final User user;
  const PowerBlock({super.key, required this.user});

  @override
  State<PowerBlock> createState() => _PowerBlockState();
}

class _PowerBlockState extends State<PowerBlock> {
  bool _isLoading = true;
  int? userPower;

  bool _isStatisticDataLoading = true;
  double? _userPowerPercentile;
  double? _usersPowerAverage;

  void _getData() async {
    final result = await MixStatsService(Dio()).getMixStats(widget.user.uid);
    if (result.error != null) {
      ServerResponse.snackBarErrorResponse(context, result.error.toString());
      setState(() => _isLoading = false);
      return;
    }

    userPower = result.value!.power;
    setState(() => _isLoading = false);
  }

  void _getStatistic() async {
    final result = await StatisticService(Dio()).getPercentileFromPower(widget.user.uid);
    if (result.error != null) {
      setState(() => _isStatisticDataLoading = false);
      return;
    }

    final userPercentileStatistic = result.value!.firstWhere((statistic) => statistic.label == "user");
    final usersPowerAverageStatistic = result.value!.firstWhere((statistic) => statistic.label == "power");
    setState(() {
      _userPowerPercentile = userPercentileStatistic.value;
      _usersPowerAverage = usersPowerAverageStatistic.value;
      _isStatisticDataLoading = false;
    });
  }

  @override
  void initState() {
    _getData();
    _getStatistic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          color: Color.fromARGB(255, 255, 154, 98),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "POWER",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800),
            ),
            Row(
              children: [
                Image.asset('assets/images/power.png'),
                _isLoading
                    ? Text("-",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.w500, fontSize: 48.0))
                    : TweenNumber(
                        value: userPower?.toDouble() ?? 0,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.w500, fontSize: 48.0))
              ],
            ),
            const SizedBox(height: 2),
            Text(
                "Global avg. power currently is ${_isStatisticDataLoading ? "-" : _usersPowerAverage?.toStringAsFixed(2) ?? "E"}",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black,
                      fontSize: 12.0,
                    )),
            Text("You are top ${_isStatisticDataLoading ? "-" : _userPowerPercentile?.toStringAsFixed(2) ?? "E"}",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    )),
          ],
        ),
      ),
    );
  }
}
