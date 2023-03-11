import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/screens/login_screen.dart';
import 'package:test_flutter/screens/registration_screen.dart';

import '../widgets/custom_button_widget.dart';

class WelcomeScreen extends StatefulWidget {
  static const String route = '/welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation backgroundAnimation;
  late Animation flashTextAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    backgroundAnimation =
        ColorTween(begin: Colors.blue.shade50, end: Colors.red.shade700)
            .animate(controller);
    flashTextAnimation = ColorTween(begin: Colors.black45, end: Colors.white)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundAnimation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: flashTextAnimation.value,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            CustomButton(
              text: 'Log in',
              color: Colors.lightBlue,
              function: () => Navigator.of(context).pushNamed(LoginScreen.route),
            ),
            CustomButton(
              text: 'Register',
              color: Colors.blueAccent,
              function: () => Navigator.of(context).pushNamed(RegistrationScreen.route),
            ),
          ],
        ),
      ),
    );
  }
}


