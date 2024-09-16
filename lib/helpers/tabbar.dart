import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/appcolors.dart';

class CustomTabBar extends StatelessWidget {
  final String? title1;
  final String? title2;
  final void Function(int)? onTap;

  const CustomTabBar({super.key, this.title1, this.title2, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.isLandscape ? context.width * 0.5 : double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(4.0),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: Colors.black45)),
      child: TabBar(
        onTap: onTap,
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: AppColors.buttonColor,
        ),
        labelStyle: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'poppins'),
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.primaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        // isScrollable: true,
        // tabAlignment: TabAlignment.center,
        tabs: [
          Tab(text: title1),
          Tab(text: title2),
        ],
      ),
    );
  }
}
