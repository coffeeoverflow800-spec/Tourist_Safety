import 'package:flutter/material.dart';
import 'package:tourist_safety_app/alerts_page.dart';
import 'package:tourist_safety_app/home_page.dart';
import 'package:tourist_safety_app/profile_page.dart';
import 'package:tourist_safety_app/sos_page.dart';
import 'card_home_page.dart';

class MyMapsPage extends StatelessWidget {
  const MyMapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('data'),
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
}
