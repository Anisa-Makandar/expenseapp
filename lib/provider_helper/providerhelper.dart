import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;
  static final theme = "isDark";
  Theme_manager() {
    setTheme();
  }

  // Getter to access the current theme mode
  bool getThemeVAlue() => _isDark;

  // Setter to update the theme mode and store it in SharedPreferences
  void setThemeValue(bool value) {
    _isDark = value;
    saveTheme(value);
    notifyListeners();
  }

  void saveTheme(bool isDark) async {
    SharedPreferences mpref = await SharedPreferences.getInstance();
    mpref.setBool(theme, isDark);
  }

  // Method to load the theme value from SharedPreferences
  Future<void> setTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDark =
        prefs.getBool('isDarkTheme') ?? false; // Default to false if not set
    notifyListeners();
  }
}
