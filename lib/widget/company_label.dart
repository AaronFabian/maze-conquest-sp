import 'package:flutter/material.dart';

Widget companyLabel(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(3),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.copyright_outlined,
          size: 12.0,
          color: Colors.white,
        ),
        const SizedBox(width: 8.0),
        Text(
          "International Paradigm",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
        ),
      ],
    ),
  );
}
