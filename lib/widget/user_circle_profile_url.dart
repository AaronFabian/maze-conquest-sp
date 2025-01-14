import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget userCircleProfileUrl(User user) {
    return CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(user.photoURL!),
                  );
  
}