import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/helpers/profile_avatar.dart';
import 'package:user_app/utils/custom_text.dart';

class ReUsableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool showBackArrow;
  final bool showProfileAvatar;
  final Widget? prefixWidget;

  const ReUsableAppBar({
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
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      // Prevents default back button
      leading: prefixWidget ??
          (showBackArrow
              ? IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back, color: iconColor),
                )
              : null),
      title: CustomTextWidget(
        text: title,
        maxLines: 2,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
        textColor: Colors.white,
      ),
      centerTitle: true,
      // Centers the title
      actions: [
        showProfileAvatar
            ? const ProfileAvatar() // Custom profile avatar
            : const CircleAvatar(
                radius: 22, backgroundColor: Colors.transparent),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
