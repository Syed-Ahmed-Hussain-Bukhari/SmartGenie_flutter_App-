import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool isDarkMode = false;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
    update();
  }
}

// final ThemeData themeDataLight = new ThemeData(
//     brightness: Brightness.light,
//     primaryColor: Colors.orange[500],
//     // primaryColorBrightness: Brightness.light,
//     scaffoldBackgroundColor: Colors.grey[200],
// );

// final ThemeData themeDataDark = ThemeData(
//   brightness: Brightness.dark,
//   primaryColor: Colors.orange[700],
//   // primaryColorBrightness: Brightness.dark,
//   scaffoldBackgroundColor: Colors.grey[850],

// );