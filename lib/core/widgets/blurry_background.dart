import 'dart:ui';
import 'package:e_commerce/core/theme/extensions/blurry_background_theme.dart';
import 'package:e_commerce/core/widgets/blurry_circle.dart';
import 'package:flutter/material.dart';

class BlurryBackground extends StatelessWidget {
  const BlurryBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Theme.of(context).colorScheme.surface),

        BlurryCircle(
          color: Theme.of(
            context,
          ).extension<BlurryBackgroundTheme>()!.primaryBlob,
          top: -120,
          left: -180,
          size: 500,
        ),
        BlurryCircle(
          color: Theme.of(
            context,
          ).extension<BlurryBackgroundTheme>()!.secondaryBlob,
          bottom: -150,
          right: -180,
          size: 500,
        ),

        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: Container(color: Colors.transparent),
        ),
      ],
    );
  }
}
