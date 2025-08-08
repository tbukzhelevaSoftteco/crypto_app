import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(179, 247, 244, 244),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime),
  dividerColor: Colors.black12,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.lime,
    foregroundColor: Colors.black87,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(221, 29, 29, 29),
    ),
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.black54,
    textColor: Colors.black87,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    labelSmall: TextStyle(color: Colors.black, fontSize: 16),
  ),
);
