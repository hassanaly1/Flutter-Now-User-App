import 'dart:async';

import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/controllers/google_maps_controller.dart';
import 'package:user_app/controllers/ride_controller.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_container.dart';
import 'package:user_app/utils/toast.dart';
import 'package:user_app/views/google_maps/select_vehicle.dart';
import 'package:user_app/views/home/bottom_navigation_bar.dart';

class DriverComingScreen extends StatefulWidget {
  const DriverComingScreen({super.key});

  @override
  State<DriverComingScreen> createState() => _DriverComingScreenState();
}

class _DriverComingScreenState extends State<DriverComingScreen> {
  late MyRideController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(MyRideController());
    Timer(
      const Duration(seconds: 3),
      () => _controller.isDriverArrived.value = true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Header Container with title
              Obx(
                () => MyHeaderContainer(
                  title: _controller.isDriverArrived.value
                      ? 'On the Way to your Destination'
                      : 'Driver is Coming',
                ),
              ),
              const SizedBox(height: 8.0),
              // Google Map
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Obx(
                    () => GoogleMap(
                      mapType: MapType.terrain,
                      onMapCreated: _controller.onMapCreated,
                      // myLocationEnabled: true,
                      markers: _controller.markers.value,
                      polylines: _controller.polylines.value,
                      initialCameraPosition: CameraPosition(
                        target: _controller.userCurrentLocation.value,
                        zoom: 15,
                      ),
                      onCameraMove: (position) {
                        // Optional: handle camera move if needed
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              // Driver Details Container
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: ReUsableContainer(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://static.vecteezy.com/system/resources/previews/027/309/225/non_2x/driver-with-ai-generated-free-png.png'),
                      ),
                      const SizedBox(width: 8.0),
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
                                    (index) => Icon(
                                      Icons.star,
                                      size: 16.0,
                                      color: AppColors.buttonColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                const CustomTextWidget(
                                  text: 'Vehicle: Solaris',
                                  fontSize: 12.0,
                                ),
                                const SizedBox(height: 4.0),
                                const CustomTextWidget(
                                  text: 'Vehicle Number: ABC123',
                                  fontSize: 12.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Obx(
                        () => _controller.isDriverArrived.value
                            ? InkWell(
                                onTap: () => showCompleteRideDialog(context),
                                child: Row(
                                  children: [
                                    CustomTextWidget(
                                      text: 'Arrived?',
                                      textColor: AppColors.successColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Icon(
                                      LucideIcons.circleCheck,
                                      size: 24.0,
                                      color: AppColors.successColor,
                                    ),
                                  ],
                                ),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(LucideIcons.dollarSign,
                                          size: 16.0,
                                          color: AppColors.buttonColor),
                                      const SizedBox(width: 4.0),
                                      CustomTextWidget(
                                          text: '25.99',
                                          fontSize: 16.0,
                                          textColor: AppColors.buttonColor,
                                          fontWeight: FontWeight.w600),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(LucideIcons.timer,
                                          size: 16.0,
                                          color: AppColors.buttonColor),
                                      const SizedBox(width: 4.0),
                                      const CustomTextWidget(
                                          text: '12 Minutes', fontSize: 12.0),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Icon(LucideIcons.phoneCall,
                                            size: 32.0,
                                            color: AppColors.primaryColor),
                                      ),
                                      const SizedBox(width: 12.0),
                                      Icon(LucideIcons.messageCircle,
                                          size: 32.0,
                                          color: AppColors.primaryColor),
                                    ],
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
      ),
    );
  }
}

void showCompleteRideDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    // To prevent dismissing the dialog by tapping outside
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'You have Arrived to your Destination',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.buttonColor,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextWidget(
                        text: "Total Fare",
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.primaryColor,
                      ),
                      Icon(
                        LucideIcons.dollarSign,
                        size: 22.0,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(width: 2.0),
                      CustomTextWidget(
                        text: "25.99",
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        textColor: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  CustomTextWidget(
                    text: "How was your trip?",
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.primaryColor,
                  ),
                  const SizedBox(height: 8.0),
                  RatingBar(
                    alignment: Alignment.center,
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                    onRatingChanged: (value) => debugPrint('$value'),
                    initialRating: 3,
                    maxRating: 5,
                  ),
                  const SizedBox(height: 8.0),
                  CustomTextWidget(
                    text: "Any Comments?",
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.primaryColor,
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ReUsableContainer(
                      child: TextFormField(
                        maxLines: 2,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintText: 'Write your comments here',
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 14.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white38),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.errorColor),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.errorColor),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  InkWell(
                    onTap: () {
                      Get.offAll(() => const MyBottomNavigationBar());
                      Get.delete<MyGoogleMapsController>();
                      Get.delete<MyRideController>();
                      MyCustomSuccessToast(
                              title:
                                  'Ride Completed Successfully, Thank you for using Now Ride Service. You can also explore other services.')
                          .showToast(context);
                    },
                    child: CustomTextWidget(
                      text: "Submit Review",
                      fontSize: 16.0,
                      textColor: AppColors.successColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
