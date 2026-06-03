import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/domain/models/admin/business_coach/business_coach.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// Payload for [UpdateVehicleViewModel.updateVehicle].
typedef UpdateVehiclePayload = ({
  String id,
  String registrationNumber,
  String type,
  String seatLayoutId,
  int seatCount,
  List<dynamic> seatItems,
  String layoutName,
});

class UpdateVehicleViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  UpdateVehicleViewModel({required AdminRepository adminRepository})
    : _adminRepository = adminRepository {
    loadVehicle = Command1<BusinessCoach, String>(_loadVehicle);
    updateVehicle = Command1<void, UpdateVehiclePayload>(_updateVehicle);
    deleteVehicle = Command1<void, String>(_deleteVehicle);
  }

  late final Command1<BusinessCoach, String> loadVehicle;
  late final Command1<void, UpdateVehiclePayload> updateVehicle;
  late final Command1<void, String> deleteVehicle;

  String _mapType(String type) {
    if (type.contains('giường')) return 'BED';
    if (type.contains('du lịch')) return 'LIMOUSINE';
    return 'SEAT';
  }

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
    final typeStr = _mapType(payload.type);

    // Create a new seat layout to apply potential changes made by the user
    final layoutResult = await _adminRepository.createSeatLayout(
      name: payload.layoutName,
      coachType: typeStr,
      items: payload.seatItems,
    );

    String layoutId = payload.seatLayoutId;
    if (layoutResult is Ok<String>) {
      layoutId = layoutResult.value;
    } else if (layoutResult is Error<String>) {
      return Result.error(layoutResult.error);
    }

    final result = await _adminRepository.updateVehicle(
      id: payload.id,
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

  Future<Result<void>> _deleteVehicle(String id) async {
    final result = await _adminRepository.deleteVehicle(id: id);
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
