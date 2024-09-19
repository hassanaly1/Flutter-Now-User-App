import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/appbar.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';

class AppNotificationsScreen extends StatefulWidget {
  const AppNotificationsScreen({super.key});

  @override
  State<AppNotificationsScreen> createState() => _AppNotificationsScreenState();
}

class _AppNotificationsScreenState extends State<AppNotificationsScreen> {
  var isNotification = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppbar(title: 'App Notifications'),
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.01,
            vertical: context.height * 0.02,
          ),
          child: Obx(
            () => SwitchListTile.adaptive(
              value: isNotification.value,
              onChanged: (value) {
                isNotification.value = value;
              },
              title: const CustomTextWidget(
                text: 'App Notifications',
              ),
              subtitle: const CustomTextWidget(
                text:
                    'Turn on Notifications to get recent updates on your orders and offers.',
                maxLines: 3,
                fontSize: 12.0,
                textColor: AppColors.lightTextColor,
              ),
            ),
          )),
    ));
  }
}
