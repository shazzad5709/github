import 'package:flutter/material.dart';
import 'package:githubdummy/core/themes/widget_themes/navigation_bar_theme.dart';
import 'package:githubdummy/core/themes/widget_themes/floating_action_button_theme.dart';
import 'package:githubdummy/core/themes/widget_themes/primary_button_theme.dart';
import 'package:githubdummy/core/themes/widget_themes/search_bar_theme.dart';
import 'package:githubdummy/core/themes/widget_themes/secondary_button_theme.dart';
import 'package:githubdummy/core/themes/widget_themes/switch_theme.dart';
import 'package:githubdummy/core/themes/widget_themes/text_button_theme.dart';

import '../../core/themes/widget_themes/appbar_theme.dart';
import 'widget_themes/checkbox_theme.dart';
import 'widget_themes/icon_button_theme.dart';
import '../../core/themes/widget_themes/text_theme.dart';
import 'widget_themes/input_decoration_theme.dart';

class AppTheme {
  AppTheme._();

  static const String _fontName = 'GoogleSans';

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: _fontName,
    disabledColor: Colors.grey,
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppbarTheme.lightAppBarTheme,
    checkboxTheme: AppCheckboxTheme.lightCheckboxTheme,
    textTheme: AppTextTheme.lightTextTheme,
    inputDecorationTheme: AppInputDecorationTheme.lightInputDecorationTheme,
    elevatedButtonTheme: AppPrimaryButtonTheme.lightPrimaryButtonTheme,
    outlinedButtonTheme: AppSecondaryButtonTheme.lightSecondaryButtonTheme,
    textButtonTheme: AppTextButtonTheme.textButtonTheme,
    dividerTheme: _dividerThemeData,
    iconButtonTheme: AppIconButtonTheme.lightIconButtonTheme,
    radioTheme: _radioLightThemeData,
    switchTheme: AppSwitchTheme.lightSwitchTheme,
    floatingActionButtonTheme: AppFloatingActionButtonTheme.lightFloatingActionButtonTheme,
    navigationBarTheme: AppNavigationBarTheme.lightNavigationBarTheme,
    searchBarTheme: AppSearchBarTheme.lightSearchBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: _fontName,
    disabledColor: Colors.grey,
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppbarTheme.darkAppBarTheme,
    checkboxTheme: AppCheckboxTheme.darkCheckboxTheme,
    textTheme: AppTextTheme.darkTextTheme,
    inputDecorationTheme: AppInputDecorationTheme.darkInputDecorationTheme,
    elevatedButtonTheme: AppPrimaryButtonTheme.darkPrimaryButtonTheme,
    outlinedButtonTheme: AppSecondaryButtonTheme.darkSecondaryButtonTheme,
    textButtonTheme: AppTextButtonTheme.textButtonTheme,
    dividerTheme: _dividerThemeData,
    iconButtonTheme: AppIconButtonTheme.darkIconButtonTheme,
    radioTheme: _radioDarkThemeData,
    switchTheme: AppSwitchTheme.darkSwitchTheme,
    floatingActionButtonTheme: AppFloatingActionButtonTheme.darkFloatingActionButtonTheme,
    navigationBarTheme: AppNavigationBarTheme.darkNavigationBarTheme,
    searchBarTheme: AppSearchBarTheme.darkSearchBarTheme,
  );

  static RadioThemeData get _radioLightThemeData {
    return RadioThemeData(
      fillColor: MaterialStateProperty.all(Colors.black),
    );
  }

  static RadioThemeData get _radioDarkThemeData {
    return RadioThemeData(
      fillColor: MaterialStateProperty.all(Colors.white),
    );
  }

  static DividerThemeData get _dividerThemeData {
    return const DividerThemeData(
      color: Colors.grey,
      thickness: 0.5,
    );
  }
}
