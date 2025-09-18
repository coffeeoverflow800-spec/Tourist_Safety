// lib/screens/loading_screen.dart
import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() =>
      _LoadingScreenState();
}

class _LoadingScreenState
    extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // Auto navigate after 3 seconds
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>
                const OnboardingScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1877F2),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.shield_rounded,
                color: Color(0xFF1877F2),
                size: 60,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'SafeTravel',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Preparing your secure journey...',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
