import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour/coordinator_tour.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour_template/coordinator_tour_template.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CoordinatorTourTemplateDetailViewModel extends ChangeNotifier {
  final CoordinatorRepository _coordinatorRepository;

  CoordinatorTourTemplateDetailViewModel({
    required CoordinatorRepository coordinatorRepository,
  }) : _coordinatorRepository = coordinatorRepository {
    updateTemplate =
        Command1<CoordinatorTourTemplate, TourUpdateTemplateParams>(_updateTemplate);
    deleteTemplate = Command1<void, String>(_deleteTemplate);
    createInstanceFromTemplate =
        Command1<CoordinatorTour, TourCreateInstanceParams>(_createInstanceFromTemplate);

    updateTemplate.addListener(_onChanged);
    deleteTemplate.addListener(_onChanged);
    createInstanceFromTemplate.addListener(_onChanged);
  }

  late final Command1<CoordinatorTourTemplate, TourUpdateTemplateParams> updateTemplate;
  late final Command1<void, String> deleteTemplate;
  late final Command1<CoordinatorTour, TourCreateInstanceParams> createInstanceFromTemplate;

  Future<Result<CoordinatorTourTemplate>> _updateTemplate(
    TourUpdateTemplateParams params,
  ) async {
    return _coordinatorRepository.updateTemplate(
      id: params.id,
      data: params.data,
    );
  }

  Future<Result<void>> _deleteTemplate(String id) async {
    return _coordinatorRepository.deleteTemplate(id);
  }

  Future<Result<CoordinatorTour>> _createInstanceFromTemplate(
    TourCreateInstanceParams params,
  ) async {
    return _coordinatorRepository.createTourInstance(
      tourId: params.tourId,
      startDate: params.startDate,
      endDate: params.endDate,
    );
  }

  /// Convenience method for views to create an instance without knowing the params class.
  void executeCreateInstance({
    required String tourId,
    required String startDate,
    required String endDate,
  }) {
    createInstanceFromTemplate.execute(
      TourCreateInstanceParams(
        tourId: tourId,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  void _onChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    updateTemplate.removeListener(_onChanged);
    deleteTemplate.removeListener(_onChanged);
    createInstanceFromTemplate.removeListener(_onChanged);
    updateTemplate.dispose();
    deleteTemplate.dispose();
    createInstanceFromTemplate.dispose();
    super.dispose();
  }
}

class TourUpdateTemplateParams {
  final String id;
  final Map<String, dynamic> data;

  const TourUpdateTemplateParams({required this.id, required this.data});
}

class TourCreateInstanceParams {
  final String tourId;
  final String startDate;
  final String endDate;

  const TourCreateInstanceParams({
    required this.tourId,
    required this.startDate,
    required this.endDate,
  });
}
