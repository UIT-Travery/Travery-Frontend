import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// Payload for [CreateHotelViewModel.createHotel].
typedef CreateHotelPayload = ({
  String name,
  String? description,
  String address,
  String cityProvince,
  String checkInTime,
  String checkOutTime,
  List<String> amenityIds,
  String refundPolicyId,
});

class CreateHotelViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  CreateHotelViewModel({required AdminRepository adminRepository})
    : _adminRepository = adminRepository {
    createHotel = Command1<void, CreateHotelPayload>(_createHotel);
  }

  late final Command1<void, CreateHotelPayload> createHotel;

  Future<Result<void>> _createHotel(CreateHotelPayload payload) async {
    final result = await _adminRepository.createHotel(
      name: payload.name,
      description: payload.description,
      address: payload.address,
      cityProvince: payload.cityProvince,
      checkInTime: payload.checkInTime,
      checkOutTime: payload.checkOutTime,
      amenityIds: payload.amenityIds,
      refundPolicyId: payload.refundPolicyId,
    );
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
