import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/res/app_colors.dart';
import 'package:tentwenty/views/dashboard/dashboard_screen.dart';

class HomeMainScaffold extends StatefulWidget {
  const HomeMainScaffold({super.key});

  @override
  State<HomeMainScaffold> createState() => _HomeMainScaffoldState();
}

class _HomeMainScaffoldState extends State<HomeMainScaffold> {
  int index = 0;
  List screensList = [DashboardScreen(), Container(), Container(), Container()];
  List iconsList = [
    Icons.dashboard,
    Icons.video_library,
    Icons.folder,
    Icons.menu,
  ];
  List textList = ["Dashboard", "Watch", "Media Library", "More"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensList[index],

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        scaleFactor: 1,
        height: 70,

        backgroundColor: AppColors.mainColor,
        itemCount: screensList.length, // Number of items
        splashSpeedInMilliseconds: 0, // Stops the splash animation
        splashRadius: 0, // Removes splash radius
        leftCornerRadius: 27,
        rightCornerRadius: 27,
        tabBuilder: (int index, bool isActive) {
          final color =
              isActive
                  ? Colors.white
                  : (Get.isDarkMode
                      ? Color.fromARGB(255, 130, 125, 136)
                      : Color.fromARGB(
                        255,
                        130,
                        125,
                        136,
                      )); // Set color based on dark mode
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SvgPicture.asset(
              //   isActive
              //       ? controller.iconsFilled[index] // Active icon at each index
              //       : controller.icons[index], // Icon at each index
              //   colorFilter:
              //       !isActive ? ColorFilter.mode(color, BlendMode.srcIn) : null,
              // ),
              Icon(iconsList[index], color: color),
              const SizedBox(height: 4),
              Text(
                textList[index], // Optional label for each tab
                style: TextStyle(color: color, fontSize: 12),
              ),
            ],
          );
        },
        activeIndex: index,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.sharpEdge,
        onTap: (int value) async {
          setState(() {
            index = value;
          }); // Update selected index
        },
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      // currentIndex: controller
      //     .selectedIndex, // Use the selected index from the controller

      //   onTap: (int value) {
      //     controller.selectedIndex = value;
      //     controller.update(); // Update the selected index
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: const Icon(Icons.home_filled, color: Colors.blueGrey),
      //       activeIcon:
      //           Icon(Icons.home_filled, color: AppColors.mainColor),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: const Icon(Icons.remove_red_eye_outlined,
      //           color: Colors.blueGrey),
      //       activeIcon:
      //           Icon(Icons.add_circle, color: AppColors.mainColor),
      //       label: 'Inspection',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: const Icon(Icons.copy_all_rounded,
      //           color: Colors.blueGrey),
      //       activeIcon:
      //           Icon(Icons.add_circle, color: AppColors.mainColor),
      //       label: 'Template',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: const Icon(Icons.more_horiz, color: Colors.blueGrey),
      //       activeIcon: FaIcon(FontAwesomeIcons.clipboardCheck,
      //           color: AppColors.mainColor),
      //       label: 'Report',
      //     ),
      //   ],
      // )
      // body: PersistentTabView(
      //   context,
      //   controller: controller.controller,
      //   screens: controller.screensList,
      //   items: _navBarsItems(),
      //   handleAndroidBackButtonPress: false,
      //   resizeToAvoidBottomInset: false,
      //   stateManagement: true,
      //   hideNavigationBarWhenKeyboardAppears: true,
      //   // hideOnScrollSettings: HideOnScrollSettings(
      //   //   hideNavBarOnScroll: true,
      //   //   scrollControllers: _scrollControllers,
      //   // ),
      //   padding: const EdgeInsets.only(top: 8),
      //   // floatingActionButton: IconButton(
      //   //   icon: Container(
      //   //     padding: const EdgeInsets.all(12),
      //   //     decoration: const BoxDecoration(
      //   //         shape: BoxShape.circle, color: Colors.orange),
      //   //     child: const Icon(
      //   //       Icons.add,
      //   //       color: Colors.white,
      //   //     ),
      //   //   ),
      //   //   onPressed: () {},
      //   // ),
      //   // onWillPop: (final context) async {
      //   //   await showDialog(
      //   //     context: context ?? this.context,
      //   //     useSafeArea: true,
      //   //     builder: (final context) => Container(
      //   //       height: 50,
      //   //       width: 50,
      //   //       color: Colors.white,
      //   //       child: ElevatedButton(
      //   //         child: const Text("Close"),
      //   //         onPressed: () {
      //   //           Navigator.pop(context);
      //   //         },
      //   //       ),
      //   //     ),
      //   //   );
      //   //   return false;
      //   // },
      //   // selectedTabScreenContext: (final context) {
      //   //   testContext = context;
      //   // },
      //   backgroundColor: Colors.grey.shade900,

      //   // isVisible: !_hideNavBar,
      //   animationSettings: const NavBarAnimationSettings(
      //     navBarItemAnimation: ItemAnimationSettings(
      //       // Navigation Bar's items animation properties.
      //       duration: Duration(milliseconds: 400),
      //       curve: Curves.ease,
      //     ),
      //     screenTransitionAnimation: ScreenTransitionAnimationSettings(
      //       // Screen transition animation on change of selected tab.
      //       animateTabTransition: true,
      //       duration: Duration(milliseconds: 300),
      //       screenTransitionAnimationType:
      //           ScreenTransitionAnimationType.fadeIn,
      //     ),
      //     onNavBarHideAnimation: OnHideAnimationSettings(
      //       duration: Duration(milliseconds: 100),
      //       curve: Curves.bounceInOut,
      //     ),
      //   ),
      //   confineToSafeArea: true,
      //   navBarHeight: kBottomNavigationBarHeight,
      //   navBarStyle: NavBarStyle
      //       .style15, // Choose the nav bar style with this property
      // ),
    );
  }
}
