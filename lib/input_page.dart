import 'package:bmi_calculator/Results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ReusablCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconContent.dart';
import 'constants.dart';
import 'Results_page.dart';
import 'BMI-brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender sellectedGender = Gender.male;
  static int height = 180;
  int weight = 60;
  int age = 18;
  bool onp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sellectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      clr: sellectedGender == Gender.male
                          ? KactiveCaedColour
                          : KinactiveCaedColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sellectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      clr: sellectedGender == Gender.female
                          ? KactiveCaedColour
                          : KinactiveCaedColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: KlabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: KnumberStyle),
                      Text(
                        'cm',
                        style: KlabelStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTickMarkColor: Color(0xff8e8d98),
                        thumbColor: Colors.pink,
                        activeTrackColor: Colors.white,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        overlayColor: Color(0x26C2185B)),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double h) {
                        setState(() {
                          height = h.round();
                        });
                      },
                      min: 50.0,
                      max: 220,
                    ),
                  ),
                ],
              ),
              clr: KinactiveCaedColour,
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: KlabelStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: KnumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            child: FloatingActionButton(
                              heroTag: "btn4",
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: Color(0xff4c4f5e),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          FloatingActionButton(
                            heroTag: "btn1",
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            backgroundColor: Color(0xff4c4f5e),
                            child: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  clr: KinactiveCaedColour,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: KlabelStyle,
                      ),
                      Text(
                        age.toString(),
                        style: KnumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FloatingActionButton(
                            heroTag: "btn2",
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            backgroundColor: Color(0xff4c4f5e),
                            child: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                          ),
                          FloatingActionButton(
                            heroTag: "btn3",
                            //splashColor: Colors.pink,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            backgroundColor: Color(0xff4c4f5e),
                            child: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  clr: KinactiveCaedColour,
                ),
              ),
            ],
          )),
          lastBottom(
            btnName: "CALCULATE",
            onTap: () {
              CalculateBMI CBMI = CalculateBMI(
                  height: height, weight: weight, gender: sellectedGender);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResult: CBMI.CalculateReshult(),
                            ResultText: CBMI.getResultText(),
                            img: CBMI.GetImag(),
                          )));
            },
          )
        ],
      ),
    );
  }
}

class lastBottom extends StatelessWidget {
  final Function onTap;
  String btnName;
  lastBottom({this.onTap, this.btnName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Text(
          btnName,
          style: KnumberStyle,
          textAlign: TextAlign.center,
        ),
        height: 60.0,
        width: double.infinity,
        color: KbottomcontainerColour,
        margin: EdgeInsets.only(top: 5),
      ),
    );
  }
}
