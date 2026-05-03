import 'package:e_commerce/features/product/data/models/variation_option.dart';
import 'package:flutter/material.dart';

class ColorSelectorItem extends StatelessWidget {
  const ColorSelectorItem({
    super.key,
    required this.option,
    required this.isSelected,
    required this.outOfStock,
    required this.size,
    required this.activeBorderColor,
    required this.onTap,
  });

  final VariationOption option;
  final bool isSelected;
  final bool outOfStock;
  final double size;
  final Color activeBorderColor;
  final VoidCallback onTap;

  Color _getContrastColor(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  Color _parseHex(String hex) =>
      Color(int.parse(hex.replaceFirst('#', '0xFF')));

  @override
  Widget build(BuildContext context) {
    final color = option.hexCode != null
        ? _parseHex(option.hexCode!)
        : Colors.grey;

    return RepaintBoundary(
      child: GestureDetector(
        onTap:  onTap,
        child: Opacity(
          opacity: outOfStock ? 0.35 : 1.0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOut,
            width: isSelected ? size * 1.9 : size,
            height: size,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size / 2),
              border: isSelected
                  ? Border.all(color: activeBorderColor, width: 2)
                  : null,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(size / 2),
              ),
              // strikethrough line for out of stock
              child: outOfStock
                  ? CustomPaint(painter: _StrikethroughPainter())
                  : isSelected
                      ? TweenAnimationBuilder(
                          tween: Tween(begin: 0.0, end: 1.0),
                          duration: const Duration(milliseconds: 200),
                          curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
                          builder: (context, value, child) =>
                              Opacity(opacity: value, child: child),
                          child: Center(
                            child: Text(
                              option.optionEn,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: _getContrastColor(color)),
                            ),
                          ),
                        )
                      : null,
            ),
          ),
        ),
      ),
    );
  }
}

class _StrikethroughPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(size.width * 0.15, size.height * 0.85),
      Offset(size.width * 0.85, size.height * 0.15),
      Paint()
        ..color = Colors.white.withOpacity(0.8)
        ..strokeWidth = 1.5,
    );
  }

  @override
  bool shouldRepaint(_) => false;
}