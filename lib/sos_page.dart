import 'package:flutter/material.dart';
import 'package:tourist_safety_app/alerts_page.dart';
import 'package:tourist_safety_app/card_home_page.dart';
import 'package:tourist_safety_app/home_page.dart';
import 'package:tourist_safety_app/maps_page.dart';
import 'package:tourist_safety_app/profile_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MySosPage extends StatefulWidget {
  const MySosPage({super.key});

  @override
  State<MySosPage> createState() =>
      _MySosPageState();
}

class _MySosPageState extends State<MySosPage> {
  final TextEditingController _messageController =
      TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _makePhoneCall(
    String phoneNumber,
  ) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _shareLocation() async {
    // Implement location sharing functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Location shared successfully',
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future<void> _callHelp() async {
    // Implement emergency call functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Calling emergency services...',
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Emergency SOS',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // SOS Button
            GestureDetector(
              onTap: () {
                // Handle SOS button press
                _showSOSConfirmation();
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red
                          .withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning,
                      color: Colors.white,
                      size: 50,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'SOS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Press for emergency assistance',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 40),

            // Optional Message
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Optional Message',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller:
                        _messageController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText:
                          'Describe your emergency (optional)',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                              8,
                            ),
                        borderSide: BorderSide(
                          color:
                              Colors.grey[300]!,
                        ),
                      ),
                      enabledBorder:
                          OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(
                                  8,
                                ),
                            borderSide:
                                BorderSide(
                                  color: Colors
                                      .grey[300]!,
                                ),
                          ),
                      focusedBorder:
                          OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(
                                  8,
                                ),
                            borderSide:
                                const BorderSide(
                                  color:
                                      Colors.blue,
                                ),
                          ),
                      contentPadding:
                          const EdgeInsets.all(
                            16,
                          ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Quick Help Actions
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Quick Help Actions',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: _callHelp,
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFFE8F5E8,
                              ),
                              borderRadius:
                                  BorderRadius.circular(
                                    8,
                                  ),
                            ),
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Colors
                                      .green,
                                  size: 24,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Call Help',
                                  style: TextStyle(
                                    color: Colors
                                        .green,
                                    fontWeight:
                                        FontWeight
                                            .w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: _shareLocation,
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFFE3F2FD,
                              ),
                              borderRadius:
                                  BorderRadius.circular(
                                    8,
                                  ),
                            ),
                            child: const Column(
                              children: [
                                Icon(
                                  Icons
                                      .share_location,
                                  color:
                                      Colors.blue,
                                  size: 24,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Share Location',
                                  style: TextStyle(
                                    color: Colors
                                        .blue,
                                    fontWeight:
                                        FontWeight
                                            .w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Emergency Contacts
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Emergency Contacts',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildContactItem(
                    'M',
                    'Mom',
                    '+1 (555) 123-4567',
                    Colors.blue,
                  ),
                  const SizedBox(height: 12),
                  _buildContactItem(
                    'D',
                    'Dad',
                    '+1 (555) 987-6543',
                    Colors.green,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Local Emergency Services
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Local Emergency Services',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildServiceItem(
                    'Police',
                    '911',
                    Colors.blue,
                  ),
                  const SizedBox(height: 12),
                  _buildServiceItem(
                    'Hospital',
                    'Emergency',
                    Colors.green,
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 100,
            ), // Space for bottom navigation
          ],
        ),
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
            SizedBox(
              width: 60,
              child: Card(
                elevation: 6,
                color: Color(0xFFEFF6FF),
                child: NavigationIcons(
                  icon: Icons.warning_amber,
                  text: 'SOS',
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
                        MyAlertsPage(),
                  ),
                );
              },
              child: NavigationIcons(
                icon: Icons.notifications_none,
                text: 'Alerts',
                color: Colors.black,
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

  Widget _buildContactItem(
    String initial,
    String name,
    String phone,
    Color color,
  ) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Center(
            child: Text(
              initial,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                phone,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => _makePhoneCall(phone),
          icon: const Icon(
            Icons.phone,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildServiceItem(
    String service,
    String action,
    Color color,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            service,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (service == 'Police') {
              _makePhoneCall('911');
            } else {
              // Handle hospital emergency call
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Calling emergency services...',
                  ),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
          ),
          child: Text(
            action == '911'
                ? 'Call 911'
                : 'Call Emergency',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  void _showSOSConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Emergency SOS'),
          content: const Text(
            'Are you sure you want to send an emergency alert?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Handle emergency SOS activation
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Emergency SOS activated!',
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Send SOS'),
            ),
          ],
        );
      },
    );
  }
}
