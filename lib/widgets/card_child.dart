import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

const double iconSize = 75.0;
const sizedBoxHeight = 12.0;

class CardChild extends StatelessWidget {
  final IconData icon;
  final String label;

  CardChild({@required this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(this.icon, size: iconSize, color: label == "Male"? kActiveMaleCardIconColor: kActiveFemaleCardIconColor),
        SizedBox(height: sizedBoxHeight),
        Text(this.label, style: kLabelTextStyle)
      ],
    );
  }
}
