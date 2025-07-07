import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tentwenty/res/app_colors.dart';
import 'package:tentwenty/view_model/loading_screen_controller.dart';
import 'package:tentwenty/views/home_main_scaffold.dart';
import 'package:tentwenty/views/loading_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //initalizing notifications
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(MyApp());
  });
  LoadingController loadingController = Get.put(
    LoadingController(),
    permanent: true,
  );
  Connectivity().onConnectivityChanged.listen((
    List<ConnectivityResult> result,
  ) {
    // Got a new connectivity status!
    if (result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.ethernet)) {
      // I am not connected to any network.
      loadingController.setHasInternet(true);
    } else {
      loadingController.setHasInternet(false);
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      builder: LoadingScreen.init(),

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainColor),
      ),
      home: HomeMainScaffold(),
    );
  }
}
