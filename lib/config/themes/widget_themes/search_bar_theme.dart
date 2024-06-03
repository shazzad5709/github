import 'package:flutter/material.dart';

class AppSearchBarTheme {
  AppSearchBarTheme._();

  static final lightSearchBarTheme = SearchBarThemeData(
    hintStyle: MaterialStateProperty.all(
      TextStyle(color: Colors.grey[700]),
    ),
    backgroundColor: MaterialStateProperty.all(Colors.black12),
    surfaceTintColor: MaterialStateProperty.all(Colors.white),
    padding: MaterialStateProperty.all(
      _padding,
    ),
    shape: MaterialStateProperty.all(
      _roundedRectangleBorder,
    ),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
  );

  static final darkSearchBarTheme = SearchBarThemeData(
    hintStyle: MaterialStateProperty.all(
      const TextStyle(color: Colors.grey),
    ),
    backgroundColor: MaterialStateProperty.all(Colors.white12),
    surfaceTintColor: MaterialStateProperty.all(Colors.black),
    padding: MaterialStateProperty.all(
      _padding,
    ),
    shape: MaterialStateProperty.all(
      _roundedRectangleBorder,
    ),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
  );

  static TextStyle get lightTextStyle => const TextStyle(color: Colors.black, fontSize: 16);
  static TextStyle get darkTextStyle => const TextStyle(color: Colors.white, fontSize: 16);

  static RoundedRectangleBorder get _roundedRectangleBorder {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    );
  }

  static EdgeInsets get _padding => const EdgeInsets.symmetric(horizontal: 16);
}
