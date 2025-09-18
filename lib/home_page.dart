import 'package:flutter/material.dart';
import 'package:tourist_safety_app/SOS_page.dart';
import 'package:tourist_safety_app/alerts_page.dart';
import 'package:tourist_safety_app/card_home_page.dart';
import 'package:tourist_safety_app/maps_page.dart';
import 'package:tourist_safety_app/profile_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            //App Title -st
            Material(
              elevation: 4,
              shadowColor: Colors.black,
              child: Padding(
                padding:
                    const EdgeInsets.fromLTRB(
                      15,
                      4,
                      15,
                      4,
                    ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        SizedBox(height: 8),
                        Text(
                          'Welcome back, Sarah',
                          style: TextStyle(
                            fontWeight:
                                FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          ' Stay safe on your journy🛡️',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                    Card(
                      color: const Color.fromARGB(
                        207,
                        6,
                        57,
                        208,
                      ),

                      child: IconButton(
                        alignment:
                            AlignmentGeometry
                                .centerRight,
                        onPressed: () {},
                        icon: Icon(
                          Icons.person_rounded,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //App Title -end

            //Mid cards -st
            //card1-st
            Padding(
              padding: const EdgeInsets.fromLTRB(
                15,
                20,
                15,
                10,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  MyCards(
                    icon: Icons.shield_outlined,
                    bgColor: Colors.green,
                    heading:
                        "You're in a Safe Zone",
                    subHeading:
                        "📍 Times Square, NYC",
                  ),

                  //Card1 -end
                  SizedBox(height: 15),
                  //Card2-st
                  MyCards(
                    icon: Icons.cloudy_snowing,
                    bgColor: Colors.red,
                    heading: "Weather Alert",
                    subHeading:
                        "⚠️ Heavy rain expected this evening",
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                    child: Text(
                      'Quick Actions',
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.fromLTRB(
                          0,
                          25,
                          0,
                          5,
                        ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceAround,
                      children: [
                        MyCards2(
                          textColor: Colors.white,
                          icon:
                              Icons.warning_amber,
                          bgColor: Colors.red,
                          borderColor: Colors.red,
                          heading:
                              'Emergency SOS',
                        ),
                        MyCards2(
                          textColor: Color(
                            0xFF1447E6,
                          ),
                          icon: Icons.location_on,
                          bgColor: Color(
                            0xFFEFF6FF,
                          ),
                          borderColor: Color(
                            0xFFC9E0FD,
                          ),
                          heading: 'View Map',
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.fromLTRB(
                          0,
                          5,
                          0,
                          25,
                        ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceAround,
                      children: [
                        MyCards2(
                          textColor: Color(
                            0xFF008236,
                          ),
                          icon: Icons.call,
                          bgColor: Color(
                            0xFFF0FDF4,
                          ),
                          borderColor: Color(
                            0xFFB9F8CF,
                          ),
                          heading: 'Call Help',
                        ),
                        MyCards2(
                          textColor: Color(
                            0xFF8200DB,
                          ),
                          icon: Icons.people,
                          bgColor: Color(
                            0xFFFAF5FF,
                          ),
                          borderColor: Color(
                            0xFFF2E5FF,
                          ),
                          heading:
                              'Share Location',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                    child: Text(
                      'Recent Activity',
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
            Container(
              width: 60,
              child: Card(
                elevation: 6,
                color: Color(0xFFEFF6FF),
                child: NavigationIcons(
                  icon: Icons.home_outlined,
                  text: 'Home',
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
