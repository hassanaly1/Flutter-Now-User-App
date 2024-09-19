import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/toast.dart';
import 'package:user_app/views/home/bottom_navigation_bar.dart';

void showWaitingForDriverDialog() {
  Get.defaultDialog(
    title: 'Waiting for Driver',
    titleStyle: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      color: AppColors.buttonColor,
    ),
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    barrierDismissible: false,
    radius: 16.0,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomTextWidget(
          text: "Waiting for Driver to Accept the Ride",
          fontSize: 18.0,
          maxLines: 2,
          fontWeight: FontWeight.w700,
          textColor: AppColors.blackTextColor,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16.0),
        const Center(
            child: SpinKitRipple(
          color: AppColors.buttonColor,
        )),
        const SizedBox(height: 16.0),
        InkWell(
          onTap: () => Get.back(),
          child: const CustomTextWidget(
            text: "Cancel Request",
            textColor: Colors.redAccent,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}

void showExitDialog(BuildContext context) {
  Get.defaultDialog(
    title: 'Are you sure you want to exit?',
    titleStyle: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: AppColors.buttonColor,
    ),
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    barrierDismissible: false,
    radius: 16.0,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomTextWidget(
          text:
              "Your ride will be cancelled and you might get a penalty. Are you sure you want to exit?",
          fontSize: 14.0,
          maxLines: 4,
          fontWeight: FontWeight.w500,
          textColor: AppColors.blackTextColor,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16.0),
        const Center(
            child: SpinKitRipple(
          color: AppColors.buttonColor,
        )),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => Get.back(),
              child: const CustomTextWidget(
                text: "Cancel",
                textColor: AppColors.errorColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            InkWell(
              onTap: () {
                Get.offAll(() => const MyBottomNavigationBar());
                MyCustomSuccessToast(title: 'Your ride has been cancelled')
                    .showToast(context);
              },
              child: const CustomTextWidget(
                text: "Yes, I want to exit",
                textColor: AppColors.successColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
