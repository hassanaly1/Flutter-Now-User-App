import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/helpers/appbar.dart';
import 'package:user_app/helpers/custom_button.dart';
import 'package:user_app/helpers/custom_text.dart';
import 'package:user_app/helpers/heading_and_textfield.dart';
import 'package:user_app/utils/common_widgets.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppbar(title: 'Personal Information'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.05,
          vertical: context.height * 0.05,
        ),
        child: ListView(
          children: [
            const Center(
              child: CustomTextWidget(
                text: 'Contact Details',
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizeBetweenWidgets(),
            const HeadingAndTextfield(title: 'Name'),
            const HeadingAndTextfield(title: 'Email'),
            const HeadingAndTextfield(title: 'Phone Number'),
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
