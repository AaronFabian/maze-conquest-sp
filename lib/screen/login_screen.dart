import 'package:flutter/material.dart';
import 'package:maze_conquest_sp/widget/background_flow.dart';
import 'package:maze_conquest_sp/widget/company_label.dart';
import 'package:maze_conquest_sp/widget/login_screen/login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BackgroundFlow(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 18.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Maze Conquest",
                  style: TextStyle(fontFamily: 'zig', fontSize: 32),
                ),
                const Text(
                  "Companion app",
                  style: TextStyle(fontFamily: 'zig', fontSize: 14),
                ),
                const SizedBox(height: 32),
                const LoginButton(),
                const SizedBox(height: 32),
                companyLabel(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
