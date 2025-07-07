import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:tentwenty/res/app_colors.dart';
import 'package:tentwenty/res/widgets/custom_text_widgets.dart';

class AppUtils {
  static void showGeneralSnackbar(
    String title,
    String message, {
    Color? color,
  }) {
    Get.snackbar(title, message, colorText: color);
  }

  static Widget verticalDivider() {
    return Container(
      width: 1,
      // margin: const EdgeInsets.symmetric(horizontal: 8),
      color: AppColors.getDividerColor,
    );
  }

  static Widget horizontalDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: AppColors.getDividerColor,
    );
  }

  static void showTaost(String message, {Color? color}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.mainColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static Center getNothingFound(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.report_sharp,
            size: 100,
            color: AppColors.getDarkTextColor,
          ),
          CustomTextWidget(
            message,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontColor: AppColors.getDarkTextColor,
          ),
        ],
      ),
    );
  }

  static String _getInitials(String name) {
    final words = name.trim().split(RegExp(r'\s+')); // splits by any whitespace
    if (words.length == 1) {
      return words.first[0].toUpperCase();
    } else {
      return (words[0][0] + words[1][0]).toUpperCase();
    }
  }

  static Widget getCircularInitials(String name, {double? radius}) {
    final initials = _getInitials(name);

    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.mainColor, // Customize as needed
      foregroundColor: Colors.white,
      child: CustomTextWidget(
        initials,
        fontColor: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: (radius != null ? radius / 2 : 16),
      ),
    );
  }
}
