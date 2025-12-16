import 'package:e_commerce/core/theme/dark_theme.dart';
import 'package:e_commerce/core/theme/light_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => buildLightTheme();
  static ThemeData get dark => buildDarkTheme();
}
