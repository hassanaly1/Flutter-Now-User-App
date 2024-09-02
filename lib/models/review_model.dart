class Review {
  final String id;
  final String rideId;
  final String reviewerId;
  final String revieweeId;
  final double rating;
  final String comment;
  final DateTime timestamp;

  Review({
    required this.id,
    required this.rideId,
    required this.reviewerId,
    required this.revieweeId,
    required this.rating,
    required this.comment,
    required this.timestamp,
  });
}
