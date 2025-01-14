import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maze_conquest_sp/model/hero.dart' as _;
import 'package:maze_conquest_sp/service/server_response.dart';
import 'package:maze_conquest_sp/service/user_service.dart';
import 'package:maze_conquest_sp/widget/tween_number.dart';

class LvBlock extends StatefulWidget {
  final User user;
  const LvBlock({super.key, required this.user});

  @override
  State<LvBlock> createState() => _LvBlockState();
}

class _LvBlockState extends State<LvBlock> {
  bool _isLoading = true;
  _.Hero? strongestHero;

  void _getData() async {
    final (hero, error) = await UserService.getUserStrongestHero(widget.user.uid);
    if (error != null) {
      ServerResponse.snackBarErrorResponse(context, "Failed to get ${widget.user.displayName} hero data");
      setState(() => _isLoading = false);
      return;
    }

    setState(() {
      _isLoading = false;
      strongestHero = hero;
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
        color: Color.fromARGB(255, 182, 243, 106),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lv",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800),
          ),
          Row(
            children: [
              Image.asset('assets/images/shield.png'),
              const SizedBox(width: 8),
              _isLoading
                  ? Text("-",
                      style:
                          Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 48.0))
                  : TweenNumber(
                      value: strongestHero?.level.toDouble() ?? 0,
                      style:
                          Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 48.0))
            ],
          ),
          const SizedBox(height: 2),
          Text(
            "Your highest hero level is '${strongestHero?.name ?? "-"}'",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.black,
                  fontSize: 12.0,
                ),
          ),
          _isLoading
              ? Text(
                  "Exp as - / -",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                )
              : TweenNumber(
                  value: strongestHero?.currentExp.toDouble() ?? 0,
                  useCustomText: true,
                  leftText: "Exp as ",
                  rightText: " / ${strongestHero?.expToLevel ?? "-"}",
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
