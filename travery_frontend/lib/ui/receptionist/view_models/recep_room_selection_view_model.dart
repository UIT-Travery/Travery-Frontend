import 'package:travery_frontend/data/repositories/receptionist/receptionist_repository.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/available_room_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class RecepRoomSelectionViewModel {
  final ReceptionistRepository _repository;

  Map<String, List<AvailableRoomResponse>> availableRoomsMap = {};

  RecepRoomSelectionViewModel({required ReceptionistRepository repository})
      : _repository = repository {
    loadAvailableRooms = Command1<void, List<String>>(_loadAvailableRooms);
  }

  late final Command1<void, List<String>> loadAvailableRooms;

  Future<Result<void>> _loadAvailableRooms(List<String> roomTypeIds) async {
    availableRoomsMap.clear();
    for (final id in roomTypeIds) {
      final result = await _repository.getAvailableRooms(id);
      switch (result) {
        case Ok<List<AvailableRoomResponse>>():
          availableRoomsMap[id] = result.value;
          break;
        case Error<List<AvailableRoomResponse>>():
          return Result.error(result.error);
      }
    }
    return const Result.ok(null);
  }
}

