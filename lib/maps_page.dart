import 'package:flutter/material.dart';
import 'package:tourist_safety_app/alerts_page.dart';
import 'package:tourist_safety_app/home_page.dart';
import 'package:tourist_safety_app/profile_page.dart';
import 'package:tourist_safety_app/sos_page.dart';
import 'card_home_page.dart';

class MyMapsPage extends StatefulWidget {
  const MyMapsPage({super.key});

  @override
  State<MyMapsPage> createState() =>
      _MyMapsPageState();
}

class _MyMapsPageState extends State<MyMapsPage> {
  final List<SafetyLocation> nearbyLocations = [
    SafetyLocation(
      name: 'NYC General Hospital',
      distance: '0.3 miles',
      type: LocationType.hospital,
      icon: Icons.local_hospital,
      color: Colors.red,
    ),
    SafetyLocation(
      name: 'Police Station 14th',
      distance: '0.5 miles',
      type: LocationType.police,
      icon: Icons.local_police,
      color: Colors.blue,
    ),
    SafetyLocation(
      name: 'Tourist Information Center',
      distance: '0.2 miles',
      type: LocationType.info,
      icon: Icons.info,
      color: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map background (simulated with image and overlay)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2044&q=80',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.brown.withOpacity(
                0.3,
              ),
            ),
          ),

          // Map markers
          const Positioned(
            top: 150,
            left: 160,
            child: MapMarker(
              icon: Icons.emergency,
              color: Colors.red,
            ),
          ),

          // Direction signs overlay
          Positioned(
            top: 200,
            left: 20,
            right: 20,
            child: Column(
              children: [
                DirectionSign(
                  text: 'AYUNTAMIENTO\nTOWN HALL',
                  icon: Icons.arrow_back,
                  isHighlighted: false,
                ),
                const SizedBox(height: 8),
                DirectionSign(
                  text:
                      'ANTIGUA ESTACIÓN DE FERROCARRIL\nOLD RAILWAY STATION',
                  icon: Icons.arrow_back,
                  isHighlighted: true,
                ),
                const SizedBox(height: 8),
                DirectionSign(
                  text: 'TOURIST INFO',
                  icon: Icons.arrow_downward,
                  isHighlighted: false,
                ),
              ],
            ),
          ),

          // App bar
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black87,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors
                          .white
                          .withOpacity(0.9),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Safety Map',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle layers/settings
                    },
                    icon: const Icon(
                      Icons.layers,
                      color: Colors.black87,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors
                          .white
                          .withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom sheet with location info
          DraggableScrollableSheet(
            initialChildSize: 0.35,
            minChildSize: 0.25,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      20,
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        // Drag handle
                        Center(
                          child: Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors
                                  .grey[300],
                              borderRadius:
                                  BorderRadius.circular(
                                    2,
                                  ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        // Current location
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors
                                  .blue[600],
                              size: 20,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                children: [
                                  Text(
                                    'Times Square, New York',
                                    style: TextStyle(
                                      fontSize:
                                          16,
                                      fontWeight:
                                          FontWeight
                                              .w600,
                                      color: Colors
                                          .black87,
                                    ),
                                  ),
                                  Text(
                                    'Your current location',
                                    style: TextStyle(
                                      fontSize:
                                          14,
                                      color: Colors
                                          .grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                    horizontal:
                                        12,
                                    vertical: 6,
                                  ),
                              decoration: BoxDecoration(
                                color: Colors
                                    .green[50],
                                borderRadius:
                                    BorderRadius.circular(
                                      12,
                                    ),
                                border: Border.all(
                                  color: Colors
                                      .green[200]!,
                                ),
                              ),
                              child: Text(
                                'Safe Zone',
                                style: TextStyle(
                                  color: Colors
                                      .green[700],
                                  fontSize: 12,
                                  fontWeight:
                                      FontWeight
                                          .w600,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 30,
                        ),

                        // Nearby Safety Locations
                        const Text(
                          'Nearby Safety Locations',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),

                        const SizedBox(
                          height: 16,
                        ),

                        // Location list
                        ...nearbyLocations
                            .map(
                              (location) =>
                                  _buildLocationItem(
                                    location,
                                  ),
                            )
                            .toList(),

                        const SizedBox(
                          height: 100,
                        ), // Space for bottom navigation
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
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
            SizedBox(
              width: 60,
              child: Card(
                elevation: 6,
                color: Color(0xFFEFF6FF),
                child: NavigationIcons(
                  icon:
                      Icons.location_on_outlined,
                  text: 'Maps',
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

  Widget _buildLocationItem(
    SafetyLocation location,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey[200]!,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: location.color.withOpacity(
                0.1,
              ),
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            child: Icon(
              location.icon,
              color: location.color,
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
                  location.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  location.distance,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle open action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  'Open',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: () {
                  // Handle directions action
                },
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  'Directions',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MapMarker extends StatelessWidget {
  final IconData icon;
  final Color color;

  const MapMarker({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}

class DirectionSign extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isHighlighted;

  const DirectionSign({
    super.key,
    required this.text,
    required this.icon,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: isHighlighted
            ? Colors.green[600]
            : Colors.green[700],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 12),
          Icon(
            Icons.directions_walk,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (isHighlighted)
            Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}

class SafetyLocation {
  final String name;
  final String distance;
  final LocationType type;
  final IconData icon;
  final Color color;

  const SafetyLocation({
    required this.name,
    required this.distance,
    required this.type,
    required this.icon,
    required this.color,
  });
}

enum LocationType { hospital, police, info }
