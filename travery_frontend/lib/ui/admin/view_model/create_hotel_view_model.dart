import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// Payload for [CreateHotelViewModel.createHotel].
typedef CreateHotelPayload = ({
  String id,
  String name,
  String address,
  String cityProvince,
  double starRating,
  String status,
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
      id: payload.id,
      name: payload.name,
      address: payload.address,
      cityProvince: payload.cityProvince,
      starRating: payload.starRating,
      status: payload.status,
    );
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
