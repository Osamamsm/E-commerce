import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class SizeDropdownTrigger extends StatelessWidget {
  const SizeDropdownTrigger({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: theme.colorScheme.outline),
      ),
      child: Row(
        children: [
          Text(S.of(context).size, style: theme.textTheme.titleMedium),
          const Spacer(),
          Text(value, style: theme.textTheme.titleMedium),
          hGap(8),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
