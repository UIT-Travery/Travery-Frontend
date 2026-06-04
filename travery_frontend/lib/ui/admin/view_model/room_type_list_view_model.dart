import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/services/api/model/hotel/room_type_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class RoomTypeListViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  RoomTypeListViewModel({required AdminRepository adminRepository})
      : _adminRepository = adminRepository {
    loadRoomTypes = Command1<List<RoomTypeResponse>, String>(_loadRoomTypes);
  }

  late final Command1<List<RoomTypeResponse>, String> loadRoomTypes;

  Future<Result<List<RoomTypeResponse>>> _loadRoomTypes(String hotelId) async {
    final result = await _adminRepository.getHotelRoomTypes(hotelId: hotelId);
    switch (result) {
      case Ok<List<dynamic>>():
        final list = result.value
            .map((e) => RoomTypeResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return Result.ok(list);
      case Error<List<dynamic>>():
        return Result.error(result.error);
    }
  }
}
