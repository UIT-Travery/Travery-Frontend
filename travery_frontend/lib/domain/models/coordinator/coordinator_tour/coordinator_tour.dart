class CoordinatorTour {
  final String id;
  final String tourName;
  final String destinationName;
  final String pickupLocation;
  final String startDate;
  final String endDate;
  final int minParticipants;
  final int maxParticipants;
  final int currentParticipants;
  final String status;
  final String? imageUrl;
  final String? guideId;
  final String? guideName;
  final String? guidePhone;
  final String? coachId;
  final String? coachLicensePlate;
  final String? coachType;
  final String? driverId;
  final String? driverName;
  final String? driverPhone;

  const CoordinatorTour({
    required this.id,
    required this.tourName,
    required this.destinationName,
    required this.pickupLocation,
    required this.startDate,
    required this.endDate,
    required this.minParticipants,
    required this.maxParticipants,
    required this.currentParticipants,
    required this.status,
    this.imageUrl,
    this.guideId,
    this.guideName,
    this.guidePhone,
    this.coachId,
    this.coachLicensePlate,
    this.coachType,
    this.driverId,
    this.driverName,
    this.driverPhone,
  });
}
