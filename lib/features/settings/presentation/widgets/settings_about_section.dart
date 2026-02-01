import 'package:e_commerce/features/settings/presentation/widgets/link_item.dart';
import 'package:e_commerce/features/settings/presentation/widgets/settings_section.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class SettingsAboutSection extends StatelessWidget {
  const SettingsAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: S.of(context).about,
      icon: 'ℹ️',
      children: [
        LinkItem(
          label: S.of(context).privacy_policy,
          icon: Icons.privacy_tip,
          colors: [Color(0xFF3B82F6), Color(0xFF7C3AED)],
          onTap: () {},
        ),
        LinkItem(
          label: S.of(context).terms_of_service,
          icon: Icons.description,
          colors: [Color(0xFF3B82F6), Color(0xFF7C3AED)],
          onTap: () {},
        ),
      ],
    );
  }
}
