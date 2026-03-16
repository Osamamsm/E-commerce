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
    return _preferences.getString('theme') ?? "system";
  }

  Future<void> setTopicSubscription(String topic, bool value) async {
  await _preferences.setBool('topic_$topic', value);
}

bool getTopicSubscription(String topic) {
  return _preferences.getBool('topic_$topic') ?? false;
}
}
