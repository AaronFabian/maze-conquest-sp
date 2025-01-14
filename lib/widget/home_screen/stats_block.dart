import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StatsBlock extends StatelessWidget {
  const StatsBlock({super.key});

  void _showHelpUsingSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        color: Color.fromARGB(255, 148, 218, 251),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "STATS",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onLongPress: () => _showHelpUsingSnackBar(context, "All heroes"),
                child: IconButton(
                  icon: const Icon(Icons.person_pin_outlined),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                ),
              ),
              GestureDetector(
                onLongPress: () => _showHelpUsingSnackBar(context, "Party list"),
                child: IconButton(
                  icon: const Icon(Icons.people_alt_outlined),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onLongPress: () => _showHelpUsingSnackBar(context, "Player inventory"),
                child: IconButton(
                  icon: const Icon(Icons.inventory_2_outlined),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                ),
              ),
              GestureDetector(
                onLongPress: () => _showHelpUsingSnackBar(context, "Logout player"),
                child: IconButton(
                  icon: const Icon(Icons.logout),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () async {
                    try {
                      final auth = FirebaseAuth.instance;
                      await auth.signOut();
                      context.goNamed("login");
                    } catch (e) {
                      _showHelpUsingSnackBar(context, "Failed to logout !");
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
