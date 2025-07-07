import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/res/app_colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double width;
  final double height;
  final bool isFilled;
  final bool isIcon;
  final Widget? icon;
  final double radius;

  const CustomOutlinedButton({
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.width = 100,
    this.height = 56,
    this.isFilled = false,
    this.isIcon = false,
    this.icon,
    this.radius = 8,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        side: BorderSide(
          color: foregroundColor ?? AppColors.outlinedButtonColor,
          width: 1.5,
        ),
        backgroundColor: isFilled ? backgroundColor : Colors.transparent,
        // foregroundColor: foregroundColor ?? AppColors.outlinedButtonColor,
        fixedSize: Size(size.width, height),
      ),
      child:
          isIcon
              ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon!,
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: TextStyle(
                      fontFamily: "Badiya LT",
                      color: foregroundColor ?? Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
              : Text(
                text,
                style: TextStyle(
                  fontFamily: "Badiya LT",
                  color: foregroundColor ?? AppColors.outlinedButtonColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
    );
  }
}
