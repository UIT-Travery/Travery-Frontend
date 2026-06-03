import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/domain/models/admin/business_coach/business_coach.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// Payload for [UpdateVehicleViewModel.updateVehicle].
typedef UpdateVehiclePayload = ({
  String id,
  String registrationNumber,
  String model,
  String type,
  int seatCount,
  bool isAvailable,
});

class UpdateVehicleViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  UpdateVehicleViewModel({required AdminRepository adminRepository})
    : _adminRepository = adminRepository {
    loadVehicle = Command1<BusinessCoach, String>(_loadVehicle);
    updateVehicle = Command1<void, UpdateVehiclePayload>(_updateVehicle);
  }

  late final Command1<BusinessCoach, String> loadVehicle;
  late final Command1<void, UpdateVehiclePayload> updateVehicle;

  Future<Result<BusinessCoach>> _loadVehicle(String id) async {
    final result = await _adminRepository.getVehicle(id: id);
    switch (result) {
      case Ok<BusinessCoach>():
        return Result.ok(result.value);
      case Error<BusinessCoach>():
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _updateVehicle(UpdateVehiclePayload payload) async {
    final result = await _adminRepository.updateVehicle(
      id: payload.id,
      registrationNumber: payload.registrationNumber,
      model: payload.model,
      type: payload.type,
      seatCount: payload.seatCount,
      isAvailable: payload.isAvailable,
    );
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
