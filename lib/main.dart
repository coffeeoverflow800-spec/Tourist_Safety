import 'package:flutter/material.dart';
import 'package:tourist_safety_app/home_page.dart';

import 'package:tourist_safety_app/loading_screen.dart';
import 'package:tourist_safety_app/login_screen.dart';
import 'package:tourist_safety_app/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guardian Tool',
      routes: {
        '/loading': (context) =>
            const LoadingScreen(),
        '/onboarding': (context) =>
            const OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => const MyHomePage(),
      },

      theme: ThemeData(
        fontFamily: 'helvetica',
        colorSchemeSeed: Colors.white,
        useMaterial3: true,
      ),
      home: const LoadingScreen(),
    );
  }
}
