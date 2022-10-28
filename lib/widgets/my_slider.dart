import 'package:flutter/material.dart';

class MySlider extends StatelessWidget {
  double min;
  double max;
  double sliderValue;
  Color sliderColor;
  Function onSliderChanged;


  MySlider({this.min, this.max, this.sliderValue, this.sliderColor,
      this.onSliderChanged});

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
      ),
      child: Slider(
          activeColor: sliderColor,
          value: sliderValue,
          min: min,
          max: max,
          onChanged: onSliderChanged
      ),
    );
  }
}
