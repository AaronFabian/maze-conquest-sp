import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:maze_conquest_sp/screen/remote_screen.dart';
import 'firebase_options.dart';

import 'package:maze_conquest_sp/screen/login_screen.dart';
import 'package:maze_conquest_sp/screen/home_screen.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 235, 235, 240),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 11, 11, 11),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'remote_map/:token',
            name: 'remote_map',
            builder: (context, state) => RemoteScreen(state.pathParameters["token"]),
          ),
          GoRoute(
            path: 'all_heroes',
            name: 'all_heroes',
            builder: (context, state) => const Text("All heroes"),
          ),
          GoRoute(
            path: 'party',
            name: 'party',
            builder: (context, state) => const Text("Party screen"),
          ),
          GoRoute(
            path: 'inventory',
            name: 'inventory',
            builder: (context, state) => const Text("Inventory screen"),
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Maze Conquest CA',
      routerConfig: _router,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        scaffoldBackgroundColor: Colors.transparent,
        iconTheme: const IconThemeData().copyWith(
          size: 35.0,
          color: Colors.white,
        ),
        textTheme: const TextTheme().copyWith(
          bodySmall: const TextStyle(color: Colors.black),
        ),
      ),
      darkTheme: ThemeData().copyWith(
        colorScheme: kDarkColorScheme,
        scaffoldBackgroundColor: Colors.transparent,
        iconTheme: const IconThemeData().copyWith(
          size: 35.0,
          color: Colors.blueGrey.shade900,
        ),
        textTheme: const TextTheme().copyWith(
          bodySmall: TextStyle(color: Colors.grey.shade700),
          titleMedium: const TextStyle(color: Colors.black),
          titleLarge: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

// routeInformationParser: _router.routeInformationParser,
// routeInformationProvider: _router.routeInformationProvider,
// routerDelegate: _router.routerDelegate,
