import 'package:flutter/material.dart';

class AppFloatingActionButtonTheme {
  AppFloatingActionButtonTheme._();

  static FloatingActionButtonThemeData lightFloatingActionButtonTheme =
      FloatingActionButtonThemeData(
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
    focusColor: Colors.black.withOpacity(0.1),
    hoverColor: Colors.black.withOpacity(0.1),
    splashColor: Colors.black.withOpacity(0.1),
    elevation: 4,
    focusElevation: 6,
    hoverElevation: 6,
    disabledElevation: 0,
    highlightElevation: 8,
    shape: _roundedRectangleBorder,
  );

  static FloatingActionButtonThemeData darkFloatingActionButtonTheme =
      FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: Colors.black,
    focusColor: Colors.white.withOpacity(0.1),
    hoverColor: Colors.white.withOpacity(0.1),
    splashColor: Colors.white.withOpacity(0.1),
    elevation: 4,
    focusElevation: 6,
    hoverElevation: 6,
    disabledElevation: 0,
    highlightElevation: 8,
    shape: _roundedRectangleBorder,
  );

  static RoundedRectangleBorder get _roundedRectangleBorder {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    );
  }
}
