import 'package:user_app/models/location_model.dart';

class AppNotification {
  final String id;
  final String title;
  final String message;
  final DateTime timestamp;
  final String userId;
  final Location location;

  AppNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
    required this.userId,
    required this.location,
  });
}
