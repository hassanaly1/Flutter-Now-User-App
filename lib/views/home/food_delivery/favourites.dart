import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controllers/food_controller.dart';
import 'package:user_app/helpers/appbar.dart';
import 'package:user_app/helpers/custom_text.dart';
import 'package:user_app/models/food_item_model.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/common_widgets.dart';
import 'package:user_app/views/home/food_delivery/common_widgets/custom_food_widget.dart';
import 'package:user_app/views/home/food_delivery/food_description.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final MyFoodController _controller = Get.find<MyFoodController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          title: 'My Favourites',
          showBackArrow: true,
          actions: [
            Obx(
              () => MyCartIcon(
                count: _controller.cartItems.length,
              ),
            )
          ],
        ),
        body: Obx(
          () => _controller.favorites.isEmpty
              ? Center(
                  child: Image.asset(
                  'assets/images/empty_favourites.png',
                  height: context.height * 0.45,
                ))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: _controller.favorites.length,
                    itemBuilder: (context, index) {
                      final favourite = _controller.favorites[index];
                      return InkWell(
                          onTap: () => Get.to(
                              () => ProductDetailScreen(model: favourite)),
                          child: CustomFavouriteWidget(model: favourite));
                    },
                  ),
                ),
        ),
      ),
    );
  }
}

class CustomFavouriteWidget extends StatefulWidget {
  final MyFoodItemModel model;

  const CustomFavouriteWidget({
    super.key,
    required this.model,
  });

  @override
  State<CustomFavouriteWidget> createState() => _CustomFavouriteWidgetState();
}

class _CustomFavouriteWidgetState extends State<CustomFavouriteWidget> {
  final MyFoodController _controller = Get.find<MyFoodController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      '${widget.model.image}',
                      width: context.width * 0.25,
                      height: context.height * 0.12,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: '${widget.model.name}',
                          fontSize: 16.0,
                          maxLines: 2,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomTextWidget(
                          text: '\$${widget.model.price}',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        RatingBar.readOnly(
                          filledIcon: Icons.star,
                          emptyIcon: Icons.star_border,
                          filledColor: AppColors.buttonColor,
                          isHalfAllowed: true,
                          halfFilledIcon: Icons.star_half_rounded,
                          halfFilledColor: AppColors.buttonColor,
                          initialRating: widget.model.rating ?? 0.0,
                          maxRating: 5,
                          size: 18.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Column(
                children: [
                  CircularIcon(
                    onTap: () {
                      _controller.addOrRemoveFromFavorites(widget.model);
                      print(_controller.favorites.length);
                    },
                    icon: CupertinoIcons.heart_fill,
                    color: _controller.favorites.contains(widget.model)
                        ? AppColors.errorColor
                        : AppColors.whiteTextColor,
                    backgroundColor: AppColors.whiteTextColor.withOpacity(0.7),
                  ),
                  const SizeBetweenWidgets(),
                  Container(
                    height: context.height * 0.07,
                    width: context.width * 0.12,
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
