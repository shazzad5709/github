import 'package:flutter/material.dart';

class AppCheckboxTheme {
  AppCheckboxTheme._();

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    checkColor: MaterialStateProperty.all(Colors.white),
    side: const BorderSide(color: Colors.black),
  );

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    checkColor: MaterialStateProperty.all(Colors.black),
    side: const BorderSide(color: Colors.white),
  );
}
