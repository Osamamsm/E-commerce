import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_drawer_footer.dart';
import 'package:e_commerce/features/home/presentation/widgets/drawer_buttons_row.dart';
import 'package:e_commerce/features/home/presentation/widgets/drawer_header_bloc_builder.dart';
import 'package:e_commerce/features/home/presentation/widgets/drawer_quick_access_menu.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      width: 250,
      backgroundColor: theme.colorScheme.primaryContainer,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.secondary,
                  ],
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  DrawerHeaderBlocBuilder(),
                  vGap(16),
                  DrawerButtonsRow(),
                ],
              ),
            ),
            DrawerQuickAccessMenu(),
            CustomDrawerFooter(),
          ],
        ),
      ),
    );
  }
}
