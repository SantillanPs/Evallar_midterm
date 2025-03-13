import 'dart:async';

class ThemeService {
  // In a real app, you would use SharedPreferences to persist this value
  // Since we're not using packages, we'll use a simple in-memory solution
  static bool _isDarkMode = false;

  Future<bool> isDarkMode() async {
    // Simulate async operation like reading from SharedPreferences
    return Future.value(_isDarkMode);
  }

  Future<void> setDarkMode(bool value) async {
    // Simulate async operation like writing to SharedPreferences
    _isDarkMode = value;
  }
}
