import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/services/api/model/amenity/create_amenity_request.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

typedef UpdateAmenityPayload = ({
  String amenityId,
  String? name,
  AmenityType? type,
  String? iconImagePath,
});

class UpdateAmenityViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  UpdateAmenityViewModel({required AdminRepository adminRepository})
      : _adminRepository = adminRepository {
    updateAmenity = Command1<void, UpdateAmenityPayload>(_updateAmenity);
  }

  late final Command1<void, UpdateAmenityPayload> updateAmenity;

  Future<Result<void>> _updateAmenity(UpdateAmenityPayload payload) async {
    final result = await _adminRepository.updateAmenity(
      amenityId: payload.amenityId,
      name: payload.name,
      type: payload.type?.apiValue,
      iconImagePath: payload.iconImagePath,
    );
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
