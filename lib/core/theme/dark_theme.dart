import 'package:e_commerce/core/theme/color_schemes/dark_color_scheme.dart';
import 'package:e_commerce/core/theme/extensions/blurry_background_theme.dart';
import 'package:e_commerce/core/theme/typography.dart';
import 'package:flutter/material.dart';

ThemeData buildDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    textTheme: AppTypography.textTheme,
    extensions: const [
      BlurryBackgroundTheme(
        primaryBlob: Color.fromARGB(255, 108, 1, 189),
        secondaryBlob: Color.fromARGB(255, 84, 16, 148),
      ),
    ],
  );
}
