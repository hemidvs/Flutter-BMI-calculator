import 'package:bmi_app/constants.dart';
import 'package:bmi_app/widgets/bottom_button.dart';
import 'package:bmi_app/widgets/usable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 15.0, top: 90.0),
                  child: Text("Your Result", style: kTitleTextStyle)),
              Container(
                child: UsableCard(
                  color: kInactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(resultText, style: kResultTextStyle),
                      Text(bmiResult, style: kBMITextStyle),
                      Text(interpretation,
                          textAlign: TextAlign.center,
                          style: kResultBodyTextStyle),
                    ],
                  ),
                ),
              ),
              BottomButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonTitle: 'RE-CALCULATE'),
            ],
          ),
        ),
      ),
    );
  }
}
