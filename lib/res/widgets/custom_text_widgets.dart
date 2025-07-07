import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextWidget extends StatelessWidget {
  final bool isDinarStyle;
  final bool isRequired;
  final String text;
  final double? fontSize;
  Color? fontColor;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final bool underline;
  final TextOverflow? textOverflow;
  final TextStyle? customTextStyle;

  CustomTextWidget(this.text,
      {this.isDinarStyle = true,
      this.fontSize,
      super.key,
      this.fontWeight,
      this.fontStyle,
      this.isRequired = false,
      this.textAlign,
      this.underline = false,
      this.textOverflow,
      this.customTextStyle,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    fontColor ??= Get.isDarkMode ? Colors.white : Colors.black;

    if (!isRequired) {
      return Text(
        text.tr,
        textAlign: textAlign,
        overflow: textOverflow,
        style: customTextStyle ??
            TextStyle(
                fontSize: fontSize,
                color: fontColor,
                decoration: underline ? TextDecoration.underline : null,
                fontWeight: fontWeight,
                fontStyle: fontStyle,
                fontFamily: isDinarStyle ? "GE Dinar One" : "Badiya LT"),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            text.tr,
            overflow: textOverflow,
            style: TextStyle(
                fontSize: fontSize,
                color: fontColor,
                decoration: underline ? TextDecoration.underline : null,
                fontWeight: fontWeight,
                fontStyle: fontStyle,
                fontFamily: isDinarStyle ? "GE Dinar One" : "Badiya LT"),
          ),
        ),
        if (isRequired)
          Text(
            " *",
            style: TextStyle(
                fontSize: fontSize,
                color: Colors.red,
                fontWeight: fontWeight,
                fontStyle: fontStyle,
                fontFamily: isDinarStyle ? "GE Dinar One" : "Badiya LT"),
          ),
      ],
    );
  }
}
