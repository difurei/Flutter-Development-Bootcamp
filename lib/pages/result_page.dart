import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/models/calculator_brain.dart';
import 'package:bmi_calculator/widgets/my_bottom_navbar.dart';
import 'package:bmi_calculator/widgets/my_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  static const route = '/result';

  final String bmiResult;
  final String resultText;
  final String interpretation;


  ResultPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 15, left: 20),
              child: Text(
                'Your Result',
                style: kLabelBigTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyCard(
                height: MediaQuery.of(context).size.height * 0.6,
                width: double.infinity,
                color: kActiveCardColor,
                onTap: () {},
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText.toUpperCase(), style: TextStyle(color: resultText=='Normal' ? Color(0xFF23D876) : Colors.red, fontSize: 30, fontWeight: FontWeight.bold)),
                    Text(bmiResult, style: kBMITextStyle),
                    Text(interpretation, style: kBodyTextStyle, textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavbar(
          height: 80,
          text: 're-calcucate',
          onTap: () => Navigator.of(context)
              .pushNamedAndRemoveUntil('/', (route) => false)),
    );
  }
}
