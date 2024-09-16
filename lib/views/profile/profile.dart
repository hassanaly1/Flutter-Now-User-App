import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/appbar.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_button.dart';
import 'package:user_app/utils/custom_text.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  List<String> items = [
    "Profile",
    "Payment Methods",
    "My Orders",
    "Settings",
    'Help Center',
    'Privacy Policy',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(title: 'My Profile', showBackArrow: false),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomUserCard(),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return CustomProfileWidget(
                    title: items[index],
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

  const CustomProfileWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
      child: Row(
        children: [
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
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Container(
        height: 140,
        color: Colors.transparent,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.2),
                height: 90,
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
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextWidget(
                      text: 'D Heaven',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.white,
                    ),
                    SizedBox(height: 8.0),
                    CustomTextWidget(
                      text: 'otiswudaris007@gmail.com',
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                      textColor: Colors.white,
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ),
            const Positioned(
              right: 0,
              left: 0,
              top: 0,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  'assets/images/user.jpg',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
