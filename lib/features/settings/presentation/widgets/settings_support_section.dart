import 'package:e_commerce/features/settings/presentation/widgets/link_item.dart';
import 'package:e_commerce/features/settings/presentation/widgets/settings_section.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class SettingsSupportSection extends StatelessWidget {
  const SettingsSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: S.of(context).support,
      icon: '💬',
      children: [
        LinkItem(
          label: S.of(context).help_center,
          icon: Icons.help,
          colors: [Color(0xFF3B82F6), Color(0xFF7C3AED)],
          onTap: () {},
        ),
        LinkItem(
          label: S.of(context).contact_us,
          icon: Icons.contact_support,
          colors: [Color(0xFF3B82F6), Color(0xFF7C3AED)],
          onTap: () {},
        ),
        LinkItem(
          label: 'App Version 2.4.1',
          icon: Icons.mobile_friendly,
          colors: [Color(0xFF3B82F6), Color(0xFF7C3AED)],
          onTap: () {},
        ),
      ],
    );
  }
}
