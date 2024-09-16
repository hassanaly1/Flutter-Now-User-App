import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/utils/appbar.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/views/chats/message_detail.dart';

class MyMessageScreen extends StatelessWidget {
  const MyMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: const CustomAppbar(title: 'My Chats', showBackArrow: false),
        body: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightGreyColor),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                hintText: 'Search',
                prefixIcon: const Icon(LucideIcons.search),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightGreyColor),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightGreyColor),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                suffixIcon: const Icon(LucideIcons.circleX),
              ),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 15,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => Get.to(() => const MessageDetailScreen(),
                        transition: Transition.rightToLeft),
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user.jpg'),
                    ),
                    title: const CustomTextWidget(
                      text: 'Jane Smith',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      textColor: Colors.black,
                    ),
                    subtitle: const CustomTextWidget(
                      text: 'Hello, How are you',
                      fontSize: 12.0,
                      textColor: Colors.black54,
                    ),
                    trailing: Column(
                      children: [
                        const CustomTextWidget(
                          text: '10:00 AM',
                          fontSize: 12.0,
                          textColor: Colors.black54,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.blackTextColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: CustomTextWidget(
                              text: '999 +',
                              fontSize: 8.0,
                              textColor: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
