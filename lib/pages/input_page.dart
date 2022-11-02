import 'package:bmi_calculator/models/calculator_brain.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../widgets/my_bottom_navbar.dart';
import '../widgets/my_slider.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.MALE;

  double _currentHeightValue = 150;
  double _currentWeightValue = 60;
  double _currentAgeValue = 25;

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
                      height: MediaQuery.of(context).size.height * 0.24,
                      width: MediaQuery.of(context).size.width * 0.45,
                      color: selectedGender == Gender.MALE
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.MALE;
                        });
                      },
                      cardChild: buildFirstAndSecondChildCard(
                          FontAwesomeIcons.mars, 'Male')),
                  MyCard(
                      height: MediaQuery.of(context).size.height * 0.24,
                      width: MediaQuery.of(context).size.width * 0.45,
                      color: selectedGender == Gender.FEMALE
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.FEMALE;
                        });
                      },
                      cardChild: buildFirstAndSecondChildCard(
                          FontAwesomeIcons.venus, 'Female')),
                ],
              ),
              MyCard(
                  height: MediaQuery.of(context).size.height * 0.24,
                  width: double.infinity,
                  color: kActiveCardColor,
                  onTap: () {},
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('height'.toUpperCase(),
                          style: kLabelRegularTextStyle),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(_currentHeightValue.round().toString(),
                                style: kNumberLargeStyle),
                          ),
                          Text('cm', style: kLabelSantimitersStyle)
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 10),
                        ),
                        child: Slider(
                            activeColor: kBottomNavbarColor,
                            value: _currentHeightValue,
                            min: 120,
                            max: 250,
                            onChanged: (double value) {
                              setState(() {
                                _currentHeightValue = value;
                              });
                            }),
                      ),
                    ],
                  )),
              Row(
                children: [
                  MyCard(
                      height: MediaQuery.of(context).size.height * 0.24,
                      width: MediaQuery.of(context).size.width * 0.45,
                      color: kActiveCardColor,
                      onTap: () {},
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    _currentWeightValue--;
                                  });
                                },
                              ),
                              Text('weight'.toUpperCase(),
                                  style: kLabelSmallTextStyle),
                              IconButton(
                                icon: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    _currentWeightValue++;
                                  });
                                },
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(_currentWeightValue.round().toString(),
                                style: kNumberLargeStyle),
                          ),
                          /* RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                          )*/
                          MySlider(
                              min: 40,
                              max: 200,
                              sliderColor: Colors.white,
                              sliderValue: _currentWeightValue,
                              onSliderChanged: (double value) {
                                setState(() {
                                  _currentWeightValue = value;
                                });
                              }),
                        ],
                      )),
                  MyCard(
                      height: MediaQuery.of(context).size.height * 0.24,
                      width: MediaQuery.of(context).size.width * 0.45,
                      color: kActiveCardColor,
                      onTap: () {},
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    _currentAgeValue--;
                                  });
                                },
                              ),
                              Text('age'.toUpperCase(),
                                  style: kLabelSmallTextStyle),
                              IconButton(
                                icon: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    _currentAgeValue++;
                                  });
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(_currentAgeValue.round().toString(),
                                style: kNumberRegularStyle),
                          ),
                          MySlider(
                              min: 10,
                              max: 80,
                              sliderColor: Colors.white,
                              sliderValue: _currentAgeValue,
                              onSliderChanged: (double value) {
                                setState(() {
                                  _currentAgeValue = value;
                                });
                              }),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: MyBottomNavbar(
            height: kToolbarHeight,
            text: 'calculate',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: _currentHeightValue.round(), weight: _currentWeightValue.round());
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(bmiResult: calc.calculateBMI(), resultText: calc.getResult(), interpretation: calc.getInterpretation())));
            }));
  }
}
