import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final IconData iconData;
  final String navTitle;
  final Color color;
  final void Function() onPressed;
  final void Function() onHelpPressed;
  const NavigationButton({
    super.key,
    required this.iconData,
    required this.navTitle,
    required this.onPressed,
    required this.onHelpPressed,
    this.color = Colors.white70,
  });

  WidgetStateProperty<Color> getColor(Color whileIdle, Color whilePressed) {
    return WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return whilePressed;
      } else {
        return whileIdle;
      }
    });
  }

  Widget mainIcon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            IconButton(
              icon: Icon(iconData),
              color: Colors.white,
              onPressed: onPressed,
            ),
            helpIcon(),
          ],
        ),
        Text(navTitle)
      ],
    );
  }

  Widget helpIcon() {
    return Positioned(
      right: -2.0,
      top: -2.0,
      child: SizedBox(
        width: 24.0,
        height: 24.0,
        child: IconButton(
          icon: const Icon(Icons.help_outline),
          iconSize: 24.0,
          color: color,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(maxWidth: 24.0, maxHeight: 24.0),
          onPressed: onHelpPressed,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return mainIcon();
  }
}
