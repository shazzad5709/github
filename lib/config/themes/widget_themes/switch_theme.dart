import 'package:flutter/material.dart';

class AppSwitchTheme {
  AppSwitchTheme._();

  static SwitchThemeData lightSwitchTheme = SwitchThemeData(
    thumbColor: MaterialStateProperty.all(Colors.black),
    trackColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.grey;
      }
      return Colors.white;
    }),
    trackOutlineColor: MaterialStateProperty.all(Colors.black45),
  );

  static SwitchThemeData darkSwitchTheme = SwitchThemeData(
    thumbColor: MaterialStateProperty.all(Colors.white),
    trackColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.grey[700];
      }
      return Colors.black;
    }),
    trackOutlineColor: MaterialStateProperty.all(Colors.white30),
  );
}
