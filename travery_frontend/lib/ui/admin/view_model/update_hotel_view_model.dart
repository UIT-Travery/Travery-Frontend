import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/domain/models/admin/business_hotel/business_hotel.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// Payload for [UpdateHotelViewModel.updateHotel].
typedef UpdateHotelPayload = ({
  String id,
  String name,
  String address,
  int starRating,
  String cityProvince,
  String status,
});

class UpdateHotelViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  UpdateHotelViewModel({required AdminRepository adminRepository})
    : _adminRepository = adminRepository {
    loadHotel = Command1<BusinessHotel, String>(_loadHotel);
    updateHotel = Command1<void, UpdateHotelPayload>(_updateHotel);
  }

  late final Command1<BusinessHotel, String> loadHotel;
  late final Command1<void, UpdateHotelPayload> updateHotel;

  Future<Result<BusinessHotel>> _loadHotel(String id) async {
    final result = await _adminRepository.getHotel(id: id);
    switch (result) {
      case Ok<BusinessHotel>():
        return Result.ok(result.value);
      case Error<BusinessHotel>():
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _updateHotel(UpdateHotelPayload payload) async {
    final result = await _adminRepository.updateHotel(
      id: payload.id,
      name: payload.name,
      address: payload.address,
      starRating: payload.starRating,
      cityProvince: payload.cityProvince,
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
