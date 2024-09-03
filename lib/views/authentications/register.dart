import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_button.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_textfield.dart';
import 'package:user_app/utils/toast.dart';
import 'package:user_app/views/authentications/login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                      SizedBox(height: context.height * 0.1),
                      Image.asset('assets/images/app-logo.png'),
                      const SizedBox(height: 16.0),
                      const CustomTextWidget(
                        text:
                            'Register to get started with our amazing features.',
                        fontSize: 14.0,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                        textColor: Colors.white70,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 16.0),
                      const ReUsableTextField(hintText: 'Name'),
                      const SizedBox(height: 16.0),
                      const ReUsableTextField(hintText: 'Email'),
                      const SizedBox(height: 16.0),
                      const ReUsableTextField(hintText: 'Password'),
                      CustomButton(
                        buttonText: 'Register',
                        onTap: () {
                          MyCustomErrorToast(
                            title: 'Account Created Successfully',
                          ).showToast(context);
                        },
                      ),
                      SizedBox(height: context.height * 0.01),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const LoginScreen(),
                              transition: Transition.size,
                              duration: const Duration(seconds: 1),
                            );
                          },
                          child: Text.rich(
                            TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: AppColors.whiteTextColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.0),
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                      color: AppColors.buttonColor,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.0),
                                ),
                              ],
                            ),
                          ),
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
