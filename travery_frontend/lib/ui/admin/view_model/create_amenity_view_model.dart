import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/services/api/model/amenity/create_amenity_request.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

typedef CreateAmenityPayload = ({
  String name,
  AmenityType type,
  String? iconImagePath,
});

class CreateAmenityViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  CreateAmenityViewModel({required AdminRepository adminRepository})
      : _adminRepository = adminRepository {
    createAmenity = Command1<void, CreateAmenityPayload>(_createAmenity);
  }

  late final Command1<void, CreateAmenityPayload> createAmenity;

  Future<Result<void>> _createAmenity(CreateAmenityPayload payload) async {
    final result = await _adminRepository.createAmenity(
      name: payload.name,
      type: payload.type.apiValue,
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
