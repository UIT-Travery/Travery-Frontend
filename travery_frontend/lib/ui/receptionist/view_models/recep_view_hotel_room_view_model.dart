import 'package:travery_frontend/data/repositories/receptionist/receptionist_repository.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_room_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class RecepViewHotelRoomViewModel {
  final ReceptionistRepository _repository;

  List<RecepRoomResponse> rooms = [];

  RecepViewHotelRoomViewModel({required ReceptionistRepository repository})
      : _repository = repository {
    loadRooms = Command0<void>(_loadRooms);
    updateRoomStatus = Command2<void, String, String>(_updateRoomStatus);
  }

  late final Command0<void> loadRooms;
  late final Command2<void, String, String> updateRoomStatus;

  Future<Result<void>> _loadRooms() async {
    final result = await _repository.getRooms();
    switch (result) {
      case Ok<List<RecepRoomResponse>>():
        rooms = result.value;
        return const Result.ok(null);
      case Error<List<RecepRoomResponse>>():
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _updateRoomStatus(String roomId, String status) async {
    final result = await _repository.updateRoomStatus(roomId, status);
    if (result is Ok) {
      await _loadRooms();
    }
    return result;
  }
}
