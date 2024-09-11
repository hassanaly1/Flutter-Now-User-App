import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_container.dart';

class CustomFoodWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomFoodWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ReUsableContainer(
          width: context.width * 0.45,
          color: Colors.transparent,
          padding: EdgeInsets.zero,
          borderRadius: BorderRadius.circular(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      height: context.height * 0.15,
                      width: context.width,
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReAU10nVk5FVvnYPvmyd9m7kGtKFc22fb7sw&s',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      left: 10,
                      top: 10,
                      child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.successColor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Center(
                              child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomTextWidget(
                              text: '50% OFF',
                              fontSize: 12.0,
                              textColor: AppColors.whiteTextColor,
                              fontWeight: FontWeight.w600,
                            ),
                          )))),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: CircularIcon(
                      onTap: () {},
                      icon: CupertinoIcons.heart_fill,
                      color: Colors.red,
                      backgroundColor:
                          AppColors.whiteTextColor.withOpacity(0.7),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 4.0),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: CustomTextWidget(
                  text: 'Arabian Pasta',
                  maxLines: 1,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.blackTextColor,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: RatingBar.readOnly(
                  filledIcon: Icons.star,
                  emptyIcon: Icons.star_border,
                  filledColor: AppColors.buttonColor,
                  initialRating: 4,
                  maxRating: 5,
                  size: 18.0,
                ),
              ),
              const SizedBox(height: 4.0),
              const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        LucideIcons.star,
                        size: 22,
                        color: AppColors.buttonColor,
                      ),
                      SizedBox(width: 4.0),
                      CustomTextWidget(
                        text: '4.5 Ratings',
                        maxLines: 1,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.buttonColor,
                      ),
                    ],
                  )),
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: '\$15.00',
                      maxLines: 1,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                      textColor: Colors.black.withOpacity(0.8),
                    ),
                    Container(
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          )),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class CircularIcon extends StatelessWidget {
  final double? width, height, size;
  final IconData? icon;
  final Color? color, backgroundColor;
  final VoidCallback onTap;

  const CircularIcon({
    super.key,
    this.width,
    this.height,
    this.size,
    this.icon,
    this.color,
    this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40.0,
      width: width ?? 40.0,
      decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(100.0)),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: color ?? AppColors.lightGreyColor,
          size: size ?? 24.0,
        ),
      ),
    );
  }
}
