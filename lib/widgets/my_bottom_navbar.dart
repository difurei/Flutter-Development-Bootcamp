import 'package:flutter/material.dart';

import '../constants.dart';

class MyBottomNavbar extends StatelessWidget {
  final String text;
  final double height;
  Function onTap;

  MyBottomNavbar({this.text, this.height, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(15), top: Radius.circular(2)),
      color: kBottomNavbarColor,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: double.infinity,
          child: Center(
            child: Text(
              text.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
