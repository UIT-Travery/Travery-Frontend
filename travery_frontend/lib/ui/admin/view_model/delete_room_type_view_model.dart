import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class DeleteRoomTypeViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  DeleteRoomTypeViewModel({required AdminRepository adminRepository})
      : _adminRepository = adminRepository {
    deleteRoomType = Command1<void, String>(_deleteRoomType);
  }

  late final Command1<void, String> deleteRoomType;

  Future<Result<void>> _deleteRoomType(String roomTypeId) async {
    final result = await _adminRepository.deleteHotelRoomType(
      roomTypeId: roomTypeId,
    );
    switch (result) {
      case Ok<void>():
        return Result.ok(result.value);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
