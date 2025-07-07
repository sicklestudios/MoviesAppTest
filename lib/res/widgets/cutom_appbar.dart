import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tentwenty/res/app_colors.dart';
import 'package:tentwenty/res/widgets/custom_text_widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;
  final bool showBackButton;
  final List<Widget>? actions;
  final Function? backFunction;
  final double? scrolledUnderElevation;
  final Widget? title;
  const CustomAppBar({
    required this.appBarTitle,
    this.showBackButton = true,
    this.actions,
    this.backFunction,
    this.scrolledUnderElevation = 0,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 10,
      scrolledUnderElevation: scrolledUnderElevation,
      title:
          title ??
          CustomTextWidget(
            appBarTitle,
            fontSize: 18,
            fontColor: Colors.black,
            fontWeight: FontWeight.bold,
          ),
      centerTitle: false,
      leading:
          showBackButton
              ? Padding(
                padding: const EdgeInsets.only(
                  left: 5.0,
                  right: 10,
                  top: 8,
                  bottom: 8,
                ),
                child: SizedBox(
                  width: 30, // Adjust this size as needed
                  height: 35, // Adjust this size as needed
                  child: InkWell(
                    onTap: () {
                      print("Is backFunction null? ${backFunction == null}");

                      if (backFunction != null) {
                        backFunction!();
                        print("Getting back button");
                      }
                      Get.back();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            Get.isDarkMode
                                ? AppColors.mainScaffolDarkColor
                                : AppColors.backButtonbackground,
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 18, // Adjust size to fit your design
                        ),
                      ),
                    ),
                  ),
                ),
              )
              : null,
      actions: actions,
      // actions: [
      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //   child: Container(
      //     decoration: BoxDecoration(
      //       color: Get.isDarkMode
      //           ? AppColors.mainScaffolDarkColor
      //           : AppColors.backButtonbackground,
      //       borderRadius: BorderRadius.circular(20),
      //     ),
      //     child: const Padding(
      //       padding: EdgeInsets.all(8.0),
      //       child: Icon(
      //         Icons.notifications_none_rounded,
      //         size: 28,
      //         weight: 50,
      //       ),
      //     ),
      //   ),
      // )
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
