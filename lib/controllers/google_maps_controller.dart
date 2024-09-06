import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app/controllers/universal_controller.dart';

class MyGoogleMapsController extends GetxController {
  final MyUniversalController universalController = Get.find();
  var isSelectingPickupLocation = true.obs;
  var markers = <Marker>{}.obs;
  GoogleMapController? googleMapsController;
  LatLng? currentMapPosition; // To hold the current camera position
  var selectedPickupLocation = ''.obs;
  var selectedDestinationLocation = ''.obs;
  BitmapDescriptor? customMarkerIcon; // Variable to hold custom marker icon

  @override
  void onInit() {
    super.onInit();
    _loadCustomMarkerIcon(); // Load the custom marker icon
    _setInitialLocation();
  }

  // Load the custom marker icon from assets
  Future<void> _loadCustomMarkerIcon() async {
    customMarkerIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(60, 60)),
      'assets/images/marker.png',
    );
  }

  Future<void> _setInitialLocation() async {
    String locationString = universalController.userCurrentLocation.value;

    if (locationString.isNotEmpty) {
      try {
        List<Location> locations = await locationFromAddress(locationString);
        if (locations.isNotEmpty) {
          LatLng positionLatLng =
              LatLng(locations.first.latitude, locations.first.longitude);
          addMarker(positionLatLng);
          selectedPickupLocation.value = locationString; // Set initial location

          // Check if mapController is initialized before using it
          if (googleMapsController != null) {
            googleMapsController!.animateCamera(
              CameraUpdate.newLatLngZoom(positionLatLng, 15),
            );
          }
        }
      } catch (e) {
        debugPrint('Error converting address to location: $e');
      }
    } else {
      debugPrint('No location data available');
    }
  }

  void addMarker(LatLng position) {
    markers.clear();
    markers.add(
      Marker(
        markerId: const MarkerId('current_location'),
        position: position,
        icon: customMarkerIcon ??
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        // Use custom icon if loaded
        draggable: true,
        onDragEnd: (newPosition) async {
          await getAddressFromLatLng(newPosition); // Update location on drag
        },
      ),
    );
  }

  Future<void> getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        selectedPickupLocation.value =
            "${placemarks.first.street}, ${placemarks.first.locality} , ${placemarks.first.country}";
      }
    } catch (e) {
      debugPrint('Error fetching address: $e');
    }
  }

  void onMapCreated(GoogleMapController controller) {
    googleMapsController = controller;
    _setInitialLocation();
  }
}
