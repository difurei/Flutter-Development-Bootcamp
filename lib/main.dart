import 'package:flutter/material.dart';

void main() {
  runApp(MyCardApp());
}

class MyCardApp extends StatelessWidget {
  String _avatarPath =
      'https://kartinkin.net/uploads/posts/2021-07/1625606021_43-kartinkin-com-p-anime-ava-dlya-gruppi-anime-krasivo-50.jpg';
  String _phoneNumber = '+7 904 611 10 97';
  String _emailAddress = 'youkixiro@gmail.com';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(_avatarPath),
              radius: 50,
            ),
            Text(
              'Dimitriy Furei',
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            Text(
              'Flutter Developer'.toUpperCase(),
              style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5),
            ),
            Container(
                width: 200,
                child: Divider(
                  color: Colors.white,
                )),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.teal),
                title: Text(_phoneNumber),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
              child: ListTile(
                leading: Icon(Icons.email, color: Colors.teal),
                title: Text(_emailAddress),
              ),
            )
          ],
        ),
      ),
    );
  }
}
