import 'package:flutter/material.dart';

class AppbarTheme {
  AppbarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    color: Colors.white,
    iconTheme: lightIconThemeData,
    actionsIconTheme: lightIconThemeData,
    titleTextStyle: lightTextStyle,
  );

  static TextStyle get lightTextStyle => const TextStyle(color: Colors.black, fontSize: 18);

  static IconThemeData get lightIconThemeData => const IconThemeData(color: Colors.black, size: 24);

  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    color: Colors.transparent,
    iconTheme: darkIconThemeData,
    actionsIconTheme: darkIconThemeData,
    titleTextStyle: darkTextStyle(),
  );

  static TextStyle darkTextStyle() => const TextStyle(color: Colors.white, fontSize: 18);

  static IconThemeData get darkIconThemeData => const IconThemeData(color: Colors.white, size: 24);
}
