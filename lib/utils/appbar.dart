import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/helpers/profile_avatar.dart';
import 'package:user_app/utils/custom_text.dart';

class ReUsableAppbar extends StatelessWidget {
  final String title;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool showBackArrow;
  final bool showProfileAvatar;
  final Widget? prefixWidget;

  const ReUsableAppbar({
    super.key,
    required this.title,
    this.showBackArrow = true,
    this.showProfileAvatar = true,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.transparent,
    this.prefixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          prefixWidget ??
              IconButton(
                  onPressed: () => showBackArrow ? Get.back() : null,
                  icon: Icon(Icons.arrow_back,
                      color: showBackArrow ? iconColor : Colors.transparent)),
          Flexible(
            child: CustomTextWidget(
              text: title,
              maxLines: 2,
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
              textColor: Colors.white,
            ),
          ),
          showProfileAvatar
              ? const ProfileAvatar()
              : const CircleAvatar(
                  radius: 22, backgroundColor: Colors.transparent)
        ],
      ),
    );
  }
}
