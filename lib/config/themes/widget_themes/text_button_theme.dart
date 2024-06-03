import 'package:flutter/material.dart';

class AppTextButtonTheme {
  AppTextButtonTheme._();

  static final textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.blue,
      disabledForegroundColor: Colors.grey,
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
