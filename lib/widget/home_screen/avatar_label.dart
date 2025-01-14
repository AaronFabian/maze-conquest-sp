import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AvatarLabel extends StatelessWidget {
  final User user;
  const AvatarLabel({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 18.0,
          backgroundImage: NetworkImage(user.photoURL!),
        ),
        const SizedBox(width: 14.0),
        Text(user.displayName!, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
