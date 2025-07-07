import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingController extends GetxController {
  bool _loading = false;
  bool get loading => _loading;
  bool hasInternet = true;
  bool isDarkMode = false;

  @override
  void onReady() {
    super.onReady();
    getIsDarkMode();
  }

  setLoad(bool status) {
    _loading = status;
    update();
  }

  setHasInternet(bool status) {
    hasInternet = status;
    update();
  }

  void getIsDarkMode() {
    isDarkMode = Get.isDarkMode;
    var theme = Theme.of(Get.context!).brightness == Brightness.dark;

    print("Is Dark Mode =" + Get.context!.isDarkMode.toString());
    update();
  }

  void setDarkModeValue(bool value) async {
    isDarkMode = value;
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }
}
