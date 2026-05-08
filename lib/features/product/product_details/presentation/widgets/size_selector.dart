import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:e_commerce/features/product/data/models/variation_option.dart';
import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  const SizeSelector({
    super.key,
    required this.options,
    required this.selectedOptionEn,
    required this.onChanged,
    required this.isOutOfStock,
  });

  final List<VariationOption> options;
  final String? selectedOptionEn;
  final ValueChanged<String> onChanged;
  final bool Function(String optionEn) isOutOfStock;

  @override
  Widget build(BuildContext context) {
    // Build the map the package expects, with out-of-stock styled differently
    final childrenMap = {
      for (final opt in options)
        opt.optionEn: Text(
          opt.optionEn,
          style: TextStyle(
            decoration: isOutOfStock(opt.optionEn)
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: isOutOfStock(opt.optionEn)
                ? Theme.of(context).colorScheme.outline
                : null,
          ),
        ),
    };

    return CustomSlidingSegmentedControl<String>(
      initialValue: selectedOptionEn,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      thumbDecoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      isStretch: true,
      children: childrenMap,
      onValueChanged: (value) {
        // Silently ignore taps on out-of-stock options
        onChanged(value);
      },
    );
  }
}
