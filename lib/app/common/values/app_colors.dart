import 'package:flutter/material.dart';

class AppColors {
  static bool isDarkMode = false;

  static Color get textPrimary =>
      isDarkMode ? const Color(0xFF170742) : const Color(0xFF170742);

  static Color get textSecondary =>
      isDarkMode ? const Color(0xFF8C93A1) : const Color(0xFF8C93A1);
  static Color get textDisabled =>
      isDarkMode ? const Color(0xFFD5D8DF) : const Color(0xFFD5D8DF);
  static Color get textWhite =>
      isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF);

  static Color get primaryBlue100 =>
      isDarkMode ? const Color(0xFF384DF4) : const Color(0xFF384DF4);
  static Color get primaryBlue80 => isDarkMode
      ? const Color.fromRGBO(56, 77, 244, 0.8)
      : const Color.fromRGBO(56, 77, 244, 0.8);
  static Color get primaryBlue60 => isDarkMode
      ? const Color.fromRGBO(56, 77, 244, 0.6)
      : const Color.fromRGBO(56, 77, 244, 0.6);
  static Color get primaryBlue40 => isDarkMode
      ? const Color.fromRGBO(56, 77, 244, 0.4)
      : const Color.fromRGBO(56, 77, 244, 0.4);
  static Color get primaryBlue20 => isDarkMode
      ? const Color.fromRGBO(56, 77, 244, 0.2)
      : const Color.fromRGBO(56, 77, 244, 0.2);
  static Color get primaryBlue00 =>
      isDarkMode ? const Color(0xFFF9FCFF) : const Color(0xFFF9FCFF);

  static Color get secondaryPink100 => isDarkMode
      ? const Color.fromRGBO(175, 43, 247, 1)
      : const Color.fromRGBO(175, 43, 247, 1);
  static Color get secondaryPink80 => isDarkMode
      ? const Color.fromRGBO(175, 43, 247, 0.8)
      : const Color.fromRGBO(175, 43, 247, 0.8);
  static Color get secondaryPink60 => isDarkMode
      ? const Color.fromRGBO(175, 43, 247, 0.6)
      : const Color.fromRGBO(175, 43, 247, 0.6);
  static Color get secondaryPink40 => isDarkMode
      ? const Color.fromRGBO(175, 43, 247, 0.4)
      : const Color.fromRGBO(175, 43, 247, 0.4);
  static Color get secondaryPink20 => isDarkMode
      ? const Color.fromRGBO(175, 43, 247, 0.2)
      : const Color.fromRGBO(175, 43, 247, 0.2);
  static Color get secondaryPink00 => isDarkMode
      ? const Color.fromRGBO(175, 43, 247, 0.1)
      : const Color.fromRGBO(175, 43, 247, 0.1);
}
