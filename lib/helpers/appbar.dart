import 'package:flutter/material.dart';
import 'package:user_app/helpers/custom_text.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/common_widgets.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool showBackArrow;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppbar({
    super.key,
    required this.title,
    this.showBackArrow = true,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.transparent,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      // Prevents default back button
      leading: leading ?? (showBackArrow ? const MyBackIcon() : null),
      title: CustomTextWidget(
        text: title,
        maxLines: 2,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
        textColor: AppColors.primaryColor,
      ),
      centerTitle: true,
      // Centers the title
      actions: actions ?? const [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
