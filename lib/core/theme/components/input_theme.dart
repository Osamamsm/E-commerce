import 'package:flutter/material.dart';

class InputThemes {
  static final OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide.none,
  );

  static final EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 14,
  );

  static InputDecorationTheme _buildTheme({
    required Color fillColor,
    TextStyle? hintStyle,
  }) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor.withValues(alpha: .5),
      hintStyle: hintStyle,
      contentPadding: _padding,
      border: _border,
      enabledBorder: _border,
      focusedBorder: _border,
      errorBorder: _border,
      focusedErrorBorder: _border,
    );
  }

  static final InputDecorationTheme lightInputTheme = _buildTheme(
    fillColor: Colors.white,
  );

  static final InputDecorationTheme darkInputTheme = _buildTheme(
    fillColor: const Color(0xFF1A1A1A),
    hintStyle: const TextStyle(color: Colors.grey),
  );
}
