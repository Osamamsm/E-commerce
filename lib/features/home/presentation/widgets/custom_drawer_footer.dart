import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomDrawerFooter extends StatelessWidget {
  const CustomDrawerFooter({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 20,
            color: theme.colorScheme.primary,
          ),
          hGap(8),
          Text(
            S.of(context).app_name,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
