import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/appbar.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/common_widgets.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/views/home/food_delivery/common_widgets/custom_food_widget.dart';
import 'package:user_app/views/home/food_delivery/food_description.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(
          title: 'My Favourites',
          showBackArrow: true,
          actions: [MyCartIcon()],
        ),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () => Get.to(() => const ProductDetailScreen()),
                child: const CustomFavouriteWidget());
          },
        ),
      ),
    );
  }
}

class CustomFavouriteWidget extends StatelessWidget {
  const CustomFavouriteWidget({
    super.key,
  });

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
                      'https://media.istockphoto.com/id/1191080960/photo/traditional-turkish-breakfast-and-people-taking-various-food-wide-composition.jpg?s=612x612&w=0&k=20&c=PP5ejMisEwzcLWrNmJ8iPPm_u-4P6rOWHEDpBPL2n7Q=',
                      width: context.width * 0.25,
                      height: context.height * 0.12,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: 'The Special Alfred Chicken Wings',
                          fontSize: 16.0,
                          maxLines: 2,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomTextWidget(
                          text: '\$120.00',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        RatingBar.readOnly(
                          filledIcon: Icons.star,
                          emptyIcon: Icons.star_border,
                          filledColor: AppColors.buttonColor,
                          initialRating: 4,
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
                    onTap: () {},
                    icon: CupertinoIcons.heart_fill,
                    color: Colors.red,
                    backgroundColor: AppColors.whiteTextColor.withOpacity(0.3),
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
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
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
