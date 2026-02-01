import 'package:e_commerce/features/settings/presentation/widgets/security_item.dart';
import 'package:e_commerce/features/settings/presentation/widgets/settings_section.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class SecuritySettingsSection extends StatelessWidget {
  const SecuritySettingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: S.of(context).security,
      icon: '🔒',
      children: [
        SecurityItem(
          onTap: () {},
          icon: Icons.email_outlined,
          label: S.of(context).change_email,
          colors: [
            Color.fromARGB(176, 6, 209, 219),
            Color.fromARGB(255, 6, 114, 131),
          ],
        ),
        SecurityItem(
          onTap: () {},
          icon: Icons.lock,
          label: S.of(context).change_password,
          colors: [Color(0xFFF97316), Color(0xFFDC2626)],
        ),
      ],
    );
  }
}
