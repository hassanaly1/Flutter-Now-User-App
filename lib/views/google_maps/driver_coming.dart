import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_container.dart';
import 'package:user_app/utils/toast.dart';
import 'package:user_app/views/google_maps/select_vehicle.dart';

class DriverComingScreen extends StatefulWidget {
  const DriverComingScreen({super.key});

  @override
  State<DriverComingScreen> createState() => _DriverComingScreenState();
}

class _DriverComingScreenState extends State<DriverComingScreen> {
  var isWaitingForDriver = true.obs;

  @override
  initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () {
        isWaitingForDriver.value = false;
        MyCustomSuccessToast(title: 'Your Driver has Arrived')
            .showToast(context);
        Timer(
          const Duration(seconds: 5),
          () {
            isWaitingForDriver.value = false;
            MyCustomSuccessToast(title: 'Your Destination has Arrived')
                .showToast(context);
          },
        );
      },
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
              Obx(() => MyHeaderContainer(
                  title: isWaitingForDriver.value
                      ? 'Driver Coming'
                      : 'On the Way to your Destination')),
              const SizedBox(height: 8.0),
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: GoogleMap(
                    mapType: MapType.terrain,
                    onMapCreated: (controller) {},
                    // onMapCreated: _controller.onSelectVehicleMapCreated,
                    // initialCameraPosition: CameraPosition(
                    //   target: _controller.markers.isNotEmpty
                    //       ? _controller.markers.first.position
                    //       : const LatLng(0, 0), // Fallback position
                    //   zoom: 15,
                    // ),
                    // markers: _controller.markers.toSet(),
                    // polylines: _controller.polylines.toSet(),
                    myLocationEnabled: true,
                    onCameraMove: (position) {},
                    initialCameraPosition: const CameraPosition(
                        target: LatLng(24.9258396433174, 67.09227611185437),
                        zoom: 15),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(LucideIcons.dollarSign,
                                  size: 16.0, color: AppColors.buttonColor),
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
                                  size: 16.0, color: AppColors.buttonColor),
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
                                    size: 32.0, color: AppColors.primaryColor),
                              ),
                              const SizedBox(width: 12.0),
                              Icon(LucideIcons.messageCircle,
                                  size: 32.0, color: AppColors.primaryColor),
                            ],
                          ),
                        ],
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
