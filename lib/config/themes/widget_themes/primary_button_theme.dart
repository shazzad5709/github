import 'package:flutter/material.dart';

class AppPrimaryButtonTheme {
  AppPrimaryButtonTheme._();

  static final lightPrimaryButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      disabledBackgroundColor: Colors.grey[700],
      disabledForegroundColor: Colors.grey[300],
      side: const BorderSide(color: Colors.black),
      padding: _padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: _textStyle,
    ),
  );

  static final darkPrimaryButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      disabledBackgroundColor: Colors.grey[300],
      disabledForegroundColor: Colors.grey[700],
      side: const BorderSide(color: Colors.white),
      padding: _padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: _textStyle,
    ),
  );

  static EdgeInsets get _padding => const EdgeInsets.symmetric(horizontal: 32, vertical: 16);

  static TextStyle get _textStyle {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    );
  }
}
