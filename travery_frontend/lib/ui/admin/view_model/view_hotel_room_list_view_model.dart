import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

typedef UpdateRoomPayload = ({
  String roomId,
  String roomNumber,
  int floor,
  String roomTypeId,
});

class ViewHotelRoomListViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  ViewHotelRoomListViewModel({required AdminRepository adminRepository})
      : _adminRepository = adminRepository {
    loadRooms = Command1<List<dynamic>, String>(_loadRooms);
    updateRoom = Command1<void, UpdateRoomPayload>(_updateRoom);
    loadRoomTypes = Command1<List<dynamic>, String>(_loadRoomTypes);
  }

  late final Command1<List<dynamic>, String> loadRooms;
  late final Command1<void, UpdateRoomPayload> updateRoom;
  late final Command1<List<dynamic>, String> loadRoomTypes;

  List<dynamic> _roomTypes = [];
  List<dynamic> get roomTypes => _roomTypes;

  Future<Result<List<dynamic>>> _loadRooms(String hotelId) async {
    final result = await _adminRepository.getHotelRooms(hotelId: hotelId);
    return result;
  }

  Future<Result<List<dynamic>>> _loadRoomTypes(String hotelId) async {
    final result = await _adminRepository.getHotelRoomTypes(hotelId: hotelId);
    if (result is Ok<List<dynamic>>) {
      _roomTypes = result.value;
      notifyListeners();
    }
    return result;
  }

  Future<Result<void>> _updateRoom(UpdateRoomPayload payload) async {
    final result = await _adminRepository.updateRoom(
      roomId: payload.roomId,
      roomNumber: payload.roomNumber,
      floor: payload.floor,
      roomTypeId: payload.roomTypeId,
    );
    return result;
  }
}
