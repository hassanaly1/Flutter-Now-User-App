import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/controllers/food_controller.dart';
import 'package:user_app/controllers/universal_controller.dart';
import 'package:user_app/helpers/custom_text.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/common_widgets.dart';
import 'package:user_app/views/home/food_delivery/common_widgets/custom_food_widget.dart';
import 'package:user_app/views/home/food_delivery/food.dart';
import 'package:user_app/views/home/food_delivery/food_description.dart';

class PopularDealsAndCategoryScreen extends StatefulWidget {
  final bool isCategoryScreen;
  final String? categoryName;

  const PopularDealsAndCategoryScreen({
    super.key,
    this.isCategoryScreen = false,
    this.categoryName,
  });

  @override
  State<PopularDealsAndCategoryScreen> createState() => _MainFoodScreenState();
}

class _MainFoodScreenState extends State<PopularDealsAndCategoryScreen> {
  final MyFoodController _controller = Get.find<MyFoodController>();
  final MyUniversalController _universalController =
      Get.find<MyUniversalController>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.width;
    double screenHeight = context.height;

    double childAspectRatio = (screenWidth / 2) / (screenHeight * 0.35);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
            body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: false,
                pinned: true,
                primary: false,
                leading: const MyBackIcon(),
                title: CustomTextWidget(
                  text:
                      'Popular ${widget.isCategoryScreen ? '${widget.categoryName} Food' : 'Deals'}',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
                centerTitle: true,
                actions: [
                  Obx(() =>
                      MyFavouriteIcon(count: _controller.favorites.length)),
                  Obx(() => MyCartIcon(count: _controller.cartItems.length)),
                ],
                expandedHeight: context.height * 0.22,
                backgroundColor: AppColors.backgroundColor,
                // flexibleSpace: const MyCustomSearchbar(),
                bottom: CustomSearchbar(
                  hintText:
                      'Search for ${widget.isCategoryScreen ? '${widget.categoryName} Food' : 'Deals'}',
                ),
              ),
            ];
          },
          body: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset('assets/images/home_background.png',
                  fit: BoxFit.cover),
              RefreshIndicator(
                onRefresh: () => _universalController.getCurrentLocation(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: CustomTextWidget(
                          text: 'Popular Deals',
                          fontSize: 16.0,
                          maxLines: 2,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.buttonColor,
                        ),
                      ),
                      const SizeBetweenWidgets(),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: childAspectRatio,
                        ),
                        itemCount: _controller.foodItemsList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item = _controller.foodItemsList[index];
                          return OpenContainer(
                            openColor: Colors.transparent,
                            closedColor: Colors.transparent,
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            closedBuilder: (context, action) =>
                                CustomFoodWidget(
                              onTap: action,
                              model: item,
                            ),
                            openBuilder: (context, action) =>
                                ProductDetailScreen(model: item),
                            openElevation: 0,
                            closedElevation: 0,
                            closedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
