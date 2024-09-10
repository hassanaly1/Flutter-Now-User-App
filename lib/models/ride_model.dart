import 'package:user_app/models/driver_model.dart';
import 'package:user_app/models/enums.dart';
import 'package:user_app/models/location_model.dart';
import 'package:user_app/models/review_model.dart';
import 'package:user_app/models/user_model.dart';

class MyRideModel {
  final String? id;
  final MyUserModel? user;
  final MyDriverModel? driver;
  final MyLocationModel? pickupLocation;
  final MyLocationModel? dropOffLocation;
  final DateTime? requestedTime;
  final double? proposedFare;
  final double? agreedFare;
  final UserStatus? status;
  final double? distance;
  final Duration? estimatedDuration;
  final Duration? actualDuration;
  final VehicleType? vehicleType;
  final PaymentStatus? paymentStatus;
  final PaymentType? paymentType;
  final MyReviewModel? userReview;
  final MyReviewModel? driverReview;
  final String? cancellationReason;
  final DateTime? startTime;
  final DateTime? endTime;
  final bool? isCancelled;
  final bool? isCompleted;
  final bool? isRideStarted;
  final UserType? rideCancelledBy;

  MyRideModel({
    this.id,
    this.user,
    this.driver,
    this.pickupLocation,
    this.dropOffLocation,
    this.requestedTime,
    this.proposedFare,
    this.agreedFare,
    this.status,
    this.distance,
    this.estimatedDuration,
    this.actualDuration,
    this.vehicleType,
    this.paymentStatus,
    this.paymentType,
    this.userReview,
    this.driverReview,
    this.cancellationReason,
    this.startTime,
    this.endTime,
    this.isCancelled,
    this.isCompleted,
    this.isRideStarted,
    this.rideCancelledBy,
  });
}
