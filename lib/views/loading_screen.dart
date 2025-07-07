import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tentwenty/res/app_colors.dart';
import 'package:tentwenty/view_model/loading_screen_controller.dart';

class LoadingScreen {
  static TransitionBuilder init({TransitionBuilder? builder}) {
    return (BuildContext context, Widget? child) {
      if (builder != null) {
        return builder(context, LoadingCustom(child: child!));
      } else {
        return LoadingCustom(child: child!);
      }
    };
  }
}

class LoadingCustom extends StatelessWidget {
  final Widget child;
  const LoadingCustom({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: LoadingController(),
        builder: (controller) {
          return Scaffold(
            body: Stack(
              children: [
                controller.hasInternet
                    ? GestureDetector(
                      onTap: () {
                        Get.focusScope!.unfocus();
                      },
                      child: child,
                    )
                    : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const Image(
                          //   image: AssetImage(ImageAssets.wifi),
                          // ),
                          const SizedBox(height: 10.0),
                          Text(
                            "No internet Connection",
                            style: Get.textTheme.titleLarge,
                          ),
                          const SizedBox(height: 6.0),
                          Text(
                            "Your internet connection is currently\nnot available please check or try again.",
                            textAlign: TextAlign.center,
                            style: Get.textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 20),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     ElevatedButton(
                          //         onPressed: () {},
                          //         style: ElevatedButton.styleFrom(
                          //             backgroundColor: AppColors.first,
                          //             shape: RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(10))),
                          //         child: Text(
                          //           "Retry",
                          //           style: Get.textTheme.bodyLarge,
                          //         )),
                          //     const SizedBox(
                          //       width: 20,
                          //     ),
                          //     ElevatedButton(
                          //         onPressed: () {},
                          //         style: ElevatedButton.styleFrom(
                          //             backgroundColor: Get.theme.scaffoldBackgroundColor,
                          //             shape: RoundedRectangleBorder(
                          //                 side: const BorderSide(
                          //                     color: AppColors.first, width: 1),
                          //                 borderRadius: BorderRadius.circular(10))),
                          //         child: Text(
                          //           "Back",
                          //           style: Get.textTheme.bodyMedium,
                          //         ))
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                controller.loading
                    ? Container(
                      width: Get.width,
                      height: Get.height,
                      color: const Color.fromARGB(
                        255,
                        137,
                        137,
                        137,
                      ).withOpacity(0.9),
                      child: Center(
                        child: LoadingAnimationWidget.hexagonDots(
                          color: AppColors.onboardingButtonColor,
                          size: 80,
                        ),
                      ),
                    )
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }
}
