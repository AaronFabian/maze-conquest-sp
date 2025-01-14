import 'package:flutter/material.dart';

const Color borderColor = Color.fromARGB(255, 117, 36, 56);
const Color textColor = Color.fromARGB(255, 0, 0, 0);
const Color splashColor = Color.fromARGB(200, 229, 225, 255);
const Color iconColor = borderColor; // Reusing borderColor for the icon color

class CardFeature extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function() onTap;
  const CardFeature({super.key, required this.icon, required this.text, required this.onTap});

  List<Widget> cardContent(BuildContext ctx) {
    return [
      const SizedBox(height: 12),
      Row(
        children: [
          const SizedBox(width: 10),
          Icon(
            icon,
            color: Colors.deepPurple,
            size: 20.0,
          ),
        ],
      ),
      const SizedBox(height: 32),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          text,
          style: Theme.of(ctx).textTheme.bodySmall!.copyWith(
                color: textColor,
              ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        splashColor: splashColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: cardContent(context),
        ),
      ),
    );
  }
}
