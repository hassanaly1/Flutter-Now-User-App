import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/controllers/google_maps_controller.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_container.dart';
import 'package:user_app/utils/searchbar.dart';

class MySelectLocationScreen extends StatefulWidget {
  const MySelectLocationScreen({super.key});

  @override
  State<MySelectLocationScreen> createState() => _MySelectLocationScreenState();
}

class _MySelectLocationScreenState extends State<MySelectLocationScreen> {
  late MyGoogleMapsController _controller;

  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<MyGoogleMapsController>()) {
      _controller = Get.find<MyGoogleMapsController>();
    } else {
      _controller = Get.put(MyGoogleMapsController());
    }
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
                markers: _controller.markers,
                onCameraMove: (position) {
                  // Update the current position
                  _controller.currentMapPosition = position.target;
                },
                myLocationEnabled: true,
                buildingsEnabled: true,
                compassEnabled: true,
                fortyFiveDegreeImageryEnabled: true,
                // indoorViewEnabled: true,
                // liteModeEnabled: true,
                mapToolbarEnabled: true,
                myLocationButtonEnabled: true,
                scrollGesturesEnabled: true,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,
                trafficEnabled: true,
                tiltGesturesEnabled: true,
                rotateGesturesEnabled: true,
                onCameraIdle: () {
                  if (_controller.currentMapPosition != null) {
                    _controller.addMarker(_controller.currentMapPosition!);
                    _controller
                        .getAddressFromLatLng(_controller.currentMapPosition!);
                  }
                },
              ),
            ),
            const MyShowSearchbarContainer(),
            MyShowAddressContainer(controller: _controller),
          ],
        ),
      ),
    );
  }
}

class MyShowAddressContainer extends StatelessWidget {
  const MyShowAddressContainer({
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
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: !_controller.isSelectingPickupLocation.value,
                child: IconButton(
                  onPressed: () =>
                      _controller.isSelectingPickupLocation.value = true,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Obx(
                    () => ListTile(
                      leading: Icon(
                        LucideIcons.mapPinned,
                        color: AppColors.blackTextColor,
                      ),
                      trailing: InkWell(
                        onTap: () {
                          _controller.isSelectingPickupLocation.value = false;
                        },
                        child: Icon(
                          LucideIcons.circleArrowRight,
                          color: AppColors.buttonColor,
                          size: 30,
                        ),
                      ),
                      title: CustomTextWidget(
                        text: _controller.isSelectingPickupLocation.value
                            ? 'Select Pickup Location'
                            : 'Select Drop-off Location',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                      subtitle: CustomTextWidget(
                        text:
                            _controller.selectedPickupLocation.value.isNotEmpty
                                ? _controller.selectedPickupLocation.value
                                : 'Fetching location...',
                        maxLines: 2,
                      ),
                    ),
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

class MyShowSearchbarContainer extends StatelessWidget {
  const MyShowSearchbarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: CustomSearchBar(),
    );
  }
}
