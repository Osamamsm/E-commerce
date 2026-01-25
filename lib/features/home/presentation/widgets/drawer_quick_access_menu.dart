import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_menu_item.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class DrawerQuickAccessMenu extends StatelessWidget {
  const DrawerQuickAccessMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(color: theme.colorScheme.secondary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              S.of(context).quick_access,
              style: theme.textTheme.labelSmall,
            ),
          ),
          ...Constants.getMenuItems(context)
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomMenuItem(
                    icon: e.icon,
                    label: e.label,
                    onTap: e.onTap,
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
