import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final storage = GetStorage();
  final key = 'isDarkMode';

  bool loadthemeFromStorage() => storage.read(key) ?? false;

  saveThemeToBox(bool isDarkMode) => storage.write(key, isDarkMode);

  ThemeMode get theme =>
      loadthemeFromStorage() ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    Get.changeThemeMode(
        loadthemeFromStorage() ? ThemeMode.light : ThemeMode.dark);
    saveThemeToBox(!loadthemeFromStorage());
  }


}
