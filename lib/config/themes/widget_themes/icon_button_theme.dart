import 'package:flutter/material.dart';

class AppIconButtonTheme {
  AppIconButtonTheme._();

  static final lightIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: Colors.black,
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      iconSize: 24,
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      disabledForegroundColor: Colors.grey,
    ),
  );

  static final darkIconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: Colors.white,
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      iconSize: 24,
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      disabledForegroundColor: Colors.grey,
    ),
  );
}
