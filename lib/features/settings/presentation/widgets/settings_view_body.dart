import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/settings/presentation/widgets/general_settings_section.dart';
import 'package:e_commerce/features/settings/presentation/widgets/notifications_settings_section.dart';
import 'package:e_commerce/features/settings/presentation/widgets/security_settings_section.dart';
import 'package:e_commerce/features/settings/presentation/widgets/settings_about_section.dart';
import 'package:e_commerce/features/settings/presentation/widgets/settings_support_section.dart';
import 'package:flutter/material.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          GeneralSettingsSection(),
          vGap(24),
          SecuritySettingsSection(),
          vGap(24),
          NotificationsSettingsSection(),
          vGap(24),
          SettingsAboutSection(),
          vGap(24),
          SettingsSupportSection(),
          vGap(24),
        ],
      ),
    );
  }
}
