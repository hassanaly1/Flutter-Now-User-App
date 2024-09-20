import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:user_app/helpers/custom_button.dart';
import 'package:user_app/helpers/custom_text.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/common_widgets.dart';
import 'package:user_app/views/home/bottom_navigation_bar.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/done.json', height: 200),
            const SizeBetweenWidgets(),
            const SizeBetweenWidgets(),
            const CustomTextWidget(
              text: 'Congratulations!',
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
            const SizeBetweenWidgets(),
            const CustomTextWidget(
              text:
                  'Your order has been placed.You will receive an email shortly.',
              fontSize: 16.0,
              textAlign: TextAlign.center,
              maxLines: 3,
              textColor: AppColors.lightTextColor,
              fontWeight: FontWeight.w500,
            ),
            const SizeBetweenWidgets(),
            const CustomTextWidget(
              text: 'You can check your order status in My Orders section.',
              fontSize: 14.0,
              textAlign: TextAlign.center,
              textColor: AppColors.lightTextColor,
              maxLines: 3,
              fontWeight: FontWeight.w500,
            ),
            const SizeBetweenWidgets(),
            CustomButton(
              buttonText: 'Explore More',
              onTap: () => Get.offAll(() => const MyBottomNavigationBar()),
            )
          ],
        ),
      ),
    );
  }
}
