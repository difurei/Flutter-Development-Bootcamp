import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MagicBallMain(),
      ),
    );

class MagicBallMain extends StatefulWidget {
  @override
  State<MagicBallMain> createState() => _MagicBallMainState();
}

class _MagicBallMainState extends State<MagicBallMain> {
  int _ballNumber = 1;

  void _changeBallNumber() {
    Random random = Random();
    setState(() {
      _ballNumber = random.nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ask Me Anything",
            style: TextStyle(fontFamily: "Lora", fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Expanded(
          child: GestureDetector(
              onTap: _changeBallNumber,
              child: Image.asset('images/ball$_ballNumber.png')),
        ),
      ),
    );
  }
}
