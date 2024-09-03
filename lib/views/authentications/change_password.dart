import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/custom_button.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_textfield.dart';
import 'package:user_app/views/authentications/login.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/auth_background.png', fit: BoxFit.cover),
          SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(backgroundColor: Colors.transparent),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: context.height * 0.15),
                      Image.asset('assets/images/app-logo.png'),
                      const SizedBox(height: 16.0),
                      const CustomTextWidget(
                        text: 'Enter your new password to access your account',
                        fontSize: 14.0,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                        textColor: Colors.white70,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 16.0),
                      const ReUsableTextField(hintText: 'Password'),
                      const SizedBox(height: 16.0),
                      const ReUsableTextField(hintText: 'Confirm Password'),
                      CustomButton(
                        buttonText: 'Confirm Password',
                        onTap: () => Get.offAll(
                          () => const LoginScreen(),
                          transition: Transition.size,
                          duration: const Duration(milliseconds: 400),
                        ),
                      ),
                      SizedBox(height: context.height * 0.01),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
