import 'package:dfa_media_flutter/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataProvider {
  final SharedPreferences _prefs;

  LocalDataProvider(this._prefs);

  String? getTheme() => _prefs.getString(SPrefsKeys.THEME);

  void saveTheme(String themeName) => _prefs.setString(SPrefsKeys.THEME, themeName);
}
