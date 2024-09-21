import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:readmore/readmore.dart';
import 'package:user_app/controllers/food_controller.dart';
import 'package:user_app/helpers/custom_text.dart';
import 'package:user_app/helpers/reusable_container.dart';
import 'package:user_app/models/food_item_model.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/common_widgets.dart';
import 'package:user_app/views/home/food_delivery/common_widgets/custom_food_widget.dart';
import 'package:user_app/views/home/food_delivery/restaurant_page.dart';

class ProductDetailScreen extends StatefulWidget {
  final MyFoodItemModel model;

  const ProductDetailScreen({super.key, required this.model});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final MyFoodController _controller = Get.find<MyFoodController>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double childAspectRatio = (screenWidth / 2) / (screenHeight * 0.35);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircularIcon(
                    onTap: () {
                      // Decrease quantity
                      _controller.decrementQuantity(widget.model);
                    },
                    backgroundColor: AppColors.buttonColor.withOpacity(0.9),
                    icon: LucideIcons.minus,
                    color: AppColors.blackTextColor,
                  ),
                  const SizedBox(width: 8.0),
                  CustomTextWidget(
                    text: '${widget.model.totalCount}',
                    // Display current quantity
                    fontSize: 18.0,
                    textColor: AppColors.whiteTextColor,
                  ),
                  const SizedBox(width: 8.0),
                  CircularIcon(
                    onTap: () {
                      // Increase quantity
                      _controller.incrementQuantity(widget.model);
                    },
                    backgroundColor: AppColors.buttonColor.withOpacity(0.9),
                    icon: LucideIcons.plus,
                    color: AppColors.blackTextColor,
                  ),
                ],
              ),
              SizedBox(
                width: 150,
                child: InkWell(
                  onTap: () {
                    _controller.addOrRemoveFromCart(widget.model);
                  },
                  child: ReUsableContainer(
                    width: 150,
                    verticalPadding: context.height * 0.02,
                    height: 50,
                    color: AppColors.buttonColor.withOpacity(0.9),
                    child: Center(
                        child: Obx(
                      () => CustomTextWidget(
                        text: _controller.cartItems.contains(widget.model)
                            ? 'Added to cart'
                            : 'Add to cart',
                        fontSize: 16.0,
                        textColor: AppColors.blackTextColor,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                      ),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              DetailsImageContainer(
                imageLink: '${widget.model.image}',
              ),
              //Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Ratings&Shares
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(CupertinoIcons.star_circle_fill,
                                color: AppColors.buttonColor),
                            const SizedBox(width: 6.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: '${widget.model.rating} ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                  TextSpan(text: '(${widget.model.reviews})'),
                                ],
                              ),
                            )
                          ],
                        ),
                        Obx(
                          () => IconButton(
                            onPressed: () {
                              _controller
                                  .addOrRemoveFromFavorites(widget.model);
                            },
                            icon: const Icon(CupertinoIcons.heart_fill),
                            color: _controller.favorites.contains(widget.model)
                                ? AppColors.errorColor
                                : AppColors.lightGreyColor,
                          ),
                        )
                      ],
                    ),
                    const SizeBetweenWidgets(),
                    //Price
                    Row(
                      children: [
                        Visibility(
                          visible: widget.model.discount != 0,
                          child: ReUsableContainer(
                            color: AppColors.successColor.withOpacity(0.7),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            child: CustomTextWidget(
                              text: '${widget.model.discount}% OFF',
                              textColor: AppColors.secondaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        CustomTextWidget(
                          text: '\$${widget.model.price}',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(width: 8.0),
                        ReUsableContainer(
                          color: AppColors.errorColor.withOpacity(0.7),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: const CustomTextWidget(
                            text: 'Discounted Price',
                            textColor: AppColors.whiteTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizeBetweenWidgets(),
                    //Title
                    CustomTextWidget(
                      text: '${widget.model.name}',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizeBetweenWidgets(),
                    //Stock
                    const CustomTextWidget(text: 'Status'),
                    CustomTextWidget(
                      text: 'In Stock: ${widget.model.quantityAvailable}',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),

                    //Checkout
                    ReUsableContainer(
                      verticalPadding: context.height * 0.02,
                      height: 50,
                      color: AppColors.buttonColor.withOpacity(0.8),
                      child: const Center(
                          child: CustomTextWidget(
                        text: 'Checkout',
                        fontSize: 16.0,
                        textColor: AppColors.blackTextColor,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                      )),
                    ),

                    const CustomTextWidget(
                      text: 'Description',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizeBetweenWidgets(),
                    ReadMoreText(
                      '${widget.model.description}',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show More',
                      trimExpandedText: 'Less',
                      moreStyle: const TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w800),
                      lessStyle: const TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w800),
                    ),
                    const SizeBetweenWidgets(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: 'Reviews (${widget.model.reviews})',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(LucideIcons.arrowRight)),
                      ],
                    ),
                    const SizeBetweenWidgets(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomTextWidget(
                          text: 'More from this Restaurant',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(
                                () => RestaurantPageScreen(
                                      model: widget.model,
                                    ),
                                transition: Transition.rightToLeft);
                          },
                          child: const CustomTextWidget(
                            text: 'See All',
                            fontSize: 12.0,
                            maxLines: 2,
                            fontWeight: FontWeight.w400,
                            textColor: AppColors.buttonColor,
                          ),
                        ),
                      ],
                    ),
                    const SizeBetweenWidgets(),
                    Container(
                      height: context.height * 0.4,
                      color: Colors.transparent,
                      child: MoreFromThisRestaurant(controller: _controller),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoreFromThisRestaurant extends StatelessWidget {
  final MyFoodController controller;

  const MoreFromThisRestaurant({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.foodItemsList.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final item = controller.foodItemsList[index];
        return CustomFoodWidget(onTap: () {}, model: item);
      },
    );
  }
}

class DetailsImageContainer extends StatelessWidget {
  final String imageLink;

  const DetailsImageContainer({
    super.key,
    required this.imageLink,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image(
            image: NetworkImage(imageLink),
            fit: BoxFit.cover,
            height: context.height * 0.3,
            width: context.width,
          ),
        ),
        const Positioned(
            left: 0,
            top: 0,
            child: MyBackIcon(
              color: Colors.white,
            )),
      ],
    );
  }
}
