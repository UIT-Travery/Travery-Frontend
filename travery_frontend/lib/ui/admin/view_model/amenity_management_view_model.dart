import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/services/api/model/hotel/amenity_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class AmenityManagementViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  AmenityManagementViewModel({required AdminRepository adminRepository})
      : _adminRepository = adminRepository {
    loadAmenities = Command0<List<AmenityResponse>>(_loadAmenities);
    deleteAmenity = Command1<void, String>(_deleteAmenity);
  }

  late final Command0<List<AmenityResponse>> loadAmenities;
  late final Command1<void, String> deleteAmenity;

  Future<Result<List<AmenityResponse>>> _loadAmenities() async {
    final result = await _adminRepository.getAllAmenities();
    switch (result) {
      case Ok<List<dynamic>>():
        final list = result.value
            .map((e) => AmenityResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return Result.ok(list);
      case Error<List<dynamic>>():
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _deleteAmenity(String amenityId) async {
    final result = await _adminRepository.deleteAmenity(amenityId: amenityId);
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
