import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_drawer_button.dart';
import 'package:e_commerce/features/profile/presentation/views/profile_view.dart';
import 'package:e_commerce/features/settings/presentation/views/settings_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerButtonsRow extends StatelessWidget {
  const DrawerButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: CustomDrawerButton(
            icon: Icons.person_outline,
            label: S.of(context).profile,
            onTap: () {
              GoRouter.of(context).push(ProfileView.routeName);
            },
          ),
        ),
        hGap(12),
        Expanded(
          child: CustomDrawerButton(
            icon: Icons.settings_outlined,
            label: S.of(context).settings,
            onTap: () {
              GoRouter.of(context).push(SettingsView.routeName);
            },
          ),
        ),
      ],
    );
  }
}
