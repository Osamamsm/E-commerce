import 'package:flutter/material.dart';

@immutable
class BlurryBackgroundTheme
    extends ThemeExtension<BlurryBackgroundTheme> {
  final Color primaryBlob;
  final Color secondaryBlob;

  const BlurryBackgroundTheme({
    required this.primaryBlob,
    required this.secondaryBlob,
  });

  @override
  BlurryBackgroundTheme copyWith({
    Color? primaryBlob,
    Color? secondaryBlob,
  }) {
    return BlurryBackgroundTheme(
      primaryBlob: primaryBlob ?? this.primaryBlob,
      secondaryBlob: secondaryBlob ?? this.secondaryBlob,
    );
  }

  @override
  BlurryBackgroundTheme lerp(
    ThemeExtension<BlurryBackgroundTheme>? other,
    double t,
  ) {
    if (other is! BlurryBackgroundTheme) return this;

    return BlurryBackgroundTheme(
      primaryBlob: Color.lerp(primaryBlob, other.primaryBlob, t)!,
      secondaryBlob:
          Color.lerp(secondaryBlob, other.secondaryBlob, t)!,
    );
  }
}
