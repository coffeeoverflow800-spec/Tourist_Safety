import 'package:flutter/material.dart';
import 'package:tourist_safety_app/alerts_page.dart';
import 'package:tourist_safety_app/home_page.dart';
import 'package:tourist_safety_app/maps_page.dart';
import 'package:tourist_safety_app/sos_page.dart';
import 'card_home_page.dart';

class MyProfilePge extends StatefulWidget {
  const MyProfilePge({super.key});

  @override
  State<MyProfilePge> createState() =>
      _MyProfilePgeState();
}

class _MyProfilePgeState
    extends State<MyProfilePge> {
  bool locationSharing = true;
  bool pushNotifications = true;
  bool autoSOS = false;
  bool biometricLock = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(16),
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
                children: [
                  Row(
                    children: [
                      // Profile Avatar
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                              BorderRadius.circular(
                                16,
                              ),
                        ),
                        child: const Center(
                          child: Text(
                            'S',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Profile Info
                      const Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                          children: [
                            Text(
                              'Sarah Johnson',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight:
                                    FontWeight
                                        .w600,
                                color: Colors
                                    .black87,
                              ),
                            ),
                            Text(
                              'sarah.johnson@email.com',
                              style: TextStyle(
                                fontSize: 14,
                                color:
                                    Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Badges
                  Row(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius:
                              BorderRadius.circular(
                                12,
                              ),
                          border: Border.all(
                            color: Colors
                                .green[200]!,
                          ),
                        ),
                        child: Row(
                          mainAxisSize:
                              MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.verified,
                              size: 12,
                              color: Colors
                                  .green[600],
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'KYC Verified',
                              style: TextStyle(
                                color: Colors
                                    .green[600],
                                fontSize: 11,
                                fontWeight:
                                    FontWeight
                                        .w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius:
                              BorderRadius.circular(
                                12,
                              ),
                          border: Border.all(
                            color:
                                Colors.blue[200]!,
                          ),
                        ),
                        child: Text(
                          'Premium',
                          style: TextStyle(
                            color:
                                Colors.blue[600],
                            fontSize: 11,
                            fontWeight:
                                FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Edit Profile Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Handle edit profile
                      },
                      icon: const Icon(
                        Icons.person,
                        size: 18,
                      ),
                      label: const Text(
                        'Edit Profile',
                      ),
                      style: OutlinedButton.styleFrom(
                        padding:
                            const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                                8,
                              ),
                        ),
                        side: BorderSide(
                          color:
                              Colors.grey[300]!,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Identity Verified Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius:
                    BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.green[200]!,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.all(
                              8,
                            ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                              BorderRadius.circular(
                                20,
                              ),
                        ),
                        child: const Icon(
                          Icons.verified_user,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                          children: [
                            Text(
                              'Identity Verified',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                    FontWeight
                                        .w600,
                                color: Colors
                                    .black87,
                              ),
                            ),
                            Text(
                              'Full access to all safety features',
                              style: TextStyle(
                                fontSize: 14,
                                color:
                                    Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                              BorderRadius.circular(
                                12,
                              ),
                        ),
                        child: const Text(
                          'Active',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight:
                                FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text(
                        'Verified on:',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'March 15, 2024',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight:
                              FontWeight.w500,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Emergency Contacts Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(16),
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
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 20,
                        color: Colors.black87,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Emergency Contacts',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildContactItem(
                    'M',
                    'Mom',
                    '+1 (555) 123-4567',
                    'Primary',
                    Colors.blue,
                  ),
                  const SizedBox(height: 12),
                  _buildContactItem(
                    'D',
                    'Dad',
                    '+1 (555) 987-6543',
                    'Secondary',
                    Colors.green,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Handle add emergency contact
                      },
                      icon: const Icon(
                        Icons.phone,
                        size: 18,
                      ),
                      label: const Text(
                        'Add Emergency Contact',
                      ),
                      style: OutlinedButton.styleFrom(
                        padding:
                            const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                                8,
                              ),
                        ),
                        side: BorderSide(
                          color:
                              Colors.grey[300]!,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Medical Information Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(16),
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
                  const Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        size: 20,
                        color: Colors.red,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Medical Information',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildMedicalItem(
                    'Blood Type:',
                    'O+',
                    Colors.red[50]!,
                  ),
                  const SizedBox(height: 12),
                  _buildMedicalItem(
                    'Allergies:',
                    'Penicillin',
                    Colors.orange[50]!,
                  ),
                  const SizedBox(height: 12),
                  _buildMedicalItem(
                    'Medical Conditions:',
                    'None',
                    Colors.green[50]!,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Handle update medical info
                      },
                      icon: const Icon(
                        Icons.favorite,
                        size: 18,
                      ),
                      label: const Text(
                        'Update Medical Info',
                      ),
                      style: OutlinedButton.styleFrom(
                        padding:
                            const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                                8,
                              ),
                        ),
                        side: BorderSide(
                          color:
                              Colors.grey[300]!,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Privacy & Safety Settings Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(16),
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
                  const Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 20,
                        color: Colors.black87,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Privacy & Safety Settings',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildSettingItem(
                    'Location Sharing',
                    'Share location with emergency contacts',
                    locationSharing,
                    (value) => setState(
                      () =>
                          locationSharing = value,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSettingItem(
                    'Push Notifications',
                    'Receive safety alerts and updates',
                    pushNotifications,
                    (value) => setState(
                      () => pushNotifications =
                          value,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSettingItem(
                    'Auto SOS',
                    'Automatic SOS if no movement detected',
                    autoSOS,
                    (value) => setState(
                      () => autoSOS = value,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSettingItem(
                    'Biometric Lock',
                    'Use fingerprint/face ID for app access',
                    biometricLock,
                    (value) => setState(
                      () => biometricLock = value,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Additional Options
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(16),
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
                children: [
                  _buildOptionItem(
                    Icons.map,
                    'Download Offline Maps',
                    'Access maps without internet',
                    Colors.blue,
                  ),
                  const Divider(height: 32),
                  _buildOptionItem(
                    Icons.notifications,
                    'Notification Settings',
                    'Manage alert preferences',
                    Colors.green,
                  ),
                  const Divider(height: 32),
                  _buildOptionItem(
                    Icons.security,
                    'Privacy & Security',
                    'Data protection settings',
                    Colors.purple,
                  ),
                  const Divider(height: 32),
                  _buildOptionItem(
                    Icons.help,
                    'Help & Support',
                    'Get assistance 24/7',
                    Colors.orange,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Account Management Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius:
                    BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.red[200]!,
                ),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Account Management',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Handle sign out
                      },
                      icon: const Icon(
                        Icons.logout,
                        size: 18,
                        color: Colors.red,
                      ),
                      label: const Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding:
                            const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                                8,
                              ),
                        ),
                        side: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Handle delete account
                      },
                      icon: const Icon(
                        Icons.person_remove,
                        size: 18,
                        color: Colors.red,
                      ),
                      label: const Text(
                        'Delete Account',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding:
                            const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                                8,
                              ),
                        ),
                        side: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
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
            SizedBox(
              width: 60,
              child: Card(
                elevation: 6,
                color: Color(0xFFEFF6FF),
                child: NavigationIcons(
                  icon: Icons.person_outline,
                  text: 'Profile',
                  color: Color(0xFF155DFC),
                ),
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
    String type,
    Color color,
  ) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Center(
            child: Text(
              initial,
              style: const TextStyle(
                color: Colors.white,
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
              Container(
                padding:
                    const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius:
                      BorderRadius.circular(8),
                ),
                child: Text(
                  type,
                  style: TextStyle(
                    fontSize: 10,
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            // Handle edit contact
          },
          child: const Text(
            'Edit',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMedicalItem(
    String label,
    String value,
    Color backgroundColor,
  ) {
    Color textColor = Colors.black87;
    if (label.contains('Blood'))
      textColor = Colors.red;
    if (label.contains('Allergies'))
      textColor = Colors.orange;
    if (label.contains('Conditions'))
      textColor = Colors.green;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildOptionItem(
    IconData icon,
    String title,
    String subtitle,
    Color color,
  ) {
    return GestureDetector(
      onTap: () {
        // Handle option tap
      },
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }
}
