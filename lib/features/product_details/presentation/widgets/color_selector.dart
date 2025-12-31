import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/color_selector_item.dart';
import 'package:flutter/material.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({
    super.key,
    required this.colors,
    required this.selectedIndex,
    required this.onChanged,
    required this.size,
    required this.activeBorderColor,
  });

  final List<Map<String, dynamic>> colors;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  final double size;
  final Color activeBorderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: colors.length,
              separatorBuilder: (context, index) => hGap(8),
              itemBuilder: (context, index) {
                final isSelected = index == selectedIndex;
                return ColorSelectorItem(
                  onChanged: onChanged,
                  size: size,
                  isSelected: isSelected,
                  activeBorderColor: activeBorderColor,
                  colors: colors,
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
