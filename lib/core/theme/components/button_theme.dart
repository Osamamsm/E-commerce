import 'package:flutter/material.dart';

class ButtonThemes {
  static ElevatedButtonThemeData elevatedButtonTheme(ColorScheme scheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }

  static TextButtonThemeData textButtonTheme(ColorScheme scheme) {
    return TextButtonThemeData(
      style:
          TextButton.styleFrom(
            foregroundColor: scheme.primary,
            padding: .zero,
            minimumSize: .zero,
          ).copyWith(
            textStyle: WidgetStateProperty.all(
              const TextStyle(decoration: TextDecoration.underline),
            ),
          ),
    );
  }
}
