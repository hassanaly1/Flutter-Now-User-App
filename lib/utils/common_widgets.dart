import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/appcolors.dart';

class MyCustomDivider extends StatelessWidget {
  const MyCustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.buttonColor,
      thickness: 1.5,
      indent: context.width * 0.05,
      endIndent: context.width * 0.05,
    );
  }
}

class SizeBetweenWidgets extends StatelessWidget {
  const SizeBetweenWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: context.height * 0.02);
  }
}
