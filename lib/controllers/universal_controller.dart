import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:user_app/helpers/dialogs.dart';

class MyUniversalController extends GetxController {
  var userCurrentLocation = ''.obs;
  var isConnectedToInternet = false.obs;

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
        print(e);
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
            '${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.country}';
        // print('Street: ${place.street}');
        // print('SubLocality: ${place.subLocality}');
        // print('Locality: ${place.locality}');
        // print('AdministrativeArea: ${place.administrativeArea}');
        // print('PostalCode: ${place.postalCode}');
        // print('Country: ${place.country}');
        // print('Name: ${place.name}');
        // print('ISOCountryCode: ${place.isoCountryCode}');
        // print('SubThoroughfare: ${place.subThoroughfare}');
        // print('Thoroughfare: ${place.thoroughfare}');
        // print('SubAdministrativeArea: ${place.subAdministrativeArea}');
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
}
