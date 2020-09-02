import 'package:bmi_app/constants.dart';
import 'package:bmi_app/data/calculator.dart';
import 'package:bmi_app/screens/result_page.dart';
import 'package:bmi_app/widgets/bottom_button.dart';
import 'package:bmi_app/widgets/card_child.dart';
import 'package:bmi_app/widgets/round_icon_button.dart';
import 'package:bmi_app/widgets/usable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  int height = 180;
  double minHeight = 120;
  double maxHeight = 220;

  int weight = 60;
  int age = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 15.0, top: 90.0),
                  alignment: Alignment.bottomLeft,
                  child: Text("BMI Calculator", style: kTitleTextStyle)),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: UsableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.Male;
                          });
                        },
                        color: selectedGender == Gender.Male
                            ? kActiveMaleCardColor
                            : kInactiveCardColor,
                        cardChild: CardChild(
                          icon: FontAwesomeIcons.mars,
                          label: "Male",
                        ),
                      ),
                    ),
                    Expanded(
                      child: UsableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.Female;
                          });
                        },
                        color: selectedGender == Gender.Female
                            ? kActiveFemaleCardColor
                            : kInactiveCardColor,
                        cardChild: CardChild(
                          icon: FontAwesomeIcons.venus,
                          label: "Female",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: UsableCard(
                  color: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("HEIGHT", style: kLabelTextStyle),
                          Text("[cm]", style: kSmallLabelTextStyle)
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(height.toString(), style: kNumberTextStyle),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: kBottomContainerColor,
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: minHeight,
                          max: maxHeight,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                          label: "$height",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: UsableCard(
                        color: kInactiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("WEIGH", style: kLabelTextStyle),
                                Text("[kq]", style: kSmallLabelTextStyle)
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text((weight - 1).toString(),
                                    style: kSmallNumberTextStyle),
                                Text(weight.toString(),
                                    style: kNumberTextStyle),
                                Text((weight + 1).toString(),
                                    style: kSmallNumberTextStyle),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(width: 10.0),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BottomButton(
                onTap: () {
                  CalculatorMain calc =
                      CalculatorMain(height: height, weight: weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                              bmiResult: calc.calculateBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation())));
                },
                buttonTitle: 'CALCULATE',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
