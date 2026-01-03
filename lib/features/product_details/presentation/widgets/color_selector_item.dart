import 'package:flutter/material.dart';

class ColorSelectorItem extends StatelessWidget {
  const ColorSelectorItem({
    super.key,
    required this.onChanged,
    required this.size,
    required this.isSelected,
    required this.activeBorderColor,
    required this.colors,
    required this.index,
  });

  final ValueChanged<int> onChanged;
  final double size;
  final bool isSelected;
  final Color activeBorderColor;
  final List<Map<String, dynamic>> colors;
  final int index;

  Color _getContrastColor(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final color = colors[index]['color'] as Color;
    final name = colors[index]['name'] as String;
    return RepaintBoundary(
      child: GestureDetector(
        onTap: () => onChanged(index),
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
            child: isSelected
                ? TweenAnimationBuilder(
                    tween: Tween(begin: 0.0, end: isSelected ? 1.0 : 0.0),
                    duration: const Duration(milliseconds: 200),
                    curve: isSelected
                        ? const Interval(0.5, 1.0, curve: Curves.easeIn)
                        : Curves.easeOut,
                    builder: (context, value, child) {
                      return Opacity(opacity: value, child: child);
                    },
                    child: Center(
                      child: Text(
                        name,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: _getContrastColor(color),
                        ),
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
