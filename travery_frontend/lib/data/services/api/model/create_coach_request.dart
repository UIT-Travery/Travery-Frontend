class CreateCoachRequest {
  CreateCoachRequest({
    required this.coachType,
    required this.licensePlate,
    required this.seatLayoutId,
    required this.capacity,
  });

  final String coachType; // "SEAT", "BED", "LIMOUSINE"
  final String licensePlate;
  final String seatLayoutId;
  final int capacity;

  Map<String, dynamic> toJson() {
    return {
      'coachType': coachType,
      'licensePlate': licensePlate,
      'seatLayoutId': seatLayoutId,
      'capacity': capacity,
    };
  }
}
