import 'package:flutter/material.dart';

class BlurryCircle extends StatelessWidget {
  const BlurryCircle({
    super.key,
    required this.color,
    required this.size,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  final Color color;
  final double size;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: [color, Colors.transparent]),
        ),
      ),
    );
  }
}
