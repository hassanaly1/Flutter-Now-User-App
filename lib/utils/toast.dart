import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';

class MyCustomSuccessToast {
  final String title;
  final VoidCallback? onTap;

  MyCustomSuccessToast({
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
          Icons.check_circle,
          size: 28,
          color: Colors.white70,
        ),
        title: CustomTextWidget(
          text: title,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          maxLines: 5,
        ),
        color: AppColors.buttonColor,
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
        ),
        color: AppColors.errorColor,
      ),
    ).show(context);
  }
}
