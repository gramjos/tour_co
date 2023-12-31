import 'package:flutter/material.dart';

BoxDecoration gradientBoxDec = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      pastelPurp,
      matte,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);

class Cols {
  static const Color heartOutline = Color.fromARGB(255, 255, 0, 0);
  static const Color black = Color.fromARGB(255, 0, 0, 0);
}

Color get matte => const Color.fromARGB(
    255, 252, 233, 187); // App Bar, and Welcome Text Area, footer
Color get startScreenButton => const Color.fromARGB(255, 122, 255, 213);
Color get startScreenBackgroundColor =>
    const Color.fromARGB(255, 212, 251, 255);
Color get pastelPurp => const Color.fromARGB(255, 223, 182, 255);

const largeTextSize = 26.0;
const mediumTextSize = 20.0;
const bodyTextSize = 16.0;

const String fontNameDefault = 'Montserrat';

const appBarTextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: mediumTextSize,
  color: Color.fromARGB(255, 0, 0, 0),
);

const titleTextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: largeTextSize,
  color: Color.fromARGB(255, 186, 2, 2),
);

const body1TextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: bodyTextSize,
  color: Color.fromARGB(255, 0, 0, 0),
);

TextStyle titleSignature(double pFontSize) {
  return TextStyle(
    fontFamily: "Tourney",
    fontSize: pFontSize,
    fontWeight: FontWeight.bold,
    color: const Color.fromARGB(255, 74, 74, 74),
  );
}
