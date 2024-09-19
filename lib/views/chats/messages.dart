import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/utils/appbar.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/shiimmers.dart';
import 'package:user_app/views/chats/message_detail.dart';

class MyMessageScreen extends StatefulWidget {
  const MyMessageScreen({super.key});

  @override
  State<MyMessageScreen> createState() => _MyMessageScreenState();
}

class _MyMessageScreenState extends State<MyMessageScreen> {
  var isLoading = true.obs;

  @override
  void initState() {
    super.initState();
    print('MessageScreenInitStateCalled');
    Future.delayed(const Duration(seconds: 10000000), () {
      isLoading.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: const CustomAppbar(title: 'My Chats', showBackArrow: false),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
            child: Column(
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
                  autofocus: false,
                ),
                SizedBox(height: context.height * 0.02),
                Obx(
                  () => isLoading.value
                      ? const MyListTileShimmerEffect()
                      : Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: 15,
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () => Get.to(
                                    () => const MessageDetailScreen(),
                                    transition: Transition.rightToLeft),
                                dense: true,
                                // visualDensity: VisualDensity.compact,
                                leading: const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/user.jpg'),
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
                                      textColor: AppColors.lightTextColor,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.buttonColor,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: CustomTextWidget(
                                          text: '999 +',
                                          fontSize: 12.0,
                                          textColor: AppColors.whiteTextColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
