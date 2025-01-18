import 'package:flutter/material.dart';
import 'package:iexam/core/theme/app_pallete.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Pallete.blackColor,
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Pallete.borderColor, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Pallete.gradient1, width: 3),
            borderRadius: BorderRadius.circular(10),
          )),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: Pallete.blackColor));
}
