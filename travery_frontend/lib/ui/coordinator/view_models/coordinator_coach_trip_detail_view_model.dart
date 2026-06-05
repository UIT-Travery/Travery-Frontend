import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/data/services/api/model/coordinator/coach_trip_detail_response/coach_trip_detail_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CoordinatorCoachTripDetailViewModel extends ChangeNotifier {
  final CoordinatorRepository _coordinatorRepository;

  late final Command1<CoachTripDetailResponse, String> loadCoachTripDetail;

  CoordinatorCoachTripDetailViewModel({
    required CoordinatorRepository coordinatorRepository,
  }) : _coordinatorRepository = coordinatorRepository {
    loadCoachTripDetail = Command1(_loadCoachTripDetail);
  }

  Future<Result<CoachTripDetailResponse>> _loadCoachTripDetail(String id) async {
    return await _coordinatorRepository.getCoachTripDetail(id);
  }
}
