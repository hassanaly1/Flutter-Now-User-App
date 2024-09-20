import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:user_app/controllers/food_controller.dart';
import 'package:user_app/controllers/universal_controller.dart';
import 'package:user_app/helpers/custom_text.dart';
import 'package:user_app/helpers/reusable_container.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/common_widgets.dart';
import 'package:user_app/views/home/food_delivery/common_widgets/custom_food_widget.dart';
import 'package:user_app/views/home/food_delivery/food_description.dart';
import 'package:user_app/views/home/food_delivery/popular_deals.dart';
import 'package:user_app/views/home/home.dart';

class MainFoodScreen extends StatefulWidget {
  const MainFoodScreen({super.key});

  @override
  State<MainFoodScreen> createState() => _MainFoodScreenState();
}

class _MainFoodScreenState extends State<MainFoodScreen> {
  final MyFoodController _controller = Get.put(MyFoodController());
  final MyUniversalController _universalController =
      Get.find<MyUniversalController>();
  final FocusNode _searchFocusNode = FocusNode();
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
                title: const CustomTextWidget(
                  text: 'Food Delivery',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
                centerTitle: true,
                actions: [
                  Obx(() =>
                      MyFavouriteIcon(count: _controller.favorites.length)),
                  Obx(() => MyCartIcon(count: _controller.cartItems.length)),
                ],
                expandedHeight: context.height * 0.18,
                backgroundColor: AppColors.backgroundColor,
                bottom: CustomSearchbar(
                  hintText: 'Search for Food',
                  focusNode: _searchFocusNode,
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
                                Get.to(
                                    () => const PopularDealsAndCategoryScreen(),
                                    transition: Transition.rightToLeft);
                              },
                              child: const CustomTextWidget(
                                text: 'See All',
                                fontSize: 14.0,
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

class CustomSearchbar extends StatelessWidget implements PreferredSizeWidget {
  final String hintText;
  final FocusNode? focusNode;

  const CustomSearchbar({
    super.key,
    required this.hintText,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ReUsableContainer(
          height: 55,
          verticalPadding: 0.0,
          showBackgroundShadow: false,
          padding: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextFormField(
              focusNode: focusNode,
              decoration: InputDecoration(
                // isDense: true,
                // floatingLabelBehavior: FloatingLabelBehavior.auto,
                filled: true,
                fillColor: Colors.transparent,
                hintText: hintText,
                hintStyle: const TextStyle(
                    fontSize: 14.0, color: AppColors.lightTextColor),
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

class FoodCategoryList extends StatefulWidget {
  const FoodCategoryList({super.key});

  @override
  State<FoodCategoryList> createState() => _FoodCategoryListState();
}

class _FoodCategoryListState extends State<FoodCategoryList> {
  List<Map<String, String>> categories = [
    {
      'image':
          'https://img.freepik.com/free-photo/delicious-vietnamese-food-including-pho-ga-noodles-spring-rolls-white-table_181624-34062.jpg',
      'name': 'Asian',
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR16X0FcgkfLnrKW1xK3DIhpVkvZ3xgqPQnSJFIk2BbpK9HJ8mXvBAceVmCFEfSwT6PI4A&usqp=CAU',
      'name': 'Chinese',
    },
    {
      'image':
          'https://t4.ftcdn.net/jpg/02/10/97/65/360_F_210976505_c4vXGI6NCIaV8qlANGNP1gDPIt2rjYjC.jpg',
      'name': 'American',
    },
    {
      'image':
          'https://t3.ftcdn.net/jpg/01/08/74/94/360_F_108749462_n5gFesQla84wyfXTDUEG8zNochvWQXx4.jpg',
      'name': 'Mexican',
    },
    {
      'image':
          'https://img.freepik.com/free-photo/gourmet-italian-bolognese-pasta-with-fresh-parmesan-generated-by-ai_188544-9453.jpg',
      'name': 'Italian',
    },
    {
      'image':
          'https://www.shutterstock.com/image-photo/top-view-bbq-pork-ribs-260nw-1448812934.jpg',
      'name': 'Western',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.15,
      color: Colors.transparent,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SizedBox(
          width: context.width * 0.22,
          child: Padding(
            padding: EdgeInsets.only(left: context.width * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(
                        () => PopularDealsAndCategoryScreen(
                              isCategoryScreen: true,
                              categoryName: '${categories[index]['name']}',
                            ),
                        transition: Transition.rightToLeft);
                  },
                  child: CircleAvatar(
                    radius: context.height * 0.05,
                    backgroundImage: NetworkImage(categories[index]['image']!),
                  ),
                ),
                CustomTextWidget(
                  text: '${categories[index]['name']}',
                  maxLines: 1,
                  fontSize: 12.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
