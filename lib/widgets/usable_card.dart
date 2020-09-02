import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

class UsableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function onPress;

  UsableCard({@required this.color, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(15.0),
          child: cardChild,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: kTextNumberColor.withOpacity(0.05),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 8), // changes position of shadow
            ),
          ], borderRadius: BorderRadius.circular(25.0), color: this.color),
      )
    );
  }
}
