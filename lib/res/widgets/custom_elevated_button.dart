import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/res/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double width;
  final double height;
  final bool isFilled;
  final bool isGradient;
  final bool isIcon;
  final Widget? icon;
  final double radius;
  const CustomElevatedButton({
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.width = 100,
    this.height = 56,
    this.isFilled = false,
    this.isGradient = false,
    this.isIcon = false,
    this.icon,
    this.radius = 8,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        textStyle: TextStyle(color: foregroundColor, fontSize: 17),
        // side: BorderSide(
        //     color: foregroundColor, style: BorderStyle.solid, width: 1),
        elevation: 0,
        backgroundColor:
            isGradient
                ? Colors.transparent
                : backgroundColor ?? AppColors.mainColor,
        foregroundColor:
            isGradient ? Colors.transparent : foregroundColor ?? Colors.white,
        fixedSize: Size(size.width, height),
      ),
      child:
          isIcon
              ? icon!
              : Text(
                text,
                style: TextStyle(
                  fontFamily: "Badiya LT",
                  color: foregroundColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
    );
  }
}
