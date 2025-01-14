import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CloudBackground extends StatelessWidget {
  final Widget child;
  const CloudBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Transform.scale(
            scale: 1.2,
            child: SvgPicture.asset(
              'assets/cloud.svg',
              allowDrawingOutsideViewBox: true,
              alignment: const Alignment(0, 0),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Transform.scale(
            scale: 1.2,
            child: SvgPicture.asset(
              'assets/cloud.svg',
              alignment: const Alignment(0, 0.35),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Transform.scale(
            scale: 1.4,
            child: SvgPicture.asset(
              'assets/cloud.svg',
              alignment: const Alignment(0, 0.6),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
