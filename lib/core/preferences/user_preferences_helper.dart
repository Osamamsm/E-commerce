import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class UserPreferencesHelper {
  final SharedPreferences _preferences;

  UserPreferencesHelper(this._preferences);

  Future<void> setLocale(String language) async {
    await _preferences.setString('locale', language);
  }

  String getLocale() {
    return _preferences.getString('locale') ?? "en";
  }

  Future<void> setTheme(String theme) async {
    await _preferences.setString('theme', theme);
  }

  String getTheme() {
    return _preferences.getString('theme') ?? "Dark";
  }
}
