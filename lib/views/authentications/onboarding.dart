import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/appcolors.dart';
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
          body: Column(
            children: [
              Expanded(flex: 1, child: Container(color: Colors.transparent)),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/app-logo.png'),
                    const SizedBox(height: 6.0),
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
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        CustomButton(
                          buttonText: 'Login',
                          onTap: () {
                            appStorage.write('isFirstTime', false);
                            Get.offAll(() => const LoginScreen());
                          },
                        ),
                        CustomButton(
                          buttonText: 'Register',
                          onTap: () {
                            appStorage.write('isFirstTime', false);
                            Get.offAll(() => const LoginScreen());
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
