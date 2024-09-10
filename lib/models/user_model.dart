import 'package:user_app/models/enums.dart';
import 'package:user_app/models/location_model.dart';
import 'package:user_app/models/review_model.dart';
import 'package:user_app/models/ride_model.dart';

class MyUserModel {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String? profilePictureUrl;
  final double? averageRating;
  final UserStatus? status;
  final DateTime? accountCreatedDate;
  final DateTime? lastActive;
  final MyLocationModel? currentLocation;
  final List<MyReviewModel>? reviews;
  final List<MyRideModel>? rideHistory;

  MyUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.profilePictureUrl = '',
    this.averageRating = 0.0,
    this.status = UserStatus.active,
    this.lastActive,
    this.accountCreatedDate,
    this.currentLocation,
    this.reviews,
    this.rideHistory,
  });
}
