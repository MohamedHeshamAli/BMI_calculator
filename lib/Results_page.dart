import 'package:bmi_calculator/ReusablCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'input_page.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String ResultText;
  final Image img;
  ResultsPage({this.bmiResult, this.ResultText, this.img});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KinactiveCaedColour,
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Text(
              'your Result :' + bmiResult,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              clr: KinactiveCaedColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    ResultText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: img),
                  Text(
                    'Normal BMI range :\n 18.5-25 Kg/m2',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff757682),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          lastBottom(
            btnName: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
