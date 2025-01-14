import 'package:flutter/material.dart';

class BackgroundFlow extends StatelessWidget {
  final Widget child;
  const BackgroundFlow({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Color.fromARGB(255, 27, 24, 27),
      height: size.height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            width: size.width,
            child: Image.asset("assets/images/top1.png"),
          ),
          Positioned(
            top: 0,
            right: 0,
            width: size.width,
            child: Image.asset("assets/images/top2.png"),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            width: size.width,
            child: Image.asset("assets/images/bottom1.png"),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            width: size.width,
            child: Image.asset("assets/images/bottom2.png"),
          ),
          child,
        ],
      ),
    );
  }
}
