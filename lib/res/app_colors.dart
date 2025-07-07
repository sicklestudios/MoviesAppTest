import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  static Color mainColor = const Color.fromARGB(255, 46, 39, 57);

  static Color get lightMainColor =>
      Get.isDarkMode
          ? AppColors.mainColor.withOpacity(0.4)
          : Colors.green.withOpacity(0.15);

  // static Color lightMainColor = const Color.fromARGB(255, 231, 253, 230);
  // static Color lightMainColor = Colors.red;
  static Color onboardingButtonColor = const Color.fromARGB(255, 16, 115, 39);
  static Color mainScaffolColor = const Color.fromARGB(
    255,
    243,
    246,
    244,
    // 235,
    // 235,
    // 235
  );
  static Color get appBordersColor =>
      Get.isDarkMode
          ? AppColors.tasksBadgeColor!
          : const Color.fromARGB(255, 235, 235, 235);
  static Color get getDividerColor =>
      Get.isDarkMode
          ? const Color.fromARGB(255, 44, 44, 44)
          : const Color.fromARGB(255, 178, 177, 177);
  static Color? get getDarkTextColor =>
      Get.isDarkMode ? const Color.fromARGB(255, 83, 83, 83) : null;

  static Color get getBackroundColor =>
      Get.isDarkMode
          ? const Color.fromARGB(255, 44, 44, 44)
          : const Color.fromARGB(255, 235, 235, 235);

  static Color? get tasksBadgeColor =>
      Get.isDarkMode ? const Color.fromARGB(255, 65, 65, 65) : null;
  static Color get getDropDownColor =>
      Get.isDarkMode ? const Color.fromARGB(255, 65, 65, 65) : Colors.white;

  //
  static Color appBarDarkColor = const Color.fromARGB(111, 0, 0, 0);
  static Color iconColorsForeground = const Color.fromARGB(255, 45, 154, 71);
  static Color outlinedButtonColor = const Color.fromARGB(255, 145, 145, 145);
  static Color mainScaffolDarkColor = const Color.fromARGB(221, 44, 44, 44);
  static Color textfieldBorderColor = const Color.fromARGB(255, 145, 145, 145);
  static Color cardBorderColor = const Color.fromARGB(255, 235, 235, 235);
  //backButtonBackground
  static Color backButtonbackground = const Color.fromARGB(255, 238, 242, 239);
  // static Color textfieldBorderColor = const Color.fromARGB(255, 232, 236, 244);
  //

  static Color blackColor = Colors.black;
  static Color whiteColor = Colors.white;
  //
}
