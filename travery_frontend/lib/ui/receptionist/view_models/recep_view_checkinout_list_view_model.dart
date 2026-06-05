import 'package:travery_frontend/data/repositories/receptionist/receptionist_repository.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_booking_list_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class RecepViewCheckinoutListViewModel {
  final ReceptionistRepository _repository;

  List<RecepBookingListResponse> bookings = [];

  RecepViewCheckinoutListViewModel({required ReceptionistRepository repository})
      : _repository = repository {
    loadBookings = Command1<void, String?>(_loadBookings);
  }

  late final Command1<void, String?> loadBookings;

  Future<Result<void>> _loadBookings(String? status) async {
    final result = await _repository.getBookings(status: status);
    switch (result) {
      case Ok<List<RecepBookingListResponse>>():
        bookings = result.value;
        return const Result.ok(null);
      case Error<List<RecepBookingListResponse>>():
        return Result.error(result.error);
    }
  }
}
