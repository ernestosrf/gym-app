import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
    // Default application background color
    scaffoldBackgroundColor: Colors.blueGrey[100],

    // Text styles
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24.0,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
      ),
      labelLarge: TextStyle(
        fontSize: 24.0,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal,
      ),
      labelMedium: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal,
      ),
      labelSmall: TextStyle(
        fontSize: 14.0,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal,
      ),
    ),
  

    
  );
}
