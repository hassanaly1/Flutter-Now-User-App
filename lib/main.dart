import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/storage_helper.dart';
import 'package:user_app/views/authentications/onboarding.dart';
import 'package:user_app/views/home/bottom_navigation_bar.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(const Duration(seconds: 3), () {
    FlutterNativeSplash.remove();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Screen Height: ${context.height}');
    debugPrint('Screen Width: ${context.width}');
    bool isFirstTime = appStorage.read('isFirstTime') ?? true;
    log('IsFirstTime: $isFirstTime');
    return GetMaterialApp(
      // initialBinding: InitialScreenBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Now-User-App',
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(iconTheme: IconThemeData(color: Colors.white60)),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.buttonColor),
        scaffoldBackgroundColor: AppColors.backgroundColor,
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: isFirstTime
          ? const OnBoardingScreen()
          : const MyBottomNavigationBar(),
    );
  }
}

// class InitialScreenBindings implements Bindings {
//   InitialScreenBindings();
//
//   @override
//   void dependencies() {
//     Get.put(MyUniversalController());
//   }
// }
