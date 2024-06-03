import 'package:flutter/material.dart';

class AppSecondaryButtonTheme {
  AppSecondaryButtonTheme._();

  static final lightSecondaryButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      disabledForegroundColor: Colors.grey,
      side: const BorderSide(color: Colors.black),
      padding: _padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: _textStyle(),
    ),
  );

  static final darkSecondaryButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      disabledForegroundColor: Colors.grey,
      side: const BorderSide(color: Colors.white),
      padding: _padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: _textStyle(),
    ),
  );

  static EdgeInsets get _padding => const EdgeInsets.symmetric(horizontal: 32, vertical: 16);

  static TextStyle _textStyle() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    );
  }
}
