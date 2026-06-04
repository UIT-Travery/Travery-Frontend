import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// Payload for [CreateVehicleViewModel.createVehicle].
typedef CreateVehiclePayload = ({
  String registrationNumber,
  String type,
  String layoutName,
  int seatCount,
  List<dynamic> seatItems,
});

class CreateVehicleViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  CreateVehicleViewModel({required AdminRepository adminRepository})
    : _adminRepository = adminRepository {
    createVehicle = Command1<void, CreateVehiclePayload>(_createVehicle);
  }

  late final Command1<void, CreateVehiclePayload> createVehicle;

  String _mapType(String type) {
    if (type.contains('giường')) return 'BED';
    if (type.contains('du lịch')) return 'LIMOUSINE';
    return 'SEAT';
  }

  Future<Result<void>> _createVehicle(CreateVehiclePayload payload) async {
    final typeStr = _mapType(payload.type);

    // 1. Create Seat Layout
    final layoutResult = await _adminRepository.createSeatLayout(
      name: payload.layoutName,
      coachType: typeStr,
      items: payload.seatItems,
    );

    String layoutId = '';
    switch (layoutResult) {
      case Ok<String>():
        layoutId = layoutResult.value;
      case Error<String>():
        return Result.error(layoutResult.error);
    }

    // 2. Create Vehicle with Layout ID
    final result = await _adminRepository.createVehicle(
      registrationNumber: payload.registrationNumber,
      type: typeStr,
      seatLayoutId: layoutId,
      seatCount: payload.seatCount,
    );

    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
