import 'package:travery_frontend/data/repositories/receptionist/receptionist_repository.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_booking_detail_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/check_in_request.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/check_out_preview_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class RecepViewDetailBookingViewModel {
  final ReceptionistRepository _repository;

  RecepBookingDetailResponse? bookingDetail;
  CheckOutPreviewResponse? checkOutPreviewData;

  RecepViewDetailBookingViewModel({required ReceptionistRepository repository})
      : _repository = repository {
    loadBookingDetail = Command1<void, String>(_loadBookingDetail);
    checkIn = Command2<void, String, List<String>>(_checkIn);
    checkOutPreview = Command1<void, String>(_checkOutPreview);
    confirmCheckOut = Command1<void, String>(_confirmCheckOut);
  }

  late final Command1<void, String> loadBookingDetail;
  late final Command2<void, String, List<String>> checkIn;
  late final Command1<void, String> checkOutPreview;
  late final Command1<void, String> confirmCheckOut;

  Future<Result<void>> _loadBookingDetail(String bookingId) async {
    final result = await _repository.getBookingDetail(bookingId);
    switch (result) {
      case Ok<RecepBookingDetailResponse>():
        bookingDetail = result.value;
        return const Result.ok(null);
      case Error<RecepBookingDetailResponse>():
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _checkIn(String bookingId, List<String> roomIds) async {
    final request = CheckInRequest(roomIds: roomIds);
    final result = await _repository.checkIn(bookingId, request);
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _checkOutPreview(String bookingId) async {
    final result = await _repository.checkOutPreview(bookingId);
    switch (result) {
      case Ok<CheckOutPreviewResponse>():
        checkOutPreviewData = result.value;
        return const Result.ok(null);
      case Error<CheckOutPreviewResponse>():
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _confirmCheckOut(String bookingId) async {
    final result = await _repository.confirmCheckOut(bookingId);
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
