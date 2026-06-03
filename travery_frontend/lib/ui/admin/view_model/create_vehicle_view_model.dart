import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// Payload for [CreateVehicleViewModel.createVehicle].
typedef CreateVehiclePayload = ({
  String registrationNumber,
  String model,
  String type,
  int seatCount,
  bool isAvailable,
});

class CreateVehicleViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  CreateVehicleViewModel({required AdminRepository adminRepository})
    : _adminRepository = adminRepository {
    createVehicle = Command1<void, CreateVehiclePayload>(_createVehicle);
  }

  late final Command1<void, CreateVehiclePayload> createVehicle;

  Future<Result<void>> _createVehicle(CreateVehiclePayload payload) async {
    final result = await _adminRepository.createVehicle(
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
