import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_app/services/google_maps_service.dart';

class MyRideController extends GetxController {
  var isDriverArrived = false.obs;
  var userCurrentLocation =
      const LatLng(25.382640904788296, 68.37950549502675).obs;
  var driverCurrentLocation =
      const LatLng(25.373722793231263, 68.37330800461238).obs;
  var distance = ''.obs;
  var duration = ''.obs;
  RxList<LatLng> routePoints = <LatLng>[].obs;
  var markers = <Marker>{}.obs;
  var polylines = <Polyline>{}.obs;
  GoogleMapController? googleMapsController;
  late StreamSubscription<Position> locationSubscription;
  BitmapDescriptor? customMarkerIconForDriver;

  final Geolocator geolocator = Geolocator();

  final MyGoogleMapsService _googleMapsService = MyGoogleMapsService();

  @override
  void onInit() {
    super.onInit();
    _loadCustomMarkerIcon();
    // _initializeLocationTracking();
  }

  // Load the custom marker icon from assets
  Future<void> _loadCustomMarkerIcon() async {
    customMarkerIconForDriver = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(70, 40)),
      'assets/images/car.png',
    );
  }

  void onMapCreated(GoogleMapController controller) {
    googleMapsController = controller;

    // Move camera to user location initially
    googleMapsController?.animateCamera(
      CameraUpdate.newLatLngZoom(userCurrentLocation.value, 15),
    );

    updateMarkersAndPolyline(); // Initialize markers and polyline on map creation
  }

  // Initialize location tracking for user and driver
  Future<void> _initializeLocationTracking() async {
    // Request permissions
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.always) {
      permission = await Geolocator.requestPermission();
    }

    // Track user's location
    locationSubscription = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    ).listen((Position position) {
      userCurrentLocation.value = LatLng(position.latitude, position.longitude);
      updateMarkersAndPolyline();
      _checkDriverArrival();
    });

    // Simulate driver moving towards user location
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (driverCurrentLocation.value == userCurrentLocation.value) {
        timer.cancel(); // Stop when driver reaches user
      } else {
        // Calculate the step to move driver towards user location
        final double stepLat = (userCurrentLocation.value.latitude -
                driverCurrentLocation.value.latitude) *
            0.1; // move 10% closer
        final double stepLng = (userCurrentLocation.value.longitude -
                driverCurrentLocation.value.longitude) *
            0.1;

        driverCurrentLocation.value = LatLng(
          driverCurrentLocation.value.latitude + stepLat,
          driverCurrentLocation.value.longitude + stepLng,
        );
        updateMarkersAndPolyline();
        _checkDriverArrival();
      }
    });
  }

  // Update markers and draw polyline between user and driver
  void updateMarkersAndPolyline() async {
    markers.clear();
    markers.add(Marker(
      markerId: const MarkerId('user'),
      position: userCurrentLocation.value,
      infoWindow: const InfoWindow(title: 'User Location'),
    ));
    markers.add(Marker(
      markerId: const MarkerId('driver'),
      icon: customMarkerIconForDriver ??
          BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueAzure,
          ),
      position: driverCurrentLocation.value,
      infoWindow: const InfoWindow(title: 'Driver Location'),
    ));

    // Get route coordinates
    routePoints.clear();
    routePoints.addAll(await _googleMapsService.getRouteCoordinates(
      userCurrentLocation.value,
      driverCurrentLocation.value,
    ));

    // Update polyline
    polylines.clear();
    polylines.add(Polyline(
      polylineId: const PolylineId('route'),
      points: routePoints,
      color: const Color(0xFF42A5F5),
      width: 5,
    ));

    // Calculate distance and duration
    final distDur = await _googleMapsService.getDistanceAndDuration(
      userCurrentLocation.value,
      driverCurrentLocation.value,
    );
    if (distDur != null) {
      distance.value = distDur['distance']!;
      duration.value = distDur['duration']!;
    }

    // Move the camera to show the entire route
    if (_calculateDistance(
          userCurrentLocation.value.latitude,
          userCurrentLocation.value.longitude,
          driverCurrentLocation.value.latitude,
          driverCurrentLocation.value.longitude,
        ) >
        5000) {
      googleMapsController?.animateCamera(
        CameraUpdate.newLatLngZoom(userCurrentLocation.value, 15),
      );
    } else {
      googleMapsController?.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(
              min(userCurrentLocation.value.latitude,
                  driverCurrentLocation.value.latitude),
              min(userCurrentLocation.value.longitude,
                  driverCurrentLocation.value.longitude),
            ),
            northeast: LatLng(
              max(userCurrentLocation.value.latitude,
                  driverCurrentLocation.value.latitude),
              max(userCurrentLocation.value.longitude,
                  driverCurrentLocation.value.longitude),
            ),
          ),
          50, // Padding around the bounds
        ),
      );
    }
  }

  void _checkDriverArrival() {
    const double arrivalRadius = 50; // 50 meters
    final double distanceBetween = _calculateDistance(
      userCurrentLocation.value.latitude,
      userCurrentLocation.value.longitude,
      driverCurrentLocation.value.latitude,
      driverCurrentLocation.value.longitude,
    );

    if (distanceBetween <= arrivalRadius) {
      isDriverArrived.value = true;
    } else {
      isDriverArrived.value = false;
    }
  }

  // Calculate the distance between two coordinates using Haversine formula
  double _calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371000; // meters
    final double dLat = (lat2 - lat1) * (3.141592653589793 / 180.0);
    final double dLon = (lon2 - lon1) * (3.141592653589793 / 180.0);

    final double a = (0.5 - cos(dLat) / 2) +
        cos(lat1 * (3.141592653589793 / 180.0)) *
            cos(lat2 * (3.141592653589793 / 180.0)) *
            (1 - cos(dLon)) /
            2;

    return earthRadius * 2 * asin(sqrt(a));
  }

  @override
  void onClose() {
    locationSubscription.cancel();
    super.onClose();
  }
}
