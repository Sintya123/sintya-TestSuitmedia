import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin AppTheme {
  static const primaryColor = Color.fromRGBO(43, 99, 123, 1);

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      color: Colors.white,
      foregroundColor: Colors.black,
      elevation: .5,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      fillColor: Colors.white,
      filled: true,
    ),
    textTheme: const TextTheme(
      headline5: TextStyle(fontWeight: FontWeight.bold),
      headline6: TextStyle(fontWeight: FontWeight.bold),
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}
