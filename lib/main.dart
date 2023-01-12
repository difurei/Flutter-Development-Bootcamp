import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.amber,
          scaffoldBackgroundColor: Colors.grey[800],
        textTheme: TextTheme(button: TextStyle(color: Colors.black)),
        appBarTheme: AppBarTheme(color: Colors.transparent)
      ),
      home: PriceScreen(),
    );
  }
}
