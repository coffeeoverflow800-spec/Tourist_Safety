import 'package:flutter/material.dart';

class MyCards extends StatelessWidget {
  final IconData icon;
  final String heading;
  final String subHeading;
  final Color bgColor;

  const MyCards({
    super.key,
    required this.icon,
    required this.bgColor,
    required this.heading,
    required this.subHeading,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),

        side: BorderSide(
          color: bgColor == Colors.green
              ? Color(0xFFBAF8CF)
              : Color(0xFFFFD7A8),

          width: 2,
        ),
      ),
      elevation: 6,
      shadowColor: Colors.black,
      color: bgColor == Colors.green
          ? Color(0xFFF0FDF4)
          : Color(0xFFFFF7ED),

      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.start,
        children: [
          SizedBox(width: 20),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              color: bgColor,
            ),

            child: Icon(icon),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                heading,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: bgColor == Colors.green
                      ? Color(0xFF0D542B)
                      : Color(0xFF7E2A0C),
                ),
              ),
              Text(
                subHeading,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}

class MyCards2 extends StatelessWidget {
  final IconData icon;
  final String heading;
  final Color borderColor;
  final Color bgColor;
  final Color textColor;

  const MyCards2({
    super.key,
    required this.icon,
    required this.bgColor,
    required this.heading,
    required this.borderColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 110,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),

          side: BorderSide(
            color: borderColor,

            width: 2,
          ),
        ),
        elevation: 6,
        shadowColor: Colors.black,
        color: bgColor,

        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            10,
            25,
            10,
            30,
          ),
          child: Column(
            children: [
              Icon(icon, color: textColor),
              SizedBox(width: 12),

              Text(
                heading,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationIcons extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  const NavigationIcons({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Column(
        children: [
          SizedBox(height: 8),
          Icon(icon, size: 25, color: color),
          Text(
            text,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}
