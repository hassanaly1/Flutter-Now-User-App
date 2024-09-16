import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_button.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_textfield.dart';
import 'package:user_app/utils/toast.dart';
import 'package:user_app/utils/validator.dart';
import 'package:user_app/views/authentications/forget_password.dart';
import 'package:user_app/views/authentications/register.dart';
import 'package:user_app/views/home/bottom_navigation_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: context.height * 0.1),
                        Image.asset('assets/images/app-logo.png'),
                        const SizedBox(height: 16.0),
                        const CustomTextWidget(
                          text:
                              'Enter your credentials to access your account.',
                          fontSize: 14.0,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
                          textColor: Colors.white70,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 16.0),
                        ReUsableTextField(
                          hintText: 'Email',
                          controller: _emailController,
                          validator: (v) =>
                              AppValidator.validateEmail(value: v),
                        ),
                        const SizedBox(height: 16.0),
                        ReUsableTextField(
                          hintText: 'Password',
                          controller: _passwordController,
                          obscureText: true,
                          validator: (v) =>
                              AppValidator.validatePassword(value: v),
                        ),
                        const SizedBox(height: 8.0),
                        InkWell(
                          onTap: () => Get.to(
                            () => const ForgetPasswordOrConfirmEmailScreen(
                              isForgetPasswordScreen: true,
                            ),
                            transition: Transition.size,
                            duration: const Duration(milliseconds: 400),
                          ),
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: CustomTextWidget(
                              text: 'Forget Password?',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        CustomButton(
                          buttonText: 'Login',
                          onTap: () {
                            // if (_loginFormKey.currentState!.validate()) {
                            //   Get.offAll(() => const HomeScreen());
                            // }
                            Get.offAll(() => const MyBottomNavigationBar());
                            MyCustomSuccessToast(title: 'Login Successful')
                                .showToast(context);
                          },
                        ),
                        SizedBox(height: context.height * 0.01),
                        Center(
                          child: GestureDetector(
                            onTap: () => Get.to(
                              () => const RegisterScreen(),
                              transition: Transition.size,
                              duration: const Duration(milliseconds: 400),
                            ),
                            child: const Text.rich(
                              TextSpan(
                                text: 'If you don’t have any account? ',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: AppColors.whiteTextColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12.0),
                                children: [
                                  TextSpan(
                                    text: 'Register',
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
                        const CustomTextWidget(
                          text: 'or login with',
                          fontSize: 12.0,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: context.height * 0.01),
                        CustomButton(
                          useButtonColor: false,
                          buttonText: 'Sign In with Google',
                          hasIcon: true,
                          iconUrl: 'assets/images/google.png',
                          onTap: () {},
                        ),
                      ],
                    ),
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
