import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/controllers/google_maps_controller.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_container.dart';

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
        body: Stack(
          children: [
            Obx(
              () => GoogleMap(
                mapType: MapType.terrain,
                onMapCreated: _controller.onMapCreated,
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
            const MyHeaderContainer(),
          ],
        ),
      ),
    );
  }
}

// MyShowSelectedLocationsContainer(controller: _controller),
// MyShowSelectVehicleContainer(controller: _controller),
class MyShowSelectedLocationsContainer extends StatelessWidget {
  const MyShowSelectedLocationsContainer({
    super.key,
    required MyGoogleMapsController controller,
  }) : _controller = controller;

  final MyGoogleMapsController _controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: !_controller.isSelectingPickupLocation.value,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    LucideIcons.circleArrowLeft,
                    color: AppColors.buttonColor,
                    size: 40,
                  ),
                ),
              ),
              ReUsableContainer(
                  color: AppColors.buttonColor.withOpacity(0.3),
                  width: context.width,
                  // height: context.height * 0.06,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class MyShowSelectVehicleContainer extends StatelessWidget {
  const MyShowSelectVehicleContainer({
    super.key,
    required MyGoogleMapsController controller,
  }) : _controller = controller;

  final MyGoogleMapsController _controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Obx(
          () => ReUsableContainer(
              color: AppColors.buttonColor.withOpacity(0.3),
              width: context.width,
              // height: context.height * 0.06,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(),
              )),
        ),
      ),
    );
  }
}

class MyHeaderContainer extends StatelessWidget {
  const MyHeaderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ReUsableContainer(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(LucideIcons.circleArrowLeft,
                  color: AppColors.buttonColor)),
          const CustomTextWidget(
            text: 'Select Vehicle',
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
          const Icon(LucideIcons.circleArrowLeft, color: Colors.transparent)
        ],
      )),
    );
  }
}
