import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Widget cardChild;
  VoidCallback voidCallback;

  MyCard(
      this.height, this.width, this.color, this.voidCallback, this.cardChild);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
        width: width,
        child: GestureDetector(
          onTap: voidCallback,
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
