import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_driver/coordinator_driver.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_guide/coordinator_guide.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_vehicle/coordinator_vehicle.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CoordinatorDriverVehicleGuideSelectionViewModel extends ChangeNotifier {
  final CoordinatorRepository _coordinatorRepository;

  CoordinatorDriverVehicleGuideSelectionViewModel({
    required CoordinatorRepository coordinatorRepository,
  }) : _coordinatorRepository = coordinatorRepository {
    loadDrivers = Command0<List<CoordinatorDriver>>(_loadDrivers);
    loadVehicles = Command0<List<CoordinatorVehicle>>(_loadVehicles);
    loadGuides = Command0<List<CoordinatorGuide>>(_loadGuides);
  }

  late final Command0<List<CoordinatorDriver>> loadDrivers;
  late final Command0<List<CoordinatorVehicle>> loadVehicles;
  late final Command0<List<CoordinatorGuide>> loadGuides;

  Future<Result<List<CoordinatorDriver>>> _loadDrivers() async {
    return await _coordinatorRepository.getAllDrivers();
  }

  Future<Result<List<CoordinatorVehicle>>> _loadVehicles() async {
    return await _coordinatorRepository.getAllVehicles();
  }

  Future<Result<List<CoordinatorGuide>>> _loadGuides() async {
    return await _coordinatorRepository.getAllGuides();
  }

  void executeLoadAll() {
    loadDrivers.execute();
    loadVehicles.execute();
    loadGuides.execute();
  }

  @override
  void dispose() {
    loadDrivers.dispose();
    loadVehicles.dispose();
    loadGuides.dispose();
    super.dispose();
  }
}
