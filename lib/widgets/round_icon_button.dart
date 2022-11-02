import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;

  RoundIconButton({this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: () {},
      shape: CircleBorder(),
      fillColor: Colors.blue,
      constraints: BoxConstraints.tightFor(width: 50, height: 50),
      elevation: 6.0,
    );
  }
}
