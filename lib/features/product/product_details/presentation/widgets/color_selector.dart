import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/product/data/models/variation_option.dart';
import 'package:e_commerce/features/product/product_details/presentation/widgets/color_selector_item.dart';
import 'package:flutter/material.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({
    super.key,
    required this.options,
    required this.selectedOptionEn,
    required this.onChanged,
    required this.size,
    required this.activeBorderColor,
    required this.isOutOfStock,
  });

  final List<VariationOption> options;
  final String? selectedOptionEn;
  final ValueChanged<String> onChanged;
  final double size;
  final Color activeBorderColor;
  final bool Function(String optionEn) isOutOfStock;

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
              itemCount: options.length,
              separatorBuilder: (_, __) => hGap(8),
              itemBuilder: (context, index) {
                final option = options[index];
                return ColorSelectorItem(
                  option: option,
                  isSelected: selectedOptionEn == option.optionEn,
                  outOfStock: isOutOfStock(option.optionEn),
                  size: size,
                  activeBorderColor: activeBorderColor,
                  onTap: () => onChanged(option.optionEn),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
