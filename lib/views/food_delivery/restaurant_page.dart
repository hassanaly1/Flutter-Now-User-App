import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/controllers/universal_controller.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/common_widgets.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/views/food_delivery/common_widgets/custom_food_widget.dart';
import 'package:user_app/views/food_delivery/food.dart';
import 'package:user_app/views/food_delivery/food_description.dart';
import 'package:user_app/views/food_delivery/popular_deals.dart';
import 'package:user_app/views/home/chat.dart';

class RestaurantPageScreen extends StatefulWidget {
  const RestaurantPageScreen({super.key});

  @override
  State<RestaurantPageScreen> createState() => _RestaurantPageScreenState();
}

class _RestaurantPageScreenState extends State<RestaurantPageScreen> {
  final MyUniversalController _controller = Get.find<MyUniversalController>();
  final FocusNode _searchFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<Color> _appBarColorNotifier =
      ValueNotifier<Color>(AppColors.whiteTextColor);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);

    // Add a listener to the search focus node
    _searchFocusNode.addListener(() {
      if (_searchFocusNode.hasFocus) {
        // Scroll the main scroll controller to the top
        _scrollController.animateTo(
          context.height * 0.3, // Scroll to the top
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _scrollListener() {
    // Change title and appbar color based on the scroll position
    if (_scrollController.hasClients) {
      final offset = _scrollController.offset;
      if (offset >= context.height * 0.3) {
        _appBarColorNotifier.value = AppColors.blackTextColor;
      } else {
        _appBarColorNotifier.value = AppColors.whiteTextColor;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchFocusNode.dispose();
    _appBarColorNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _scrollController, // Attach the scroll controller here
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            CustomSliverAppBar(
              appbarColorNotifier: _appBarColorNotifier,
              searchFocusNode: _searchFocusNode,
              scrollController: _scrollController,
            ),
          ],
          body: RestaurantPageBody(
            controller: _controller,
            scrollController: _scrollController, // Pass the same controller
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => const ChatScreen());
            },
            tooltip: 'Chat with Restaurant',
            backgroundColor: AppColors.whiteTextColor.withOpacity(0.9),
            child: const Icon(
              LucideIcons.messageCircle,
              color: AppColors.blackTextColor,
            )),
      ),
    );
  }
}

class CustomSliverAppBar extends StatelessWidget {
  final ValueNotifier<Color> appbarColorNotifier;
  final FocusNode? searchFocusNode;
  final ScrollController scrollController;

  const CustomSliverAppBar({
    super.key,
    required this.appbarColorNotifier,
    this.searchFocusNode,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      leading: ValueListenableBuilder<Color>(
        valueListenable: appbarColorNotifier,
        builder: (context, color, child) {
          return MyBackIcon(color: color);
        },
      ),
      title: ValueListenableBuilder<Color>(
        valueListenable: appbarColorNotifier,
        builder: (context, color, child) {
          return CustomTextWidget(
            text: 'The Garlics Restaurant',
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
            textColor: color,
            textAlign: TextAlign.center,
          );
        },
      ),
      centerTitle: true,
      actions: [
        ValueListenableBuilder<Color>(
          valueListenable: appbarColorNotifier,
          builder: (context, color, child) {
            return IconButton(
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              onPressed: () {},
              icon: Icon(
                LucideIcons.heart,
                color: color,
              ),
            );
          },
        ),
        ValueListenableBuilder<Color>(
          valueListenable: appbarColorNotifier,
          builder: (context, color, child) {
            return IconButton(
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              onPressed: () {},
              icon: Icon(
                LucideIcons.shoppingCart,
                color: color,
              ),
            );
          },
        ),
      ],
      expandedHeight: 300.0,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReAU10nVk5FVvnYPvmyd9m7kGtKFc22fb7sw&s',
          fit: BoxFit.cover,
        ),
      ),
      bottom: CustomSearchbar(
          hintText: 'Search for Food', focusNode: searchFocusNode),
    );
  }
}

class RestaurantPageBody extends StatelessWidget {
  final MyUniversalController controller;
  final ScrollController
      scrollController; // Pass the main scroll controller here

  const RestaurantPageBody({
    super.key,
    required this.controller,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.getCurrentLocation(),
      child: SingleChildScrollView(
        // controller: scrollController, // Use the same scroll controller
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizeBetweenWidgets(),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: CustomTextWidget(
                text: 'Categories',
                fontSize: 16.0,
                maxLines: 2,
                fontWeight: FontWeight.w600,
                textColor: AppColors.buttonColor,
              ),
            ),
            const SizeBetweenWidgets(),
            const FoodCategoryList(),
            const SizeBetweenWidgets(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextWidget(
                    text: 'Popular Deals',
                    fontSize: 16.0,
                    maxLines: 2,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.buttonColor,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => const PopularDealsScreen(),
                        transition: Transition.rightToLeft,
                      );
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
            ),
            const SizeBetweenWidgets(),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: context.height * 0.0012,
              ),
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return OpenContainer(
                  openColor: Colors.transparent,
                  closedColor: Colors.transparent,
                  transitionDuration: const Duration(milliseconds: 500),
                  closedBuilder: (context, action) =>
                      CustomFoodWidget(onTap: action),
                  openBuilder: (context, action) => const ProductDetailScreen(),
                  openElevation: 0,
                  closedElevation: 0,
                  closedShape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(0), // Set border radius to 0
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
