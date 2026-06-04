import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/services/api/model/hotel/room_type_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

typedef UpdateRoomTypePayload = ({
  String roomTypeId,
  String? name,
  String? description,
  int? capacityAdults,
  int? capacityChildren,
  double? basePrice,
  RoomBedType? bedType,
  int? area,
});

class UpdateRoomTypeViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  UpdateRoomTypeViewModel({required AdminRepository adminRepository})
      : _adminRepository = adminRepository {
    updateRoomType = Command1<void, UpdateRoomTypePayload>(_updateRoomType);
  }

  late final Command1<void, UpdateRoomTypePayload> updateRoomType;

  Future<Result<void>> _updateRoomType(UpdateRoomTypePayload payload) async {
    final result = await _adminRepository.updateHotelRoomType(
      roomTypeId: payload.roomTypeId,
      name: payload.name,
      description: payload.description,
      capacityAdults: payload.capacityAdults,
      capacityChildren: payload.capacityChildren,
      basePrice: payload.basePrice,
      bedType: payload.bedType?.apiValue,
      area: payload.area,
    );
    switch (result) {
      case Ok<void>():
        return Result.ok(result.value);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
