import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/helpers/appbar.dart';
import 'package:user_app/helpers/custom_button.dart';
import 'package:user_app/helpers/custom_text.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/views/profile/account_settings/account_settings.dart';
import 'package:user_app/views/profile/my_orders.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  List<String> items = [
    "Account Settings",
    "My Orders",
    'Help Center',
    'Privacy Policy',
    'Rate the App',
  ];

  final Map<String, IconData> itemIcons = {
    "Account Settings": LucideIcons.settings,
    "My Orders": LucideIcons.fileBox,
    "Help Center": LucideIcons.messageCircleQuestion,
    "Privacy Policy": LucideIcons.shieldCheck,
    "Rate the App": LucideIcons.star,
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(title: 'My Profile', showBackArrow: false),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomUserCard(),
              SizedBox(height: context.height * 0.03),
              ListView.separated(
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
                          Get.to(() => const AccountSettingsScreen(),
                              transition: Transition.rightToLeft);
                          break;
                        case 1:
                          Get.to(() => const MyOrdersScreen(),
                              transition: Transition.rightToLeft);
                          break;
                        case 2:
                          // Help Center Screen
                          break;
                        case 3:
                          // Privacy Policy Screen
                          break;
                        case 4:
                          // Rate the App Screen
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: CustomButton(
                  buttonText: 'Sign Out',
                  onTap: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomProfileWidget extends StatelessWidget {
  final String title;
  final IconData? icon;

  const CustomProfileWidget({
    super.key,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.buttonColor,
          ),
          const SizedBox(width: 8.0),
          CustomTextWidget(
            text: title,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            textColor: AppColors.lightTextColor,
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_rounded,
            color: AppColors.buttonColor,
          )
        ],
      ),
    );
  }
}

class CustomUserCard extends StatelessWidget {
  const CustomUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.25,
      color: Colors.transparent,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: context.width * 0.8,
              height: context.height * 0.2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.buttonColor.withOpacity(0.9),
                    AppColors.primaryColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomTextWidget(
                    text: 'Mr Otis Wudaris',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: context.height * 0.005),
                  const CustomTextWidget(
                    text: 'otiswudaris007@gmail.com',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: context.height * 0.005),
                  const CustomTextWidget(
                    text: '+94 77 123 4567',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: context.height * 0.005),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            child: CircleAvatar(
              radius: 40,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://t3.ftcdn.net/jpg/02/00/90/24/360_F_200902415_G4eZ9Ok3Ypd4SZZKjc8nqJyFVp1eOD6V.jpg',
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
