import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/data/services/api/model/coordinator/coach_trip_response/coach_trip_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CoordinatorCoachTripListViewModel {
  CoordinatorCoachTripListViewModel({
    required CoordinatorRepository coordinatorRepository,
  }) : _coordinatorRepository = coordinatorRepository {
    loadCoachTrips = Command1(_loadCoachTrips);
  }

  final CoordinatorRepository _coordinatorRepository;
  late final Command1<List<CoachTripResponse>, String?> loadCoachTrips;

  Future<Result<List<CoachTripResponse>>> _loadCoachTrips(String? status) async {
    return _coordinatorRepository.getCoachTrips(status: status);
  }

  void dispose() {
    loadCoachTrips.dispose();
  }
}
