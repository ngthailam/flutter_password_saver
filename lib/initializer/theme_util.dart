import 'package:flutter/material.dart';
import 'package:flutter_password_saver/main.dart';

bool isDarkMode() {
  return MyApp.themeNotifier.value == ThemeMode.dark;
}

void changeThemeMode() {
  MyApp.themeNotifier.value = isDarkMode() ? ThemeMode.light : ThemeMode.dark;
}
