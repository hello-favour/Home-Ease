import 'package:flutter/material.dart';

class AppTheme {
  static getLightTheme(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return themeData.copyWith(
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: true,
      primaryColor: const Color(0xFF1B4683),
      dividerColor: const Color(0xFFF0F0F0),
      cardColor: const Color(0xFFF8F8F8),
      dialogBackgroundColor: Colors.white,
      brightness: Brightness.light,
      splashColor: const Color(0xFF1B4683),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      ),
      shadowColor: const Color(0x0a000000),
      colorScheme:
          themeData.colorScheme.copyWith(primary: const Color(0xFF1B4683)),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          color: Colors.black,
        ),
        headlineLarge: TextStyle(
          color: Colors.black,
        ),
        headlineSmall: TextStyle(
          color: Color(0xFF808080),
        ),
      ),
      focusColor: const Color(0xFFF9F9F9),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF1B4683),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
      ),
    );
  }

  static getDarkTheme(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return themeData.copyWith(
      scaffoldBackgroundColor: Colors.black,
      useMaterial3: true,
      primaryColor: const Color(0xFF1B4683),
      dividerColor: const Color(0x33ACAFB5),
      brightness: Brightness.dark,
      cardColor: const Color(0x0dacafb5),
      dialogBackgroundColor: Colors.black,
      secondaryHeaderColor: const Color(0x0dacafb5),
      splashColor: const Color(0xFF1B4683),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
      ),
      shadowColor: Colors.transparent,
      colorScheme:
          themeData.colorScheme.copyWith(primary: const Color(0xFF1B4683)),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          color: Colors.white,
        ),
        headlineLarge: TextStyle(
          color: Colors.white,
        ),
        headlineSmall: TextStyle(
          color: Color(0xFF808080),
        ),
      ),
      focusColor: const Color(0xFFF9F9F9),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF1B4683),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.black,
      ),
    );
  }

  static ThemeData getColorsTheme(BuildContext context) {
    return Theme.of(context);
  }

  static Color getTextColor(BuildContext context) {
    return getColorsTheme(context).textTheme.headlineLarge!.color!;
  }

  static getHintTextColor(BuildContext context) {
    return getColorsTheme(context).textTheme.headlineSmall!.color;
  }

  static getScaffoldColor(BuildContext context) {
    return getColorsTheme(context).scaffoldBackgroundColor;
  }

  static getCardColor(BuildContext context) {
    return getColorsTheme(context).cardColor;
  }

  static getDividerColor(BuildContext context) {
    return getColorsTheme(context).dividerColor;
  }

  static getPrimaryColor(BuildContext context) {
    return getColorsTheme(context).primaryColor;
  }

  static getShadowColor(BuildContext context) {
    return getColorsTheme(context).shadowColor;
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
