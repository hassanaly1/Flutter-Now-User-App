import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/common_widgets.dart';
import 'package:user_app/utils/custom_button.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/storage_helper.dart';
import 'package:user_app/views/authentications/login.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/auth_background.png', fit: BoxFit.cover),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.1,
                  vertical: context.height * 0.3),
              child: Column(
                children: [
                  Image.asset('assets/images/app-logo.png'),
                  const SizeBetweenWidgets(),
                  CustomTextWidget(
                    text: 'Welcome to Now User App',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.whiteTextColor,
                  ),
                  const SizedBox(height: 6.0),
                  CustomTextWidget(
                    text: 'Your Ultimate Ride Sharing and Delivery Solution',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.whiteTextColor,
                  ),
                  const SizeBetweenWidgets(),
                  const SizeBetweenWidgets(),
                  MyCustomButton(
                    buttonText: 'Login',
                    onTap: () {
                      appStorage.write('isFirstTime', false);
                      Get.offAll(() => const LoginScreen());
                    },
                  ),
                  MyCustomButton(
                    buttonText: 'Register',
                    onTap: () {
                      appStorage.write('isFirstTime', false);
                      Get.offAll(() => const LoginScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
