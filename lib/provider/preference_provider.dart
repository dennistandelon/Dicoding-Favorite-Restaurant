import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceProvider extends ChangeNotifier {
  SharedPreferences? _sharedPreferences;
  bool _isDarkTheme = false;
  bool _isDailyReminderActive = false;

  bool get isDarkTheme => _isDarkTheme;
  bool get isDailyReminderActive => _isDailyReminderActive;

  PreferenceProvider() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _isDarkTheme = _sharedPreferences?.getBool("isDarkTheme") ?? false;
    _isDailyReminderActive =
        _sharedPreferences?.getBool("isDailyReminderActive") ?? false;
    notifyListeners();
  }

  Future<void> setTheme(bool isDark) async {
    _isDarkTheme = isDark;
    await _sharedPreferences?.setBool("isDarkTheme", isDark);
    notifyListeners();
  }

  Future<void> setDailyReminder(bool isActive) async {
    _isDailyReminderActive = isActive;
    await _sharedPreferences?.setBool("isDailyReminderActive", isActive);
    notifyListeners();
  }
}
