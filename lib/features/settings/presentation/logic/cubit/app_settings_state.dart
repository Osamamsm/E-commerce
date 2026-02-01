import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppSettingsState extends Equatable {
  final Locale locale;
  final ThemeMode themeMode;

  const AppSettingsState({required this.locale, required this.themeMode});

  factory AppSettingsState.initial() {
    return const AppSettingsState(themeMode: ThemeMode.system, locale: Locale("en"));
  }

  AppSettingsState copyWith({ThemeMode? themeMode, Locale? locale}) {
    return AppSettingsState(  
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object> get props => [themeMode, locale];
}
