import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour/coordinator_tour.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CoordinatorTourDetailViewModel extends ChangeNotifier {
  final CoordinatorRepository _coordinatorRepository;

  CoordinatorTourDetailViewModel({
    required CoordinatorRepository coordinatorRepository,
  }) : _coordinatorRepository = coordinatorRepository {
    loadTourDetail = Command1<CoordinatorTour, String>(_loadTourDetail);
    updateInstance = Command1<CoordinatorTour, TourUpdateInstanceParams>(_updateInstance);
    updateStatus = Command1<CoordinatorTour, TourUpdateStatusParams>(_updateStatus);
    deleteInstance = Command1<void, String>(_deleteInstance);

    loadTourDetail.addListener(_onChanged);
    updateInstance.addListener(_onChanged);
    updateStatus.addListener(_onChanged);
    deleteInstance.addListener(_onChanged);
  }

  late final Command1<CoordinatorTour, String> loadTourDetail;
  late final Command1<CoordinatorTour, TourUpdateInstanceParams> updateInstance;
  late final Command1<CoordinatorTour, TourUpdateStatusParams> updateStatus;
  late final Command1<void, String> deleteInstance;

  Future<Result<CoordinatorTour>> _loadTourDetail(String id) async {
    return _coordinatorRepository.getTourById(id);
  }

  Future<Result<CoordinatorTour>> _updateInstance(TourUpdateInstanceParams params) async {
    return _coordinatorRepository.updateTourInstance(
      id: params.id,
      guideId: params.guideId,
      coachId: params.coachId,
      driverId: params.driverId,
      startDate: params.startDate,
      endDate: params.endDate,
      status: params.status,
    );
  }

  Future<Result<CoordinatorTour>> _updateStatus(TourUpdateStatusParams params) async {
    return _coordinatorRepository.updateTourInstanceStatus(
      id: params.id,
      status: params.status,
    );
  }

  Future<Result<void>> _deleteInstance(String id) async {
    // Use updateTourInstanceStatus to CANCELLED as a soft delete,
    // or implement a proper delete if the API supports it.
    // For now stub to updateTourInstanceStatus with CANCELLED.
    return _coordinatorRepository.updateTourInstanceStatus(
      id: id,
      status: 'CANCELLED',
    );
  }

  /// Convenience method for views to update tour status without needing the private params class.
  void executeUpdateStatus({required String id, required String status}) {
    updateStatus.execute(TourUpdateStatusParams(id: id, status: status));
  }

  /// Convenience method for views to update tour instance without needing the private params class.
  void executeUpdateInstance({
    required String id,
    String? guideId,
    String? coachId,
    String? driverId,
    String? startDate,
    String? endDate,
    String? status,
  }) {
    updateInstance.execute(
      TourUpdateInstanceParams(
        id: id,
        guideId: guideId,
        coachId: coachId,
        driverId: driverId,
        startDate: startDate,
        endDate: endDate,
        status: status,
      ),
    );
  }

  void _onChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    loadTourDetail.removeListener(_onChanged);
    updateInstance.removeListener(_onChanged);
    updateStatus.removeListener(_onChanged);
    deleteInstance.removeListener(_onChanged);
    loadTourDetail.dispose();
    updateInstance.dispose();
    updateStatus.dispose();
    deleteInstance.dispose();
    super.dispose();
  }
}

class TourUpdateInstanceParams {
  final String id;
  final String? guideId;
  final String? coachId;
  final String? driverId;
  final String? startDate;
  final String? endDate;
  final String? status;

  const TourUpdateInstanceParams({
    required this.id,
    this.guideId,
    this.coachId,
    this.driverId,
    this.startDate,
    this.endDate,
    this.status,
  });
}

class TourUpdateStatusParams {
  final String id;
  final String status;

  const TourUpdateStatusParams({required this.id, required this.status});
}
