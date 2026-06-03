import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/api/model/booking/cancel_booking_request/cancel_booking_request.dart';
import 'package:travery_frontend/data/services/api/model/booking/cancel_booking_response/cancel_booking_response.dart';
import 'package:travery_frontend/data/services/booking/booking_service.dart';
import 'package:travery_frontend/data/seed_models/booking_detail/booking_detail_model.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CancelBookingViewModel extends ChangeNotifier {
  CancelBookingViewModel({required BookingService bookingService})
    : _bookingService = bookingService;

  final BookingService _bookingService;

  String _reason = '';
  String get reason => _reason;

  bool _isCancelling = false;
  bool get isCancelling => _isCancelling;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  CancelData? _cancelData;
  CancelData? get cancelData => _cancelData;

  BookingDetailModel? _bookingDetail;
  BookingDetailModel? get bookingDetail => _bookingDetail;

  bool get canSubmit => _reason.trim().length >= 3;

  void setReason(String value) {
    _reason = value;
    notifyListeners();
  }

  Future<void> loadBookingDetail(String bookingId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _bookingService.getBookingDetail(bookingId);
    switch (result) {
      case Ok(value: final data):
        _bookingDetail = data;
        _isLoading = false;
        notifyListeners();
      case Error(error: final e):
        _error = e.toString();
        _isLoading = false;
        notifyListeners();
    }
  }

  Future<bool> submitCancellation(String bookingId) async {
    if (bookingId.isEmpty) {
      _error = 'Không tìm thấy mã booking';
      notifyListeners();
      return false;
    }

    if (!canSubmit) {
      _error = 'Vui lòng nhập lý do hủy';
      notifyListeners();
      return false;
    }

    _isCancelling = true;
    _error = null;
    notifyListeners();

    final result = await _bookingService.cancelBooking(
      bookingId: bookingId,
      request: CancelBookingRequest(reason: _reason),
    );

    switch (result) {
      case Ok(value: final data):
        _cancelData = data;
        _isCancelling = false;
        notifyListeners();
        return true;
      case Error(error: final e):
        _error = 'Không thể hủy tour: ${e.toString()}';
        _isCancelling = false;
        notifyListeners();
        return false;
    }
  }
}
