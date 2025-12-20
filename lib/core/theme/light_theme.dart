import 'package:e_commerce/core/theme/color_schemes/light_color_scheme.dart';
import 'package:e_commerce/core/theme/components/button_theme.dart';
import 'package:e_commerce/core/theme/components/input_theme.dart';
import 'package:e_commerce/core/theme/extensions/blurry_background_theme.dart';
import 'package:e_commerce/core/theme/typography.dart';
import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    textTheme: AppTypography.textTheme,
    inputDecorationTheme: InputThemes.lightInputTheme,
    elevatedButtonTheme: ButtonThemes.elevatedButtonTheme(lightColorScheme),
    extensions: const [
      BlurryBackgroundTheme(
        primaryBlob: Color(0xFF5A6BFF),
        secondaryBlob: Color(0xFF7C8DFF),
      ),
    ],
  );
}
