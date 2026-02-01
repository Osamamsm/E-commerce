import 'package:e_commerce/features/settings/presentation/widgets/settings_item.dart';
import 'package:e_commerce/features/settings/presentation/widgets/settings_section.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class GeneralSettingsSection extends StatefulWidget {
  const GeneralSettingsSection({super.key});

  @override
  State<GeneralSettingsSection> createState() => _GeneralSettingsSectionState();
}

class _GeneralSettingsSectionState extends State<GeneralSettingsSection> {
  String _selectedLanguage = 'English(US)';
  String _selectedTheme = 'Light';
  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: S.of(context).general,
      icon: '⚙️',
      children: [
        SettingsItem(
          title: S.of(context).language,
          selectLabel: S.of(context).select_language,
          icon: Icons.language,
          value: _selectedLanguage,
          options: ['English(US)', 'Arabic'],
          onChanged: (value) {
            setState(() {
              _selectedLanguage = value;
            });
          },
          colors: [Color(0xFF3B82F6), Color(0xFF7C3AED)],
        ),
        SettingsItem(
          title: S.of(context).theme,
          selectLabel: S.of(context).select_theme,
          icon: Icons.dark_mode,
          value: _selectedTheme,
          options: ['Light', 'Dark', 'System'],
          onChanged: (value) {
            setState(() {
              _selectedTheme = value;
            });
          },
          colors: [Color.fromARGB(255, 77, 10, 150), Color(0xFF7C3AED)],
        ),
      ],
    );
  }
}
