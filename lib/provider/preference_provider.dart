import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceProvider extends ChangeNotifier {
  SharedPreferences? _sharedPreferences;
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  PreferenceProvider() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _isDarkTheme = _sharedPreferences?.getBool("isDarkTheme") ?? false;
    notifyListeners();
  }

  Future<void> setTheme(bool isDark) async {
    _isDarkTheme = isDark;
    await _sharedPreferences?.setBool("isDarkTheme", isDark);
    notifyListeners();
  }
}
