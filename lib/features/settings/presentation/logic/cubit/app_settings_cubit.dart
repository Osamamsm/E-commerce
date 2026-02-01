import 'package:e_commerce/core/preferences/user_preferences_helper.dart';
import 'package:e_commerce/features/settings/presentation/logic/cubit/app_settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppSettingsCubit extends Cubit<AppSettingsState> {
  final UserPreferencesHelper _preferencesHelper;
  AppSettingsCubit(this._preferencesHelper)
    : super(AppSettingsState.initial()) {
    final locale = _preferencesHelper.getLocale();
    final theme = _preferencesHelper.getTheme();
    emit(state.copyWith(locale: Locale(locale), themeMode: _mapStringToThemeMode(theme)));
  }

  void updateTheme(ThemeMode themeMode) async {
    await _preferencesHelper.setTheme(themeMode.name);
    emit(state.copyWith(themeMode: themeMode));
  }

  void setLocale(Locale locale) async {
    await _preferencesHelper.setLocale(locale.languageCode);
    emit(state.copyWith(locale: locale));
  }

  static ThemeMode _mapStringToThemeMode(String theme) {
    switch (theme) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
