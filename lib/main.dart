import 'package:bmi_app/screens/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMICaculator());
}

class BMICaculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Poppins"
      ),
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}