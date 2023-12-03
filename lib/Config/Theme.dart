import 'package:expense_manager/Config/Colors.dart';
import 'package:flutter/material.dart';

var lightTheme = ThemeData(
  useMaterial3: true,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: lightBgColor,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 20,
    ),
  ),
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    background: lightBgColor,
    onBackground: lightFontColor,
    primaryContainer: lightDivColor,
    onPrimaryContainer: lightFontColor,
    secondaryContainer: lightLableColor,
    primary: lightPrimaryColor,
  ),
);
var darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      background: darkBgColor,
      onBackground: darkFontColor,
      primaryContainer: darkDivColor,
      onPrimaryContainer: darkFontColor,
      secondaryContainer: darkLableColor,
      primary: darkPrimaryColor,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.transparent,
      
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,

    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: darkBgColor,
      filled: true,
      enabledBorder: InputBorder.none,
      prefixIconColor: darkLableColor,
    ));
