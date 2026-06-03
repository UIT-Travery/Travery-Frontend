import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

typedef CreateRoomPayload = ({
  String hotelId,
  String roomNumber,
  int floor,
  String roomTypeId,
});

class CreateRoomViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  CreateRoomViewModel({required AdminRepository adminRepository})
      : _adminRepository = adminRepository {
    createRoom = Command1<void, CreateRoomPayload>(_createRoom);
  }

  late final Command1<void, CreateRoomPayload> createRoom;

  Future<Result<void>> _createRoom(CreateRoomPayload payload) async {
    final result = await _adminRepository.createHotelRoom(
      hotelId: payload.hotelId,
      roomNumber: payload.roomNumber,
      floor: payload.floor,
      roomTypeId: payload.roomTypeId,
    );
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
