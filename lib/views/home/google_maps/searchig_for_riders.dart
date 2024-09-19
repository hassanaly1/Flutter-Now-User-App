import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/controllers/searching_for_driver_controller.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/dialogs.dart';
import 'package:user_app/utils/reusable_container.dart';
import 'package:user_app/utils/shiimmers.dart';
import 'package:user_app/utils/toast.dart';
import 'package:user_app/views/home/google_maps/driver_coming.dart';
import 'package:user_app/views/home/google_maps/select_vehicle.dart';

class SearchingForRidersScreen extends StatefulWidget {
  const SearchingForRidersScreen({super.key});

  @override
  State<SearchingForRidersScreen> createState() =>
      _SearchingForRidersScreenState();
}

class _SearchingForRidersScreenState extends State<SearchingForRidersScreen> {
  final SearchingForRidersController controller =
      Get.put(SearchingForRidersController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const CustomHeaderContainer(title: 'Searching For Riders'),
              Obx(
                () => controller.isRidersAreLoading.value
                    ? const MyListTileShimmerEffect()
                    : Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => controller.showItems[index]
                                  ? CustomDriverRequestWidget(
                                      index: index,
                                      itemTimers: controller.itemTimers,
                                    )
                                  : const SizedBox.shrink(),
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDriverRequestWidget extends StatelessWidget {
  final int index;

  const CustomDriverRequestWidget({
    super.key,
    required this.itemTimers,
    required this.index,
  });

  final RxList<int> itemTimers;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: ReUsableContainer(
            child: Stack(
              children: [
                Obx(
                  () => Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 4.0,
                      color: Colors.grey[200],
                      child: LinearProgressIndicator(
                        value: itemTimers[index] / 10,
                        backgroundColor: Colors.grey[200],
                        color: AppColors.buttonColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Leading CircleAvatar
                      CircleAvatar(
                        radius: 40,
                        child: Text('$index'),
                      ),
                      const SizedBox(width: 8.0),
                      // Spacing between CircleAvatar and title

                      // Main content section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            const CustomTextWidget(
                              text: 'Driver Name',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(height: 4.0),

                            // Subtitle
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(
                                    5,
                                    (index) => const Icon(
                                      Icons.star,
                                      size: 16.0,
                                      color: AppColors.buttonColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                const CustomTextWidget(
                                  text: '4.2 (200 ratings)',
                                  fontSize: 12.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Trailing section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                LucideIcons.dollarSign,
                                size: 16.0,
                                color: AppColors.buttonColor,
                              ),
                              SizedBox(width: 4.0),
                              CustomTextWidget(
                                text: '25.99',
                                fontSize: 16.0,
                                textColor: AppColors.buttonColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                LucideIcons.timer,
                                size: 16.0,
                                color: AppColors.buttonColor,
                              ),
                              SizedBox(width: 4.0),
                              CustomTextWidget(
                                text: '12 Minutes',
                                fontSize: 12.0,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  // controller.selectRider(index);
                                  Timer(
                                    const Duration(seconds: 5),
                                    () {
                                      MyCustomSuccessToast(
                                              title:
                                                  'Rider has accepted your Ride Request.')
                                          .showToast(context);
                                      Get.back();
                                      Get.off(() => const DriverComingScreen());
                                    },
                                  );
                                  showWaitingForDriverDialog();
                                },
                                child: const Icon(
                                  LucideIcons.circleCheck,
                                  size: 32.0,
                                  color: AppColors.successColor,
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              const Icon(
                                LucideIcons.circleX,
                                size: 32.0,
                                color: AppColors.errorColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
