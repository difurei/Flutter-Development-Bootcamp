import 'package:bmi_calculator/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/my_bottom_navbar.dart';

const activeCardColor = Color(0xFF1D1E55);
const inactiveCardColor = Color(0xFF1D1E33);
enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender = Gender.MALE;

  Widget buildFirstAndSecondChildCard(IconData faIcon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          faIcon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(text.toUpperCase(), style: TextStyle(fontSize: 18))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0A0E21),
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  MyCard(
                      MediaQuery.of(context).size.height * 0.24,
                      MediaQuery.of(context).size.width * 0.45,
                      selectedGender == Gender.MALE
                          ? activeCardColor
                          : inactiveCardColor, () {
                    setState(() {
                      selectedGender = Gender.MALE;
                    });
                  },
                      buildFirstAndSecondChildCard(
                          FontAwesomeIcons.mars, 'Male')),
                  MyCard(
                      MediaQuery.of(context).size.height * 0.24,
                      MediaQuery.of(context).size.width * 0.45,
                      selectedGender == Gender.FEMALE
                          ? activeCardColor
                          : inactiveCardColor, () {
                    setState(() {
                      selectedGender = Gender.FEMALE;
                    });
                  },
                      buildFirstAndSecondChildCard(
                          FontAwesomeIcons.venus, 'Female')),
                ],
              ),
              MyCard(MediaQuery.of(context).size.height * 0.24, double.infinity,
                  Color(0xFF1D1E55), () {}, Text('ff')),
              Row(
                children: [
                  MyCard(
                      MediaQuery.of(context).size.height * 0.24,
                      MediaQuery.of(context).size.width * 0.45,
                      activeCardColor,
                      () {},
                      Text('ff')),
                  MyCard(
                      MediaQuery.of(context).size.height * 0.24,
                      MediaQuery.of(context).size.width * 0.45,
                      activeCardColor,
                      () {},
                      Text('ff')),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: MyBottomNavbar());
  }
}
