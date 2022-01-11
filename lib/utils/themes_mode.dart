import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

class ThemesMode {
  static bool? isDarkMode;

  void init(BuildContext context) {
    isDarkMode = Theme.of(context).brightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: isDarkMode == true? Colors.black: Colors.black,
      systemNavigationBarIconBrightness: isDarkMode == true?Brightness.dark: Brightness.dark,
      statusBarColor: isDarkMode == true?const Color(0xFF003024) : const Color(0xFF003024),
      statusBarBrightness: isDarkMode == true?Brightness.dark: Brightness.dark,
      statusBarIconBrightness: isDarkMode == true?Brightness.dark: Brightness.dark,
    ));
  }
}

