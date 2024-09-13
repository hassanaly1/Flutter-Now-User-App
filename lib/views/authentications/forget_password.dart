import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/custom_button.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_textfield.dart';
import 'package:user_app/utils/validator.dart';
import 'package:user_app/views/authentications/otp.dart';

class ForgetPasswordOrConfirmEmailScreen extends StatefulWidget {
  final bool isForgetPasswordScreen;

  const ForgetPasswordOrConfirmEmailScreen(
      {super.key, required this.isForgetPasswordScreen});

  @override
  State<ForgetPasswordOrConfirmEmailScreen> createState() =>
      _ForgetPasswordOrConfirmEmailScreenState();
}

class _ForgetPasswordOrConfirmEmailScreenState
    extends State<ForgetPasswordOrConfirmEmailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: context.height * 0.15),
                        Image.asset('assets/images/app-logo.png'),
                        const SizedBox(height: 16.0),
                        CustomTextWidget(
                          text:
                              'Enter your email to ${widget.isForgetPasswordScreen ? 'reset your password' : 'verify your email'}.',
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
                          validator: (value) =>
                              AppValidator.validateEmail(value: value),
                        ),
                        CustomButton(
                          buttonText: 'Send OTP',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Get.off(
                                () => const OtpScreen(),
                                transition: Transition.size,
                                duration: const Duration(milliseconds: 400),
                              );
                            }
                          },
                        ),
                        SizedBox(height: context.height * 0.01),
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
