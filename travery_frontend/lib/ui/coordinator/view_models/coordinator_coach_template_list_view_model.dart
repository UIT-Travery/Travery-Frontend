import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/data/services/api/model/coordinator/coach_route_response/coach_route_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CoordinatorCoachTemplateListViewModel {
  CoordinatorCoachTemplateListViewModel({
    required CoordinatorRepository coordinatorRepository,
  }) : _coordinatorRepository = coordinatorRepository {
    loadRoutes = Command0(_loadRoutes);
  }

  final CoordinatorRepository _coordinatorRepository;
  late final Command0<List<CoachRouteResponse>> loadRoutes;

  Future<Result<List<CoachRouteResponse>>> _loadRoutes() async {
    return await _coordinatorRepository.getRoutes();
  }

  void dispose() {
    loadRoutes.dispose();
  }
}
