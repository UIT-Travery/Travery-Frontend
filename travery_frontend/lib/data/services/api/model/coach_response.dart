class CoachResponse {
  CoachResponse({
    required this.id,
    required this.licensePlate,
    required this.coachType,
    required this.capacity,
    required this.status,
    required this.seatLayoutName,
  });

  final String id;
  final String licensePlate;
  final String coachType;
  final int capacity;
  final String status;
  final String seatLayoutName;

  factory CoachResponse.fromJson(Map<String, dynamic> json) {
    return CoachResponse(
      id: json['id'] as String? ?? '',
      licensePlate: json['licensePlate'] as String? ?? '',
      coachType: json['coachType'] as String? ?? '',
      capacity: json['capacity'] as int? ?? 0,
      status: json['status'] as String? ?? '',
      seatLayoutName: json['seatLayoutName'] as String? ?? '',
    );
  }
}
