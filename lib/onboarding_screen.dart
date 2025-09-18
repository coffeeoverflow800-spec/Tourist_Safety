import 'package:flutter/material.dart';
import 'package:tourist_safety_app/home_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                // Shield icon
                Container(
                  padding: const EdgeInsets.all(
                    14,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(
                      0xFF1877F2,
                    ),
                    borderRadius:
                        BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.shield_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 18),

                // Title
                const Text(
                  'SafeTravel',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your trusted companion for safe journeys',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 26),

                // Feature cards
                _featureCard(
                  context,
                  color: Colors.red.shade100,
                  icon:
                      Icons.warning_amber_rounded,
                  iconColor: Colors.red,
                  text: 'Instant SOS alerts',
                ),
                const SizedBox(height: 12),
                _featureCard(
                  context,
                  color: Colors.blue.shade100,
                  icon: Icons.location_on_rounded,
                  iconColor: Colors.blue,
                  text:
                      'Real-time location tracking',
                ),
                const SizedBox(height: 12),
                _featureCard(
                  context,
                  color: Colors.green.shade100,
                  icon:
                      Icons.verified_user_rounded,
                  iconColor: Colors.green,
                  text: 'Safety ratings & alerts',
                ),

                const SizedBox(height: 30),

                // Get Started button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/login',
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF1E6BFF),
                      padding:
                          const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                              12,
                            ),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Change Language button
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.language,
                    size: 18,
                    color: Color(0xFF3A88FF),
                  ),
                  label: const Text(
                    'Change Language',
                    style: TextStyle(
                      color: Color(0xFF3A88FF),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _featureCard(
    BuildContext context, {
    required Color color,
    required IconData icon,
    required Color iconColor,
    required String text,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
