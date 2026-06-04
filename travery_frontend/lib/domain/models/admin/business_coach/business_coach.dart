import 'package:travery_frontend/domain/models/admin/business_coach_seat/business_coach_seat.dart';

enum CoachType { sleeper, limousine, standard }

class BusinessCoach {
  const BusinessCoach({
    required this.id,
    required this.plateNumber,
    required this.coachType,
    required this.seatCount,
<<<<<<< HEAD
    this.seats,
=======
    required this.status,
    this.seats,
    this.seatLayoutId,
>>>>>>> develop
  });

  final String id;
  final String plateNumber;
  final String coachType;
  final int seatCount;
<<<<<<< HEAD
  final List<BusinessCoachSeat>? seats;
=======
  final String status;
  final List<BusinessCoachSeat>? seats;
  final String? seatLayoutId;
>>>>>>> develop
}
