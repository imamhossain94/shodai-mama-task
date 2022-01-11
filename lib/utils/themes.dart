import 'package:flutter/material.dart';
import 'constants.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: scaffoldBackgroundLight,
    primaryColor: const Color(0xFF00402F),
    colorScheme: const ColorScheme.light().copyWith(
      brightness: Brightness.light,
      primary: const Color(0xFF00402F),
      onPrimary: Colors.white,
      secondary: const Color(0xFF006A4E),
    ),

  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: scaffoldBackgroundDark,
    primaryColor: const Color(0xFF00402F),
    colorScheme: const ColorScheme.light().copyWith(
      brightness: Brightness.light,
      primary: const Color(0xFF00402F),
      onPrimary: Colors.white,
      secondary: const Color(0xFF006A4E),
    ),
  );
}