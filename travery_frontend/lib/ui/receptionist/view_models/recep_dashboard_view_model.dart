import 'package:travery_frontend/data/repositories/receptionist/receptionist_repository.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_dashboard_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class RecepDashboardViewModel {
  final ReceptionistRepository _repository;

  RecepDashboardResponse? dashboardData;

  RecepDashboardViewModel({required ReceptionistRepository repository})
      : _repository = repository {
    loadDashboard = Command0<RecepDashboardResponse>(_loadDashboard);
  }

  late final Command0<RecepDashboardResponse> loadDashboard;

  Future<Result<RecepDashboardResponse>> _loadDashboard() async {
    final result = await _repository.getDashboard();
    switch (result) {
      case Ok<RecepDashboardResponse>():
        dashboardData = result.value;
        return Result.ok(result.value);
      case Error<RecepDashboardResponse>():
        return Result.error(result.error);
    }
  }
}
