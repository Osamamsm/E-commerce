import 'package:flutter/material.dart';

class AppTypography {
  AppTypography._();

  // Base font family — swap with your chosen font if needed
  // e.g. 'Inter', 'Plus Jakarta Sans', 'Nunito'
  static const String _fontFamily = 'Roboto';

  static const TextTheme textTheme = TextTheme(
    // ── Headlines ─────────────────────────────────────────────
    // Use for: page titles, hero banners, big promotional text
    headlineLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
      height: 1.25,
    ),
    // Use for: section headers, category titles
    headlineMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 26,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.3,
      height: 1.3,
    ),
    // Use for: card headers, dialog titles
    headlineSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
      height: 1.35,
    ),

    // ── Titles ─────────────────────────────────────────────────
    // Use for: screen titles in AppBar, bottom sheet headers
    titleLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.1,
      height: 1.4,
    ),
    // Use for: product names, list item titles, tab labels
    titleMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
      height: 1.5,
    ),
    // Use for: sub-section labels, form field labels
    titleSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
      height: 1.5,
    ),

    // ── Body ───────────────────────────────────────────────────
    // Use for: product descriptions, review text, long paragraphs
    bodyLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      height: 1.6,
    ),
    // Use for: secondary descriptions, metadata, list subtitles
    bodyMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.2,
      height: 1.57,
    ),
    // Use for: captions, timestamps, helper text, tags
    bodySmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.3,
      height: 1.5,
    ),

    // ── Labels ─────────────────────────────────────────────────
    // Use for: buttons text, prominent chips
    labelLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 15,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.4,
      height: 1.4,
    ),
    // Use for: badge text, filter chips, small buttons
    labelMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.4,
      height: 1.4,
    ),
    // Use for: price tags, status indicators, tiny badges
    labelSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.4,
    ),
  );
}
