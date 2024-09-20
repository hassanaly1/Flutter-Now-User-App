import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/controllers/food_controller.dart';
import 'package:user_app/helpers/custom_text.dart';
import 'package:user_app/helpers/reusable_container.dart';
import 'package:user_app/models/food_item_model.dart';
import 'package:user_app/utils/appcolors.dart';

class CustomFoodWidget extends StatefulWidget {
  final MyFoodItemModel model;
  final VoidCallback? onTap;

  const CustomFoodWidget({super.key, this.onTap, required this.model});

  @override
  State<CustomFoodWidget> createState() => _CustomFoodWidgetState();
}

class _CustomFoodWidgetState extends State<CustomFoodWidget> {
  final MyFoodController _controller = Get.find<MyFoodController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
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
                    child: widget.model.image != null
                        ? Image.network(
                            height: context.height * 0.15,
                            width: context.width,
                            '${widget.model.image}',
                            fit: BoxFit.cover,
                          )
                        : Image.asset('assets/images/empty.png'),
                  ),
                  Visibility(
                    visible: widget.model.discount != 0,
                    child: Positioned(
                        left: 10,
                        top: 10,
                        child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.successColor.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextWidget(
                                text: '${widget.model.discount}% OFF',
                                fontSize: 12.0,
                                textColor: AppColors.whiteTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            )))),
                  ),
                  Obx(
                    () => Positioned(
                      right: 10,
                      top: 10,
                      child: CircularIcon(
                        onTap: () {
                          _controller.addOrRemoveFromFavorites(widget.model);
                        },
                        icon: CupertinoIcons.heart_fill,
                        color: _controller.favorites.contains(widget.model)
                            ? AppColors.errorColor
                            : AppColors.lighterGreyColor,
                        backgroundColor: AppColors.buttonColor.withOpacity(0.5),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: context.height * 0.01),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomTextWidget(
                  text: '${widget.model.name}',
                  maxLines: 1,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.blackTextColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: RatingBar.readOnly(
                  filledIcon: Icons.star,
                  isHalfAllowed: true,
                  halfFilledIcon: Icons.star_half_rounded,
                  halfFilledColor: AppColors.buttonColor,
                  emptyIcon: Icons.star_border,
                  filledColor: AppColors.buttonColor,
                  initialRating: widget.model.rating ?? 0.0,
                  maxRating: 5,
                  size: 18.0,
                ),
              ),
              SizedBox(height: context.height * 0.01),
              Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      const Icon(
                        LucideIcons.star,
                        size: 22,
                        color: AppColors.buttonColor,
                      ),
                      const SizedBox(width: 4.0),
                      CustomTextWidget(
                        text: '${widget.model.reviews} Reviews',
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
                      text: '\$${widget.model.price}',
                      maxLines: 1,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      textColor: Colors.black.withOpacity(0.8),
                    ),
                    Container(
                      height: context.height * 0.06,
                      width: context.width * 0.15,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          )),
                      child: Obx(
                        () => IconButton(
                          onPressed: () {
                            _controller.addOrRemoveFromCart(widget.model);
                          },
                          icon: Icon(
                            _controller.cartItems.contains(widget.model)
                                ? Icons.done
                                : Icons.add,
                            color: Colors.white,
                          ),
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
