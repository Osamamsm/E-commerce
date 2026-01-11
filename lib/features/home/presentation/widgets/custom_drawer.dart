import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_drawer_button.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_menu_item.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      width: 250,
      backgroundColor: theme.colorScheme.secondary,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                vGap(20),
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50, color: Colors.grey),
                ),
                vGap(10),
                const Text(
                  'OSAMA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                vGap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomDrawerButton(
                      icon: Icons.person_outline,
                      label: S.of(context).profile,
                      onTap: () {},
                    ),
                    hGap(80),
                    CustomDrawerButton(
                      icon: Icons.settings_outlined,
                      label: S.of(context).settings,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          vGap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: Constants.getMenuItems(context)
                  .map(
                    (e) => CustomMenuItem(
                      icon: e.icon,
                      label: e.label,
                      onTap: e.onTap,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
