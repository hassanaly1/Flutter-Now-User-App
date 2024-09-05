import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:user_app/controllers/universal_controller.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/common_widgets.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/views/google_maps/select_location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MyUniversalController _controller = Get.put(MyUniversalController());
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  final _currentIndex = 0.obs;
  final List<String> _images = [
    'assets/images/banner.png',
    'assets/images/banner.png',
    'assets/images/banner.png',
  ];

  @override
  void initState() {
    super.initState();
    _controller.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/home_background.png', fit: BoxFit.cover),
            RefreshIndicator(
              onRefresh: () => _controller.getCurrentLocation(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/app-logo-dark.png',
                            height: 40,
                          ),
                          Visibility(
                            visible:
                                _controller.userCurrentLocation.value != '',
                            child: InkWell(
                                onTap: () => _controller.getCurrentLocation(),
                                child: Icon(Icons.location_on,
                                    color: AppColors.primaryColor)),
                          ),
                          const SizedBox(width: 4.0),
                          Obx(() => Flexible(
                                child: InkWell(
                                  onTap: () => _controller.getCurrentLocation(),
                                  child: CustomTextWidget(
                                    text: _controller
                                                .userCurrentLocation.value ==
                                            ''
                                        ? ''
                                        : _controller.userCurrentLocation.value,
                                    textColor: AppColors.buttonColor,
                                    maxLines: 2,
                                  ),
                                ),
                              )),
                          const SizedBox(width: 4.0),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notification_add,
                                color: AppColors.buttonColor,
                              ))
                        ],
                      ),
                    ),
                    const SizeBetweenWidgets(),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: CustomTextWidget(
                        text: 'What are you looking for today?',
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
                        return CustomBannerContainer(imageUrl: _images[index]);
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
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: CustomTextWidget(
                        text:
                            'Your Dashboard for Book Ride,\n Ride Sharing, Deliveries, and More',
                        fontSize: 16.0,
                        maxLines: 2,
                        fontWeight: FontWeight.w600,
                        textColor: AppColors.buttonColor,
                      ),
                    ),
                    const SizeBetweenWidgets(),
                    MyRideModuleContainer(
                      onTap: () {
                        if (_controller.userCurrentLocation.value == '') {
                          _controller.getCurrentLocation(
                              onSuccess: () =>
                                  Get.to(() => const MySelectLocationScreen()));
                        } else {
                          Get.to(() => const MySelectLocationScreen());
                        }
                      },
                    ),
                    const SizeBetweenWidgets(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyCustomModuleContainer(
                            text: 'Ride Share',
                            usePadding: true,
                            imageUrl: 'assets/images/ride-share.png'),
                        MyCustomModuleContainer(
                            text: 'Food', imageUrl: 'assets/images/food.png'),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyCustomModuleContainer(
                            text: 'Packages',
                            usePadding: true,
                            imageUrl: 'assets/images/package.png'),
                        MyCustomModuleContainer(
                            text: 'Documents',
                            usePadding: true,
                            imageUrl: 'assets/images/document.png'),
                      ],
                    ),
                    const SizeBetweenWidgets(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyRideModuleContainer extends StatelessWidget {
  final VoidCallback onTap;

  const MyRideModuleContainer({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Stack(
          clipBehavior: Clip.none, // Allows the image to overflow
          children: [
            Container(
              height: context.height * 0.16,
              width: context.width,
              decoration: BoxDecoration(
                color: AppColors.buttonColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 3,
                    offset: const Offset(0, 1),
                    color: AppColors.blackTextColor.withOpacity(0.1),
                  ),
                ],
              ),
              child: ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  color: AppColors.whiteTextColor.withOpacity(0.3),
                  child: Align(
                    alignment: const Alignment(-1, 0.5),
                    child: CustomTextWidget(
                      text: 'Ride',
                      textColor: AppColors.whiteTextColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -context.height * 0.032,
              // Adjust this value to control how much of the image appears outside
              right: 5,
              // Adjust the horizontal positioning as needed
              child: Image.asset(
                'assets/images/ride.png',
                fit: BoxFit.contain,
                // Adjust the height if needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomModuleContainer extends StatelessWidget {
  final String text;
  final String imageUrl;
  final bool usePadding;

  const MyCustomModuleContainer(
      {super.key,
      required this.text,
      required this.imageUrl,
      this.usePadding = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: context.height * 0.16,
        width: context.width * 0.42,
        decoration: BoxDecoration(
          color: AppColors.buttonColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 3,
              offset: const Offset(0, 1),
              color: AppColors.blackTextColor.withOpacity(0.1),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Wave clipper background
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: context.height * 0.15,
                decoration: BoxDecoration(
                  color: AppColors.whiteTextColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Padding(
                            padding: usePadding
                                ? const EdgeInsets.only(right: 4.0, bottom: 6.0)
                                : const EdgeInsets.all(0.0),
                            child: Image.asset(
                              imageUrl,
                              fit: BoxFit.contain,
                              height: 100,
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextWidget(
                                text: text,
                                textColor: AppColors.whiteTextColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBannerContainer extends StatelessWidget {
  final String imageUrl;

  const CustomBannerContainer({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        // height: context.height * 0.15,
        width: context.width * 0.7,
        decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(16.0),
            image:
                DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 3,
                  offset: const Offset(0, 1),
                  color: AppColors.blackTextColor.withOpacity(0.1))
            ]),
      ),
    );
  }
}
