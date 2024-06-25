import 'package:flutter/material.dart';

class AppNavigationBarTheme {
  AppNavigationBarTheme._();

  static NavigationBarThemeData lightNavigationBarTheme = NavigationBarThemeData(
    indicatorColor: Colors.grey[300],
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.black,
    elevation: 1,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
    iconTheme: MaterialStateProperty.all(_iconThemeData),
  );

  static NavigationBarThemeData darkNavigationBarTheme = NavigationBarThemeData(
    indicatorColor: Colors.grey[700],
    backgroundColor: Colors.black,
    surfaceTintColor: Colors.white,
    elevation: 1,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
    iconTheme: MaterialStateProperty.all(_iconThemeData),
  );

  static IconThemeData get _iconThemeData => const IconThemeData(size: 24);
}
