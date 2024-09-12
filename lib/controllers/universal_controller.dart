import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';

class MyUniversalController extends GetxController {
  var userCurrentLocation = ''.obs;

  // Accepts a callback that defines what to do after getting the location
  Future<void> getCurrentLocation({Function? onSuccess}) async {
    // Check for location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Handle the case when permission is denied forever
    if (permission == LocationPermission.deniedForever) {
      userCurrentLocation.value = '';
      showSettingsDialog();
      return;
    }

    // Handle the case when permission is denied after the request
    if (permission == LocationPermission.denied) {
      userCurrentLocation.value = '';
      showSettingsDialog();
      return;
    }

    // If permission is granted, get the current location
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      try {
        // Get the current location with settings
        Position position = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 100,
          ),
        );

        // Convert coordinates to a readable address
        await _getAddressFromLatLng(position);

        // Execute the onSuccess callback after obtaining the location
        if (onSuccess != null) {
          onSuccess();
        }
      } catch (e) {
        userCurrentLocation.value = 'Error occurred while fetching location';
        print(e); // Log the error
      }
    }
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    try {
      // Fetch the address details based on the coordinates
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      // Check if any placemark (address) is returned
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        // Update the observable variable with a formatted address
        userCurrentLocation.value =
            '${place.name}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
      } else {
        // Handle the case where no address could be found
        userCurrentLocation.value = '';
      }
    } catch (e) {
      // Handle any errors that occur during the conversion
      userCurrentLocation.value = '';
      print(e);
    }
  }

  // Method to show a dialog prompting the user to open app settings
  void showSettingsDialog() {
    Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(fontSize: 1),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      barrierDismissible: false,
      radius: 16.0,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(
            text: "Location Permission Required",
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            textColor: AppColors.buttonColor,
            textAlign: TextAlign.start,
          ),
          const CustomTextWidget(
            text:
                "Location permission is permanently denied. Please enable it from app settings for a better user experience.",
            fontSize: 15.0,
            maxLines: 5,
            fontWeight: FontWeight.w400,
            textColor: AppColors.blackTextColor,
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () => Get.back(),
                    child: const CustomTextWidget(
                      text: "Cancel",
                      textColor: Colors.redAccent,
                      fontWeight: FontWeight.w700,
                    )),
                const SizedBox(width: 10.0),
                InkWell(
                    onTap: () async {
                      await Geolocator.openAppSettings();
                      Get.back();
                    },
                    child: const CustomTextWidget(
                      text: "Open Settings",
                      textColor: AppColors.buttonColor,
                      fontWeight: FontWeight.w700,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
