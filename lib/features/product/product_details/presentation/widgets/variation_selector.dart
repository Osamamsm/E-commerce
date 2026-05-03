import 'package:e_commerce/features/product/data/models/variation_option.dart';
import 'package:flutter/material.dart';
import 'color_selector.dart';
import 'size_selector.dart';

class VariationSelector extends StatelessWidget {
  const VariationSelector({
    super.key,
    required this.label,
    required this.options,
    required this.selected,
    required this.onSelect,
    required this.isOutOfStock,
  });

  final String label;
  final List<VariationOption> options;
  final String? selected;
  final ValueChanged<String> onSelect;
  final bool Function(String variationEn, String optionEn) isOutOfStock;

  @override
  Widget build(BuildContext context) {
    final hasColors = options.any((o) => o.hexCode != null);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 10),
        if (hasColors)
          ColorSelector(
            options:          options,
            selectedOptionEn: selected,
            onChanged:        onSelect,
            size:             40,
            activeBorderColor: Theme.of(context).colorScheme.primary,
            isOutOfStock:     (optionEn) => isOutOfStock(label, optionEn),
          )
        else
          SizeSelector(
            options:          options,
            selectedOptionEn: selected,
            onChanged:        onSelect,
            isOutOfStock:     (optionEn) => isOutOfStock(label, optionEn),
          ),
      ],
    );
  }
}