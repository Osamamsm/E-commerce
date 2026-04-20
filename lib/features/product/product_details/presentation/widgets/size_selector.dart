import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

class SizeSelector extends StatelessWidget {
  const SizeSelector({
    super.key,
    required this.childrenMap,
  });

  final Map<String, Text> childrenMap;

  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl<String>(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
      thumbDecoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      isStretch: true,
      children: childrenMap,
      onValueChanged: (value) {},
    );
  }
}