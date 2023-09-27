import 'package:flutter/material.dart';
import 'package:islamic/Home/shared/constant.dart';

class AppConfigProvider extends ChangeNotifier {

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    } else {
      appLanguage = newLanguage;
      notifyListeners();
    }
  }

  void changeTheme(ThemeMode newMode) {
    if (appTheme == newMode) {
      return;
    } else {
      appTheme = newMode;
      notifyListeners();
    }
  }
}
