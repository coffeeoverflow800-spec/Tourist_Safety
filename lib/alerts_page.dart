import 'package:flutter/material.dart';
import 'package:tourist_safety_app/card_home_page.dart';
import 'package:tourist_safety_app/home_page.dart';
import 'package:tourist_safety_app/maps_page.dart';
import 'package:tourist_safety_app/profile_page.dart';
import 'package:tourist_safety_app/sos_page.dart';

class MyAlertsPage extends StatelessWidget {
  const MyAlertsPage({super.key});

  final List<AlertItem> alerts = const [
    AlertItem(
      icon: Icons.cloud_outlined,
      title: 'Heavy Rain Warning',
      description:
          'Heavy rainfall expected in Manhattan area. Avoid low-lying areas and use public transportation.',
      location: 'Manhattan, NYC',
      timeAgo: '2 hours ago',
      severity: AlertSeverity.high,
      color: Colors.red,
      backgroundColor: Color(0xFFFFEBEE),
    ),
    AlertItem(
      icon: Icons.warning_outlined,
      title: 'Tourist Scam Alert',
      description:
          'Increased reports of fake taxi scams near Times Square. Only use licensed yellow cabs or rideshare apps.',
      location: 'Times Square',
      timeAgo: '4 hours ago',
      severity: AlertSeverity.medium,
      color: Colors.orange,
      backgroundColor: Color(0xFFFFF8E1),
    ),
    AlertItem(
      icon: Icons.location_on_outlined,
      title: 'Road Closure',
      description:
          'Broadway between 42nd and 46th Street closed due to construction work.',
      location: 'Broadway',
      timeAgo: '6 hours ago',
      severity: AlertSeverity.low,
      color: Colors.blue,
      backgroundColor: Color(0xFFE3F2FD),
    ),
    AlertItem(
      icon: Icons.local_hospital_outlined,
      title: 'Medical Emergency',
      description:
          'Ambulance activity reported near Central Park. Delays expected on surrounding roads.',
      location: 'Central Park',
      timeAgo: '8 hours ago',
      severity: AlertSeverity.high,
      color: Colors.red,
      backgroundColor: Color(0xFFFFEBEE),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              'Safety Alerts',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              'Stay informed about your area',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Handle filter action
            },
            icon: const Icon(
              Icons.tune,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: alerts.length,
        itemBuilder: (context, index) {
          return AlertCard(alert: alerts[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle location/refresh action
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.my_location),
      ),
      bottomNavigationBar: Material(
        elevation: 10,
        shadowColor: Colors.black,
        color: Colors.white,
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround,
          crossAxisAlignment:
              CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MyHomePage(),
                  ),
                );
              },
              child: NavigationIcons(
                icon: Icons.home_outlined,
                text: 'Home',
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MyMapsPage(),
                  ),
                );
              },
              child: NavigationIcons(
                icon: Icons.location_on_outlined,
                text: 'Maps',
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MySosPage(),
                  ),
                );
              },
              child: NavigationIcons(
                icon: Icons.warning_amber,
                text: 'SOS',
                color: Colors.black,
              ),
            ),
            Container(
              width: 60,
              child: Card(
                elevation: 6,
                color: Color(0xFFEFF6FF),
                child: NavigationIcons(
                  icon: Icons.notifications_none,
                  text: 'Alerts',
                  color: Color(0xFF155DFC),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MyProfilePge(),
                  ),
                );
              },
              child: NavigationIcons(
                icon: Icons.person_outline,
                text: 'Profile',
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlertCard extends StatelessWidget {
  final AlertItem alert;

  const AlertCard({
    super.key,
    required this.alert,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: alert.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: alert.color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: alert.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            child: Icon(
              alert.icon,
              color: alert.color,
              size: 20,
            ),
          ),

          const SizedBox(width: 12),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                // Title and severity badge
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        alert.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight:
                              FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                      decoration: BoxDecoration(
                        color: alert.color,
                        borderRadius:
                            BorderRadius.circular(
                              12,
                            ),
                      ),
                      child: Text(
                        alert.severity.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight:
                              FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Description
                Text(
                  alert.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 12),

                // Location and time
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 14,
                      color: Colors.grey[500],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      alert.location,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      alert.timeAgo,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AlertItem {
  final IconData icon;
  final String title;
  final String description;
  final String location;
  final String timeAgo;
  final AlertSeverity severity;
  final Color color;
  final Color backgroundColor;

  const AlertItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.location,
    required this.timeAgo,
    required this.severity,
    required this.color,
    required this.backgroundColor,
  });
}

enum AlertSeverity { high, medium, low }
