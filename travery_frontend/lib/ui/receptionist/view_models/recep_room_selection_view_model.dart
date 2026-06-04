import 'package:travery_frontend/data/repositories/receptionist/receptionist_repository.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/available_room_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class RecepRoomSelectionViewModel {
  final ReceptionistRepository _repository;

  List<AvailableRoomResponse> availableRooms = [];

  RecepRoomSelectionViewModel({required ReceptionistRepository repository})
      : _repository = repository {
    loadAvailableRooms = Command1<void, String>(_loadAvailableRooms);
  }

  late final Command1<void, String> loadAvailableRooms;

  Future<Result<void>> _loadAvailableRooms(String roomTypeId) async {
    final result = await _repository.getAvailableRooms(roomTypeId);
    switch (result) {
      case Ok<List<AvailableRoomResponse>>():
        availableRooms = result.value;
        return const Result.ok(null);
      case Error<List<AvailableRoomResponse>>():
        return Result.error(result.error);
    }
  }
}
