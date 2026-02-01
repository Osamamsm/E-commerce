import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/features/settings/presentation/logic/cubit/app_settings_cubit.dart';
import 'package:e_commerce/features/settings/presentation/logic/cubit/app_settings_state.dart';
import 'package:e_commerce/features/settings/presentation/widgets/settings_item.dart';
import 'package:e_commerce/features/settings/presentation/widgets/settings_section.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralSettingsSection extends StatelessWidget {
  const GeneralSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var languages = Constants.getLanguageOptions(context);
    var themes = Constants.getThemeOptions(context);
    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
      builder: (context, state) {
        String selectedLanguage = state.locale.languageCode;
        String selectedTheme = state.themeMode.name;
        return SettingsSection(
          title: S.of(context).general,
          icon: '⚙️',
          children: [
            SettingsItem(
              title: S.of(context).language,
              selectLabel: S.of(context).select_language,
              icon: Icons.language,
              value: languages.firstWhere(
                (e) => e['value'] == selectedLanguage,
              )['label'],
              options: languages,
              onChanged: (value) {
                context.read<AppSettingsCubit>().setLocale(Locale(value));
              },
              colors: [Color(0xFF3B82F6), Color(0xFF7C3AED)],
            ),
            SettingsItem(
              title: S.of(context).theme,
              selectLabel: S.of(context).select_theme,
              icon: Icons.dark_mode,
              value: themes.firstWhere(
                (e) => e['value'] == selectedTheme,
              )['label'],
              options: themes,
              onChanged: (value) {
                context.read<AppSettingsCubit>().updateTheme(
                  ThemeMode.values.firstWhere((e) => e.name == value),
                );
              },
              colors: [Color.fromARGB(255, 77, 10, 150), Color(0xFF7C3AED)],
            ),
          ],
        );
      },
    );
  }
}
