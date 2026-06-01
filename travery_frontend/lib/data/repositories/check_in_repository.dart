import 'package:travery_frontend/data/seed_models/check_in/check_in_passenger.dart';
import 'package:travery_frontend/utils/core_result.dart';

abstract class CheckInRepository {
  Future<Result<CheckInPassengerList>> getPassengersByMission(String missionId);
  Future<Result<CheckInPassengerList>> searchPassengers({
    required String missionId,
    required String query,
  });
  Future<Result<CheckInPassenger>> updatePassengerStatus({
    required String missionId,
    required String passengerId,
    required CheckInStatus status,
  });
  Future<Result<bool>> completeCheckIn({
    required String missionId,
    required List<MemberAttendance> attendances,
  });
}
