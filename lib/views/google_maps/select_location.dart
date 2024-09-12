import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/controllers/google_maps_controller.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_container.dart';
import 'package:user_app/utils/searchbar.dart';
import 'package:user_app/utils/toast.dart';
import 'package:user_app/views/google_maps/select_vehicle.dart';

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
                onMapCreated: _controller.onSelectLocationsMapCreated,
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
                    _controller
                        .addSingleMarker(_controller.currentMapPosition!);
                    if (_controller.isSelectingPickupLocation.value) {
                      _controller.pickupLatLng.value =
                          _controller.currentMapPosition!;
                    } else {
                      _controller.destinationLatLng.value =
                          _controller.currentMapPosition!;
                    }
                    _controller.getAddressFromLatLng(
                        _controller.currentMapPosition!,
                        isPickupLocation:
                            _controller.isSelectingPickupLocation.value);
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
                  onPressed: () {
                    _toggleLocations(isSelectingPickupLocation: true);
                  },
                  icon: const Icon(
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
                      leading: const Icon(
                        LucideIcons.mapPinned,
                        color: AppColors.blackTextColor,
                      ),
                      trailing: InkWell(
                        onTap: () {
                          if (_controller.isSelectingPickupLocation.value) {
                            _controller.searchController.clear();
                            _toggleLocations(isSelectingPickupLocation: false);
                          } else {
                            if (_controller.destinationLatLng.value ==
                                const LatLng(0, 0)) {
                              MyCustomErrorToast(
                                      title: 'Please select Drop-off location')
                                  .showToast(context);
                            } else if (_controller.pickupLatLng.value !=
                                _controller.destinationLatLng.value) {
                              print(_controller.pickupLatLng.value);
                              print(_controller.destinationLatLng.value);
                              Get.to(() => const MySelectVehicleScreen(),
                                  transition: Transition.rightToLeft);
                            } else {
                              MyCustomErrorToast(
                                      title:
                                          'Please select different Pickup and Drop-off locations')
                                  .showToast(context);
                            }
                          }
                        },
                        child: const Icon(
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
                        text: _controller.isSelectingPickupLocation.value
                            ? _controller
                                    .selectedPickupLocation.value.isNotEmpty
                                ? _controller.selectedPickupLocation.value
                                : 'Fetching Pickup location...'
                            : _controller.selectedDestinationLocation.value
                                    .isNotEmpty
                                ? _controller.selectedDestinationLocation.value
                                : _controller
                                        .selectedDestinationLocation.isEmpty
                                    ? _controller.selectedPickupLocation.value
                                    : 'Fetching Drop-off location...',
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

  void _toggleLocations({required bool isSelectingPickupLocation}) {
    debugPrint(
        '-------------------------------------------------------------------------------------');
    _controller.isSelectingPickupLocation.value = isSelectingPickupLocation;
    debugPrint(_controller.isSelectingPickupLocation.value.toString());
    debugPrint(
        'PickupLocationOnNext: ${_controller.selectedPickupLocation.value}');
    debugPrint(
        'DestinationLocationOnNext: ${_controller.selectedDestinationLocation.value}');
    if (_controller.selectedDestinationLocation.value != '') {
      if (_controller.selectedPickupLocation.value !=
          _controller.selectedDestinationLocation.value) {
        _controller.setCameraLocationFromString(
            _controller.isSelectingPickupLocation.value
                ? _controller.selectedPickupLocation.value
                : _controller.selectedDestinationLocation.value);
      }
    }
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
