import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  ThemeController();

  static const _key = 'theme_mode';

  ThemeMode mode = ThemeMode.dark;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_key);
    if (stored == 'light') {
      mode = ThemeMode.light;
    } else if (stored == 'dark') {
      mode = ThemeMode.dark;
    }
    notifyListeners();
  }

  Future<void> toggle() async {
    mode = mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, mode == ThemeMode.dark ? 'dark' : 'light');
  }
}
