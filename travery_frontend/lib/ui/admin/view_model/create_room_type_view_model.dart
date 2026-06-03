import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/services/api/model/hotel/room_type_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

typedef CreateRoomTypePayload = ({
  String hotelId,
  String name,
  String? description,
  int? capacityAdults,
  int? capacityChildren,
  double basePrice,
  RoomBedType bedType,
  int? area,
});

class CreateRoomTypeViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  CreateRoomTypeViewModel({required AdminRepository adminRepository})
      : _adminRepository = adminRepository {
    createRoomType = Command1<void, CreateRoomTypePayload>(_createRoomType);
  }

  late final Command1<void, CreateRoomTypePayload> createRoomType;

  Future<Result<void>> _createRoomType(CreateRoomTypePayload payload) async {
    final result = await _adminRepository.createHotelRoomType(
      hotelId: payload.hotelId,
      name: payload.name,
      description: payload.description,
      capacityAdults: payload.capacityAdults,
      capacityChildren: payload.capacityChildren,
      basePrice: payload.basePrice,
      bedType: payload.bedType.apiValue,
      area: payload.area,
    );
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
