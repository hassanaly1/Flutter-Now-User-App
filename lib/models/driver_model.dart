import 'package:user_app/models/enums.dart';
import 'package:user_app/models/location_model.dart';
import 'package:user_app/models/review_model.dart';
import 'package:user_app/models/ride_model.dart';

class Driver {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String profilePictureUrl;
  final double? averageRating;
  final bool isAvailable;
  final bool isOnline;
  final UserStatus? status;
  final DateTime accountCreatedDate;
  final DateTime? lastActive;
  final Location currentLocation;
  final String licenseNumber;
  final String vehicleType;
  final String vehicleNumber;
  final String vehicleModel;
  final String insuranceDetails;
  final int totalRidesCompleted;
  final List<Review>? ratingsReceived;
  final List<Ride>? rideHistory;
  final DriverVerification? verification;

  Driver({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.profilePictureUrl,
    this.averageRating,
    this.isAvailable = true,
    this.isOnline = false,
    this.status,
    required this.accountCreatedDate,
    this.lastActive,
    required this.currentLocation,
    required this.licenseNumber,
    required this.vehicleType,
    required this.vehicleNumber,
    required this.vehicleModel,
    required this.insuranceDetails,
    this.totalRidesCompleted = 0,
    this.ratingsReceived,
    this.rideHistory,
    this.verification,
  });
}

class DriverVerification {
  final String vehiclePictureUrl;
  final String numberPlatePictureUrl;
  final String registrationNumber;
  final String insuranceDocumentUrl;
  final DateTime licenseExpiryDate;
  final String licensePictureUrl;
  final String nationalIdCardUrl;
  final String policeClearanceCertificateUrl;

  DriverVerification({
    required this.vehiclePictureUrl,
    required this.numberPlatePictureUrl,
    required this.registrationNumber,
    required this.insuranceDocumentUrl,
    required this.licenseExpiryDate,
    required this.licensePictureUrl,
    required this.nationalIdCardUrl,
    required this.policeClearanceCertificateUrl,
  });
}
