import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/controllers/google_maps_controller.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_container.dart';
import 'package:user_app/views/google_maps/searchig_for_riders.dart';

class MySelectVehicleScreen extends StatefulWidget {
  const MySelectVehicleScreen({super.key});

  @override
  State<MySelectVehicleScreen> createState() => _MySelectVehicleScreenState();
}

class _MySelectVehicleScreenState extends State<MySelectVehicleScreen> {
  late MyGoogleMapsController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.find<MyGoogleMapsController>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const MyHeaderContainer(title: 'Select Vehicle'),
              Obx(
                () => Expanded(
                  child: ReUsableContainer(
                    child: GoogleMap(
                      mapType: MapType.terrain,
                      onMapCreated: _controller.onSelectVehicleMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _controller.markers.isNotEmpty
                            ? _controller.markers.first.position
                            : const LatLng(0, 0), // Fallback position
                        zoom: 15,
                      ),
                      markers: _controller.markers.toSet(),
                      // Convert observable list to set
                      polylines: _controller.polylines.toSet(),
                      // Convert observable list to set
                      myLocationEnabled: true,
                      onCameraMove: (position) {},
                    ),
                  ),
                ),
              ),
              MyShowSelectedLocationsContainer(controller: _controller),
              MyShowSelectVehicleContainer(controller: _controller)
            ],
          ),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor.withOpacity(0.9),
          onPressed: () {
            Get.offAll(() => const SearchingForRidersScreen(),
                transition: Transition.rightToLeft);
          },
          child: const Icon(
            LucideIcons.moveRight,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MyShowSelectedLocationsContainer extends StatelessWidget {
  const MyShowSelectedLocationsContainer({
    super.key,
    required MyGoogleMapsController controller,
  }) : _controller = controller;

  final MyGoogleMapsController _controller;

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
        // color: AppColors.buttonColor.withOpacity(0.3),
        width: context.width,
        // height: context.height * 0.06,
        child: ListTile(
          dense: true,
          leading: Image.asset(
            'assets/images/indicator.png',
            color: AppColors.primaryColor,
            width: 20,
          ),
          visualDensity: VisualDensity.compact,
          title: Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Pickup Location: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                ),
                TextSpan(
                  text: _controller.selectedPickupLocation.value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 12.0),
                ),
              ],
            ),
            maxLines: 2,
          ),
          subtitle: Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Drop-off Location: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                ),
                TextSpan(
                  text: _controller.selectedDestinationLocation.value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 12.0),
                ),
              ],
            ),
            maxLines: 2,
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.social_distance_sharp, size: 16.0),
                  const SizedBox(width: 4.0),
                  Text(
                    _controller.calculatedDistance.value,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(LucideIcons.timer, size: 16.0),
                  const SizedBox(width: 4.0),
                  Text(
                    _controller.calculatedDuration.value,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class MyShowSelectVehicleContainer extends StatelessWidget {
  final MyGoogleMapsController controller;

  const MyShowSelectVehicleContainer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ReUsableContainer(
          color: AppColors.buttonColor.withOpacity(0.3),
          width: context.width,
          height: context.height * 0.35,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyCustomVehicleContainer(
                      price: '\$18.6',
                      imageUrl: 'assets/images/bike.png',
                      vehicleInfo: 'Bike',
                    ),
                    MyCustomVehicleContainer(
                      price: '\$33.9',
                      imageUrl: 'assets/images/auto.png',
                      vehicleInfo: 'Auto',
                    ),
                    MyCustomVehicleContainer(
                      price: '\$60',
                      imageUrl: 'assets/images/car.png',
                      vehicleInfo: 'Car',
                    ),
                    MyCustomVehicleContainer(
                      price: '\$100',
                      imageUrl: 'assets/images/ac-car.png',
                      vehicleInfo: 'AC Car',
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                MyCustomPriceWheelSpinner(controller: controller),
              ],
            ),
          )),
    );
  }
}

class MyCustomPriceWheelSpinner extends StatelessWidget {
  const MyCustomPriceWheelSpinner({
    super.key,
    required this.controller,
  });

  final MyGoogleMapsController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Obx(
          () => ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: CupertinoPicker(
              backgroundColor: AppColors.buttonColor.withOpacity(0.3),
              itemExtent: 40.0,
              useMagnifier: true,
              squeeze: 1.8,
              looping: false,
              diameterRatio: 1.1,
              scrollController: FixedExtentScrollController(
                  initialItem: controller.selectedPriceIndex.value),
              onSelectedItemChanged: (int index) {
                controller.selectedPriceIndex.value = index;
                controller.selectedPriceInDollars.value =
                    controller.prices[index];
              },
              selectionOverlay: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteTextColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              children: controller.prices
                  .map((price) => Center(
                        child: CustomTextWidget(
                          text: '\$$price',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomVehicleContainer extends StatefulWidget {
  final String imageUrl;
  final String price;
  final String vehicleInfo; // Add a parameter to hold vehicle information
  // final VoidCallback? onTap;

  const MyCustomVehicleContainer({
    super.key,
    required this.imageUrl,
    required this.price,
    required this.vehicleInfo,
    // this.onTap,
  });

  @override
  State<MyCustomVehicleContainer> createState() =>
      _MyCustomVehicleContainerState();
}

class _MyCustomVehicleContainerState extends State<MyCustomVehicleContainer> {
  final MyGoogleMapsController _controller = Get.find<MyGoogleMapsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Change the background color based on selection
      bool isSelected = _controller.selectedVehicle.value == widget.vehicleInfo;
      return InkWell(
        onTap: () => _controller.selectVehicle(widget.vehicleInfo),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReUsableContainer(
              verticalPadding: 0,
              width: 80,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              color: isSelected ? AppColors.buttonColor : Colors.white,
              // Change color when selected
              child: Image.asset(widget.imageUrl, fit: BoxFit.fill, height: 60),
            ),
            const SizedBox(height: 8.0),
            ReUsableContainer(
              width: 80,
              verticalPadding: 0,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
              color: isSelected ? AppColors.buttonColor : Colors.white,
              // Change color when selected
              child: CustomTextWidget(
                text: widget.price,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class MyHeaderContainer extends StatelessWidget {
  final String title;

  const MyHeaderContainer({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ReUsableContainer(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => Get.back(),
            icon: Icon(LucideIcons.circleArrowLeft,
                color: AppColors.buttonColor)),
        CustomTextWidget(
          text: title,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
        const Icon(LucideIcons.circleArrowLeft, color: Colors.transparent)
      ],
    ));
  }
}
