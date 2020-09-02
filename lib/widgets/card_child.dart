import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

class CardChild extends StatelessWidget {
  final IconData icon;
  final String label;

  CardChild({@required this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(this.icon,
              size: 60.0,
              color: label == "Male"
                  ? kActiveMaleCardIconColor
                  : kActiveFemaleCardIconColor),
          SizedBox(height: 12.0),
          Text(this.label, style: kLabelTextStyle)
        ],
      ),
    );
  }
}
