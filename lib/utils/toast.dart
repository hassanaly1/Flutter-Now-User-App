import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:user_app/helpers/custom_text.dart';
import 'package:user_app/utils/appcolors.dart';

class MyCustomSuccessToast {
  final String title;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final int duration;

  MyCustomSuccessToast({
    required this.title,
    this.onTap,
    this.backgroundColor,
    this.duration = 3,
  });

  void showToast(BuildContext context) {
    DelightToastBar(
      autoDismiss: true,
      snackbarDuration: Duration(seconds: duration),
      builder: (context) => ToastCard(
        onTap: onTap,
        leading: const Icon(
          Icons.check_circle,
          size: 28,
          color: Colors.white70,
        ),
        title: CustomTextWidget(
          text: title,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          maxLines: 5,
          textColor: AppColors.whiteTextColor,
        ),
        color: backgroundColor ?? AppColors.buttonColor,
      ),
    ).show(context);
  }
}

class MyCustomErrorToast {
  final String title;
  final VoidCallback? onTap;

  MyCustomErrorToast({
    required this.title,
    this.onTap,
  });

  void showToast(BuildContext context) {
    DelightToastBar(
      autoDismiss: true,
      snackbarDuration: const Duration(seconds: 3),
      builder: (context) => ToastCard(
        onTap: onTap,
        leading: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white70,
        ),
        title: CustomTextWidget(
          text: title,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          maxLines: 5,
          textColor: AppColors.whiteTextColor,
        ),
        color: AppColors.errorColor,
      ),
    ).show(context);
  }
}
