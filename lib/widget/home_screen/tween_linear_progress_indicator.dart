import 'package:flutter/material.dart';

class TweenLinearProgressIndicator extends StatefulWidget {
  final double value;
  final double maxValue;
  final int toStringFixed;
  final int duration;
  const TweenLinearProgressIndicator({
    super.key,
    required this.value,
    required this.maxValue,
    this.duration = 2,
    this.toStringFixed = 0,
  });

  @override
  State<TweenLinearProgressIndicator> createState() => _TweenLinearProgressIndicator();
}

class _TweenLinearProgressIndicator extends State<TweenLinearProgressIndicator> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(seconds: widget.duration))
      ..addListener(() => setState(() {}));

    animation = Tween(begin: 0.0, end: widget.value / widget.maxValue)
        .animate(CurvedAnimation(parent: controller, curve: Curves.fastEaseInToSlowEaseOut));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 8.0,
      child: LinearProgressIndicator(
        backgroundColor: const Color.fromARGB(255, 255, 254, 255),
        valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 34, 36, 48)),
        value: animation.value,
        semanticsLabel: "Linear progress indicator",
      ),
    );
  }
}
