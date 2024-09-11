import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:user_app/controllers/universal_controller.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/common_widgets.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_container.dart';
import 'package:user_app/views/food_delivery/common_widgets/custom_food_widget.dart';
import 'package:user_app/views/food_delivery/food_description.dart';
import 'package:user_app/views/food_delivery/popular_deals.dart';
import 'package:user_app/views/home/home.dart';

class MainFoodScreen extends StatefulWidget {
  const MainFoodScreen({super.key});

  @override
  State<MainFoodScreen> createState() => _MainFoodScreenState();
}

class _MainFoodScreenState extends State<MainFoodScreen> {
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
                  text: 'Food Delivery',
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
                  IconButton(
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    onPressed: () {},
                    icon: const Icon(
                      LucideIcons.shoppingCart,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                ],
                expandedHeight: context.height * 0.22,
                backgroundColor: AppColors.backgroundColor,
                bottom: const MyCustomSearchbar(hintText: 'Search for Food'),
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
                      const SizeBetweenWidgets(),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: CustomTextWidget(
                          text: 'Explore Some Popular Deals of today!',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.buttonColor,
                        ),
                      ),
                      const SizeBetweenWidgets(),
                      CarouselSlider.builder(
                        carouselController: _carouselController,
                        itemCount: _images.length,
                        itemBuilder: (context, index, realIndex) {
                          return CustomBannerContainer(
                              imageUrl: _images[index]);
                        },
                        options: CarouselOptions(
                          height: context.height * 0.2,
                          autoPlay: true,
                          viewportFraction: 0.7,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            _currentIndex.value = index;
                          },
                        ),
                      ),
                      const SizeBetweenWidgets(),
                      Obx(
                        () => Center(
                          child: AnimatedSmoothIndicator(
                            activeIndex: _currentIndex.value,
                            count: _images.length,
                            effect: ExpandingDotsEffect(
                              dotHeight: 12,
                              dotWidth: 12,
                              activeDotColor: AppColors.buttonColor,
                              dotColor: AppColors.buttonColor.withOpacity(0.5),
                            ),
                            onDotClicked: (index) {
                              _carouselController.animateToPage(index);
                            },
                          ),
                        ),
                      ),
                      const SizeBetweenWidgets(),
                      const MyCustomDivider(),
                      const SizeBetweenWidgets(),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: CustomTextWidget(
                          text: 'More Categories',
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
                                Get.to(() => const PopularDealsScreen(),
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

class MyCustomSearchbar extends StatelessWidget implements PreferredSizeWidget {
  final String hintText;

  const MyCustomSearchbar({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ReUsableContainer(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextFormField(
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            fillColor: Colors.transparent,
            hintText: hintText,
            prefixIcon: const Icon(
              LucideIcons.search,
              color: AppColors.blackTextColor,
            ),
            suffixIcon: InkWell(
              onTap: () {},
              child: const Icon(
                LucideIcons.circleX,
                color: AppColors.blackTextColor,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white38),
                borderRadius: BorderRadius.circular(8.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8.0)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.errorColor),
                borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
      )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class FoodCategoryList extends StatelessWidget {
  const FoodCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.2,
      color: Colors.transparent,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(6.0),
          child: SizedBox(
            width: context.width * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: context.height * 0.07,
                  backgroundImage: const AssetImage('assets/images/food-1.png'),
                ),
                CustomTextWidget(
                  text: 'Category $index',
                  maxLines: 1,
                  fontSize: context.height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
