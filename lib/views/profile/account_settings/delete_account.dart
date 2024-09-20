import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/helpers/appbar.dart';
import 'package:user_app/helpers/custom_text.dart';
import 'package:user_app/helpers/heading_and_textfield.dart';
import 'package:user_app/helpers/reusable_container.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/validator.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final GlobalKey<FormState> deletionFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  var isLoading = false.obs;
  RxBool showPassword = false.obs;
  RxBool showOtpTextFields = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppbar(title: 'Delete Account'),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.05, vertical: context.height * 0.05),
        child: Column(
          children: [
            const CustomTextWidget(
              text: 'Account Deletion',
              textColor: Colors.red,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 20.0),
            const CustomTextWidget(
              text:
                  'Enter your email & password so that we can verify your identity.',
              textColor: AppColors.secondaryColor,
              textAlign: TextAlign.center,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              maxLines: 2,
            ),
            const SizedBox(height: 20.0),
            Form(
              // key: deletionFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: context.height * 0.03),
                  CustomTextField(
                    // controller: emailController,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(
                      LucideIcons.atSign,
                      color: AppColors.buttonColor,
                    ),
                    validator: (val) => AppValidator.validateEmail(value: val),
                  ),
                  Obx(
                    () => CustomTextField(
                      // controller: passwordController,
                      hintText: 'Password',
                      prefixIcon: const Icon(
                        LucideIcons.lock,
                        color: AppColors.buttonColor,
                      ),
                      obscureText: showPassword.value,
                      suffixIcon: IconButton(
                        onPressed: () =>
                            showPassword.value = !showPassword.value,
                        icon: Icon(
                          showPassword.value
                              ? LucideIcons.eyeOff
                              : LucideIcons.eye,
                          color: AppColors.buttonColor,
                        ),
                      ),
                      validator: (val) => AppValidator.validateEmptyText(
                        value: val,
                        fieldName: 'Password',
                      ),
                    ),
                  ),
                  // Obx(
                  //       () => Visibility(
                  //     visible: showOtpTextFields.value,
                  //     child: ReUsableTextField(
                  //       controller: otpController,
                  //       hintText: 'Enter Otp',
                  //       keyboardType: TextInputType.number,
                  //       prefixIcon: Icon(
                  //         Icons.password_outlined,
                  //         color: AppColors.primaryColor,
                  //       ),
                  //       validator: (val) =>
                  //           AppValidator.validateEmptyText(
                  //               value: val, fieldName: 'OTP'),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(height: context.height * 0.01),
            Obx(() => InkWell(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (deletionFormKey.currentState!.validate()) {
                    if (showOtpTextFields.value) {
                      isLoading.value = true;
                      // deleteAccountOtpVerification(context);
                    } else {
                      isLoading.value = true;
                      // deleteAccount(context);
                    }
                  }
                },
                child: ReUsableContainer(
                  width: context.width,
                  verticalPadding: context.height * 0.01,
                  height: 50,
                  color: showOtpTextFields.value
                      ? AppColors.primaryColor
                      : Colors.red,
                  child: Center(
                      child: isLoading.value
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SpinKitRing(
                                lineWidth: 2.0,
                                color: showOtpTextFields.value
                                    ? Colors.black87
                                    : Colors.white,
                              ),
                            )
                          : CustomTextWidget(
                              text: showOtpTextFields.value
                                  ? 'Verify Otp'
                                  : 'Delete Account',
                              fontSize: 14,
                              textColor: showOtpTextFields.value
                                  ? AppColors.secondaryColor
                                  : Colors.white,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.center,
                            )),
                ))),
          ],
        ),
      ),
    ));
  }
// deleteAccountOtpVerification(BuildContext context) async {
//   try {
//     isLoading.value = true;
//     Map<String, dynamic> isSuccess =
//     await _authService.deleteAccountVerifyOtp(
//       email: emailController.text,
//       otp: otpController.text,
//     );
//
//     if (isSuccess['status'] == 'Success') {
//       ToastMessage.showToastMessage(
//         message: 'Account deleted Successfully',
//         backgroundColor: Colors.green,
//       );
//       Get.offAll(() => const LoginScreen());
//       storage.remove('token');
//       storage.remove('user_info');
//     } else {
//       ToastMessage.showToastMessage(
//         message: isSuccess['message'],
//         backgroundColor: Colors.red,
//       );
//     }
//   } catch (e) {
//     // Handle any errors that occur during the execution of the function
//     debugPrint('Error occurred: $e');
//     isLoading.value = false;
//   } finally {
//     isLoading.value = false;
//   }
// }
}
