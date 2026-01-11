import 'package:flutter/material.dart';

class InputThemes {
  static final OutlineInputBorder _glassBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(
      color: const Color(0xFF7e22ce).withValues(alpha: .3),
      width: 1,
    ),
  );

  static final OutlineInputBorder _glassFocusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(
      color: const Color(0xFF9333ea).withValues(alpha: .6),
      width: 2,
    ),
  );

  static final EdgeInsets _padding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 16,
  );

  static InputDecorationTheme _buildTheme({
    required Color fillColor,
    TextStyle? hintStyle,
  }) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      hintStyle: hintStyle,
      contentPadding: _padding,
      border: _glassBorder,
      enabledBorder: _glassBorder,
      focusedBorder: _glassFocusedBorder,
      errorBorder: _glassBorder,
      focusedErrorBorder: _glassFocusedBorder,
    );
  }

  static final InputDecorationTheme lightInputTheme = _buildTheme(
    fillColor: Colors.white.withValues(alpha: .1),
    hintStyle: TextStyle(
      color: Colors.white.withValues(alpha: .5),
      fontSize: 14,
    ),
  );

  static final InputDecorationTheme darkInputTheme = _buildTheme(
    fillColor: const Color(0xFF581c87).withValues(alpha: .3),
    hintStyle: TextStyle(
      color: Colors.white.withValues(alpha: .5),
      fontSize: 14,
    ),
  );

  // Glass input theme specifically for the purple gradient background
  static final InputDecorationTheme glassInputTheme = _buildTheme(
    fillColor: const Color(0xFF581c87).withValues(alpha: .3),
    hintStyle: TextStyle(
      color: Colors.white.withValues(alpha: .5),
      fontSize: 14,
    ),
  );
}
