import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app/controllers/universal_controller.dart';
import 'package:user_app/services/google_maps_service.dart';
import 'package:user_app/utils/appcolors.dart';

class MyGoogleMapsController extends GetxController {
  final MyUniversalController universalController = Get.find();
  MyGoogleMapsService googleMapsService = MyGoogleMapsService();
  var isSelectingPickupLocation = true.obs;

  GoogleMapController? googleMapsController;
  LatLng? currentMapPosition;

  var markers = <Marker>{}.obs;
  var polylines = <Polyline>{}.obs;

  ///BeforeRide
  var selectedPickupLocation = ''.obs;
  var selectedDestinationLocation = ''.obs;
  var pickupLatLng = const LatLng(0, 0).obs;
  var destinationLatLng = const LatLng(0, 0).obs;

  BitmapDescriptor? customMarkerIcon;
  final TextEditingController searchController = TextEditingController();

  var calculatedDistance = ''.obs;
  var calculatedDuration = ''.obs;

  ///Select-Ride-Screen
  RxString selectedVehicle = ''.obs;
  final RxInt selectedPriceIndex = 0.obs;
  RxInt selectedPriceInDollars = 0.obs;

  // List of prices to display in the picker
  final List<int> prices = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50];

  ///AfterRide
  RxBool isDriverArrived = false.obs;
  Rx<LatLng> driverCurrentLocation = const LatLng(0, 0).obs;
  Rx<LatLng> userCurrentLocation = const LatLng(0, 0).obs;

  // Mock of the driver's initial location - replace with real-time data from backend or location services
  LatLng driverInitialLocation =
      const LatLng(24.9258396433174, 67.09227611185437);

  @override
  void onInit() {
    super.onInit();
    // loadCustomMarkerIcon('assets/images/marker.png');
    _setInitialLocation();

    // Listeners to update locations and draw polyline when pickup/destination changes
    // ever(selectedPickupLocation, (_) => setLocationsAndDrawPolyline());
    // ever(selectedDestinationLocation, (_) => setLocationsAndDrawPolyline());
  }

  // Callback when the Google Map is created, sets initial location
  void onSelectLocationsMapCreated(GoogleMapController controller) {
    googleMapsController = controller;
    _setInitialLocation();
  }

  void onSelectVehicleMapCreated(GoogleMapController controller) {
    // googleMapsController = controller;
  }

  // Function to select a vehicle
  void selectVehicle(String vehicleInfo) => selectedVehicle.value = vehicleInfo;

  // Load the custom marker icon from assets
  Future<void> loadCustomMarkerIcon(imageUrl) async =>
      customMarkerIcon = await BitmapDescriptor.asset(
        const ImageConfiguration(size: Size(80, 100)),
        imageUrl,
      );

  // Set the initial map location using the user's current location from the universal controller
  Future<void> _setInitialLocation() async {
    print('SetInitialLocationCalled');
    String locationString = universalController.userCurrentLocation.value;

    if (locationString.isNotEmpty) {
      try {
        // Convert address to LatLng
        List<Location> locations = await locationFromAddress(locationString);
        if (locations.isNotEmpty) {
          LatLng positionLatLng =
              LatLng(locations.first.latitude, locations.first.longitude);
          addSingleMarker(positionLatLng); // Add marker to the initial location
          selectedPickupLocation.value = locationString; // Set initial location

          // Animate the camera to the initial location if the map controller is initialized
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

  // Set camera location based on a given address string and update marker
  void setCameraLocationFromString(String locationString) async {
    print('locationString: $locationString');
    List<Location> locations = await locationFromAddress(locationString);
    if (locations.isNotEmpty) {
      LatLng positionLatLng =
          LatLng(locations.first.latitude, locations.first.longitude);
      // addSingleMarker(positionLatLng); // Add marker for new location

      // Assign the location value based on the selection type (pickup/destination)
      if (isSelectingPickupLocation.value) {
        selectedPickupLocation.value = locationString;
      } else {
        selectedDestinationLocation.value = locationString;
      }

      // Animate the map camera to the new location
      if (googleMapsController != null) {
        googleMapsController!.animateCamera(
          CameraUpdate.newLatLngZoom(positionLatLng, 16),
        );
      }
      update(); // Trigger UI update
    }
  }

  // Add a single marker to the map, used for either pickup or destination
  void addSingleMarker(LatLng position) {
    clearMarkers(); // Clear existing markers
    markers.add(
      Marker(
        markerId: const MarkerId('current_location'),
        position: position,
        icon: customMarkerIcon ??
            BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRed,
            ),
        draggable: true,
        onDragEnd: (newPosition) async {
          // Update the address when the marker is dragged
          await getAddressFromLatLng(newPosition,
              isPickupLocation: isSelectingPickupLocation.value);
        },
      ),
    );
  }

  // Clear all markers from the map
  void clearMarkers() => markers.clear();

  // Fetch the address from given LatLng coordinates and update the location fields
  Future<void> getAddressFromLatLng(LatLng position,
      {required bool isPickupLocation}) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        // Update pickup or destination location based on the parameter
        var location =
            "${placemarks.first.street}, ${placemarks.first.locality}, ${placemarks.first.administrativeArea}, ${placemarks.first.country}.";
        isPickupLocation
            ? selectedPickupLocation.value = location
            : selectedDestinationLocation.value = location;

        update();
      }
    } catch (e) {
      debugPrint('Error fetching address: $e');
    }
  }

  // Method to Calculate distance and time between two locations
  calculateDistanceAndTimeFromLatLng(LatLng start, LatLng end) async {
    var result = await googleMapsService.getDistanceAndDuration(start, end);

    if (result != null) {
      calculatedDistance.value = result['distance'] ?? 'NA';
      calculatedDuration.value = result['duration'] ?? 'NA';
      print('CalculatedDistance: ${calculatedDistance.value}');
      print('CalculatedDuration: ${calculatedDuration.value}');
      return result;
    } else {
      print('Failed to fetch distance and time.');
    }
  }

  // Methods to draw polyline between two locations
//---------------------------------------------------------------------------//

  // Set markers and draw polyline when both pickup and destination are selected
  void setLocationsAndDrawPolyline() {
    if (selectedPickupLocation.value.isNotEmpty &&
        selectedDestinationLocation.value.isNotEmpty) {
      try {
        // Fetch locations from the selected addresses
        final pickupLocation = selectedPickupLocation.value;
        final destinationLocation = selectedDestinationLocation.value;
        print('PickUpLocation: $pickupLocation');
        print('DestinationLocation: $destinationLocation');

        // Convert addresses to LatLng
        locationFromAddress(pickupLocation).then((pickupLatLng) {
          locationFromAddress(destinationLocation).then((destinationLatLng) {
            if (pickupLatLng.isNotEmpty && destinationLatLng.isNotEmpty) {
              LatLng start = LatLng(
                pickupLatLng.first.latitude,
                pickupLatLng.first.longitude,
              );
              LatLng end = LatLng(
                destinationLatLng.first.latitude,
                destinationLatLng.first.longitude,
              );

              // Add two markers for pickup and destination
              addMarkersForPickupAndDestination(start, end);

              // Draw polyline between the two points
              drawPolyline(start, end);
            }
          });
        });
      } catch (e) {
        debugPrint('Error drawing polyline: $e');
      }
    }
  }

  // Draws a polyline between two locations on the map
  Future<void> drawPolyline(LatLng start, LatLng end) async {
    const String polylineId = 'route_polyline';
    List<LatLng> routePoints =
        await googleMapsService.getRouteCoordinates(start, end);

    // Create a Polyline object with required properties
    final polyline = Polyline(
      polylineId: const PolylineId(polylineId),
      color: AppColors.buttonColor,
      // Polyline color
      width: 5,
      geodesic: true,
      jointType: JointType.bevel,
      // Width of the line
      // points: [start, end],
      points: routePoints,
      // LatLng points for the polyline
      visible: true,
    );

    // Clear existing polylines and add the new one

    if (routePoints.isNotEmpty) {
      polylines.clear();
      polylines.add(polyline);
    }

    // Update the map with the new polyline
    update();
  }

// Add two markers: one for pickup and one for destination
  void addMarkersForPickupAndDestination(
      LatLng pickupPosition, LatLng destinationPosition) {
    clearMarkers(); // Clear existing markers
    markers.addAll([
      Marker(
        markerId: const MarkerId('pickup_location'),
        position: pickupPosition,
        flat: true,
        icon: customMarkerIcon ??
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: const InfoWindow(title: 'Pickup Location'),
      ),
      Marker(
        markerId: const MarkerId('destination_location'),
        position: destinationPosition,
        icon: customMarkerIcon ??
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: const InfoWindow(title: 'Destination Location'),
      ),
    ]);
    calculateDistanceAndTimeFromLatLng(pickupPosition, destinationPosition);
    update(); // Trigger UI update
  }
}
