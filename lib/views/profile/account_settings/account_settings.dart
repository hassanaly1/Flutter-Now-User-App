import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/helpers/appbar.dart';
import 'package:user_app/views/profile/account_settings/app_notifications.dart';
import 'package:user_app/views/profile/account_settings/delete_account.dart';
import 'package:user_app/views/profile/account_settings/personal_information.dart';
import 'package:user_app/views/profile/account_settings/security.dart';
import 'package:user_app/views/profile/profile.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  List<String> items = [
    'Personal Information',
    'Security',
    'App Notifications',
    'Delete My Account',
  ];

  final Map<String, IconData> itemIcons = {
    'Personal Information': LucideIcons.user,
    'Security': LucideIcons.lock,
    'App Notifications': LucideIcons.bell,
    'Delete My Account': LucideIcons.trash,
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppbar(title: 'Account Settings'),
      body: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              switch (index) {
                case 0:
                  Get.to(() => const PersonalInformationScreen(),
                      transition: Transition.rightToLeft);
                  break;
                case 1:
                  Get.to(() => const SecurityScreen(),
                      transition: Transition.rightToLeft);
                  break;
                case 2:
                  Get.to(() => const AppNotificationsScreen(),
                      transition: Transition.rightToLeft);
                  break;
                case 3:
                  Get.to(() => const DeleteAccountScreen(),
                      transition: Transition.rightToLeft);
                  break;

                default:
              }
            },
            child: CustomProfileWidget(
              title: item,
              icon: itemIcons[item],
            ),
          );
        },
      ),
    ));
  }
}
