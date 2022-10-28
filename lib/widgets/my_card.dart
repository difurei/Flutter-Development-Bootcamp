import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Widget cardChild;
  VoidCallback onTap;

  MyCard(
  {this.height, this.width, this.color, this.onTap, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
        width: width,
        child: GestureDetector(
          onTap: onTap,
          child: Card(
              child: cardChild,
              color: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ),
      ),
    );
  }
}
