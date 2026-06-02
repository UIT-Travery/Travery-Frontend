import 'package:travery_frontend/domain/models/admin/business_coach_seat/business_coach_seat.dart';

enum CoachType { sleeper, limousine, standard }

class BusinessCoach {
  const BusinessCoach({
    required this.id,
    required this.plateNumber,
    required this.coachType,
    required this.seatCount,
    required this.status,
    this.seats,
  });

  final String id;
  final String plateNumber;
  final String coachType;
  final int seatCount;
  final String status;
  final List<BusinessCoachSeat>? seats;
}
