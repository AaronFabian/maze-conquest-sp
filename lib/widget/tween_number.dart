import 'package:flutter/material.dart';

class TweenNumber extends StatefulWidget {
  final double value;
  final TextStyle style;
  final int toStringFixed;
  final int duration;

  final bool useCustomText;
  final String leftText;
  final String rightText;
  const TweenNumber({
    super.key,
    required this.value,
    required this.style,
    this.duration = 1,
    this.toStringFixed = 0,

    // If use custom text
    this.useCustomText = false,
    this.leftText = "",
    this.rightText = "",
  });

  @override
  State<TweenNumber> createState() => _TweenNumberState();
}

class _TweenNumberState extends State<TweenNumber> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(seconds: widget.duration))
      ..addListener(() {
        // Marks the widget tree as dirty
        setState(() {});
      });
    animation = Tween(begin: 0.0, end: widget.value).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.useCustomText) {
      return Text(
        widget.leftText + animation.value.toStringAsFixed(widget.toStringFixed) + widget.rightText,
        style: widget.style,
      );
    }

    return Text(animation.value.toStringAsFixed(widget.toStringFixed), style: widget.style);
  }
}
