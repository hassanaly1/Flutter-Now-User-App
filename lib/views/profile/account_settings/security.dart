import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/helpers/appbar.dart';
import 'package:user_app/helpers/custom_button.dart';
import 'package:user_app/helpers/custom_text.dart';
import 'package:user_app/helpers/heading_and_textfield.dart';
import 'package:user_app/utils/common_widgets.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppbar(title: 'Security'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.05,
          vertical: context.height * 0.05,
        ),
        child: ListView(
          children: [
            const Center(
              child: CustomTextWidget(
                text: 'Change Password',
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizeBetweenWidgets(),
            const HeadingAndTextfield(title: 'Current Password'),
            const HeadingAndTextfield(title: 'New Password'),
            const HeadingAndTextfield(title: 'Confirm New Password'),
            CustomButton(
              buttonText: 'Update',
              onTap: () {},
            )
          ],
        ),
      ),
    ));
  }
}
