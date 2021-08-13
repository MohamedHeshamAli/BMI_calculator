import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CalculateBMI {
  CalculateBMI({this.height, this.weight, this.gender});
  Image i;
  Gender gender;
  final int height;
  final int weight;
  double _bim;
  String CalculateReshult() {
    _bim = weight / pow(height / 100, 2);

    return _bim.toStringAsFixed(1);
  }

  String getResultText() {
    if (_bim >= 25)
      return 'Overweight';
    else if (_bim < 18.5)
      return 'Underweight';
    else
      return 'Normal';
  }

  Image GetImag() {
    if (gender == Gender.male && getResultText() == 'Overweight') {
      return Image.asset('Images/f10.jpg');
    } else if (gender == Gender.male && getResultText() == 'Underweight') {
      return Image.asset('Images/t1.jpg');
    } else if (gender == Gender.male && getResultText() == 'Normal') {
      return Image.asset('Images/n1.jpg');
    } else if (gender == Gender.female && getResultText() == 'Overweight') {
      return Image.asset('Images/f2.jpg');
    } else if (gender == Gender.female && getResultText() == 'Underweight') {
      return Image.asset('Images/t2.jpg');
    } else {
      return Image.asset('Images/n2.jpg');
    }
  }
}
