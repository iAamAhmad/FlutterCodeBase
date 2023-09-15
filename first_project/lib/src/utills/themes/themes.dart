import 'package:flutter/material.dart';

import '../widget_themes/text_theme.dart';

class JappTheme {
  JappTheme._(); //? we are making this private so that no one can instantiate this class

  //?declaring custom class
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: JtextTheme.lightTextTheme,
  );

//?dark theme customization

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: JtextTheme.darkTextTheme,
  );
}
