import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/controllers/universal_controller.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/common_widgets.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/views/home/food_delivery/common_widgets/custom_food_widget.dart';
import 'package:user_app/views/home/food_delivery/food.dart';
import 'package:user_app/views/home/food_delivery/food_description.dart';

class PopularDealsScreen extends StatefulWidget {
  const PopularDealsScreen({super.key});

  @override
  State<PopularDealsScreen> createState() => _MainFoodScreenState();
}

class _MainFoodScreenState extends State<PopularDealsScreen> {
  final MyUniversalController _controller = Get.find<MyUniversalController>();
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  final _currentIndex = 0.obs;
  final List<String> _images = [
    'assets/images/food-1.png',
    'assets/images/food-1.png',
    'assets/images/food-1.png',
  ];

  @override
  Widget build(BuildContext context) {
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
                title: const CustomTextWidget(
                  text: 'Popular Deals',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    onPressed: () {},
                    icon: const Icon(
                      LucideIcons.heart,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                  const MyCartIcon(),
                ],
                expandedHeight: context.height * 0.22,
                backgroundColor: AppColors.backgroundColor,
                // flexibleSpace: const MyCustomSearchbar(),
                bottom: const CustomSearchbar(
                  hintText: 'Search for Deals',
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
                onRefresh: () => _controller.getCurrentLocation(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: CustomTextWidget(
                          text: 'Popular Deals',
                          fontSize: 18.0,
                          maxLines: 2,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.buttonColor,
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
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            closedBuilder: (context, action) =>
                                CustomFoodWidget(onTap: action),
                            openBuilder: (context, action) =>
                                const ProductDetailScreen(),
                            openElevation: 0,
                            closedElevation: 0,
                            closedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  0), // Set border radius to 0
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
