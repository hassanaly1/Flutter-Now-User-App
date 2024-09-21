import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:user_app/helpers/custom_button.dart';
import 'package:user_app/helpers/custom_text.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/toast.dart';
import 'package:user_app/views/authentications/login.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<FormState> _otpFormKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  final RxInt _start = 60.obs;
  final RxBool _timerInProgress = true.obs;

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start.value == 0) {
        _timerInProgress.value = false;
        timer.cancel();
      } else {
        _start.value--;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

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
                    key: _otpFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: context.height * 0.15),
                        Image.asset('assets/images/app-logo.png'),
                        const SizedBox(height: 16.0),
                        const CustomTextWidget(
                          text:
                              'We\'ve sent an OTP to your email. Please enter it below to continue.',
                          fontSize: 14.0,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
                          textColor: Colors.white70,
                          maxLines: 2,
                        ),
                        SizedBox(height: context.height * 0.05),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Pinput(
                            length: 6,
                            keyboardType: TextInputType.number,
                            controller: _otpController,
                            validator: (s) => s!.isEmpty
                                ? 'Please Enter OTP we have sent to your email.'
                                : null,
                            errorTextStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12.0,
                              color: Colors.redAccent,
                            ),
                            pinputAutovalidateMode:
                                PinputAutovalidateMode.onSubmit,
                            showCursor: true,
                            closeKeyboardWhenCompleted: true,
                            defaultPinTheme: PinTheme(
                              width: 56,
                              height: 60,
                              textStyle: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(30, 60, 87, 1),
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(222, 231, 240, .57),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.transparent),
                              ),
                            ),
                            focusedPinTheme: PinTheme(
                              width: 64,
                              height: 68,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(222, 231, 240, .57),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 2.0,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: AppColors.buttonColor),
                              ),
                            ),
                            errorPinTheme: PinTheme(
                              width: 56,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 234, 238, 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onCompleted: (pin) {
                              if (_otpFormKey.currentState!.validate()) {
                                Get.off(() => const LoginScreen(),
                                    transition: Transition.size,
                                    duration: 400.milliseconds);
                                MyCustomSuccessToast(
                                  title: 'OTP Verified Successfully',
                                  backgroundColor: AppColors.successColor,
                                ).showToast(context);
                              }
                            },
                          ),
                        ),
                        SizedBox(height: context.height * 0.02),
                        Obx(() {
                          return _timerInProgress.value
                              ? CustomTextWidget(
                                  text: 'Resend OTP in ${_start.value} seconds',
                                  textColor: Colors.white70,
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Column(
                                    children: [
                                      const CustomTextWidget(
                                        text: 'Didn\'t receive the code?',
                                        textColor: Colors.white54,
                                        fontSize: 14.0,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          _timerInProgress.value = true;
                                          _start.value = 60;
                                          // controller.otpController.clear();
                                          // controller.sendOtp();
                                          startTimer();
                                        },
                                        child: const CustomTextWidget(
                                          text: 'Resend OTP',
                                          fontSize: 16.0,
                                          textColor: Colors.white70,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                        }),
                        CustomButton(
                          buttonText: 'Verify OTP',
                          onTap: () {
                            if (_otpFormKey.currentState!.validate()) {
                              Get.off(() => const LoginScreen(),
                                  transition: Transition.size,
                                  duration: 400.milliseconds);
                              MyCustomSuccessToast(
                                title: 'OTP Verified Successfully',
                                backgroundColor: AppColors.successColor,
                              ).showToast(context);
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
