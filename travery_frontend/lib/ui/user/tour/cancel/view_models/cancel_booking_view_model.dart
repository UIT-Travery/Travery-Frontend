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

  String _bankName = '';
  String get bankName => _bankName;
  String? get bankNameError {
    if (_bankName.isEmpty) return null;
    if (!_isValidBankName(_bankName)) {
      return 'Tên ngân hàng không hợp lệ';
    }
    return null;
  }

  String _accountNumber = '';
  String get accountNumber => _accountNumber;
  String? get accountNumberError {
    if (_accountNumber.isEmpty) return null;
    if (!_isValidAccountNumber(_accountNumber)) {
      return 'Số tài khoản chỉ chứa chữ số';
    }
    if (_accountNumber.length < 6) {
      return 'Số tài khoản phải có ít nhất 6 chữ số';
    }
    return null;
  }

  String _accountHolderName = '';
  String get accountHolderName => _accountHolderName;
  String? get accountHolderNameError {
    if (_accountHolderName.isEmpty) return null;
    if (!_isValidHolderName(_accountHolderName)) {
      return 'Tên chủ tài khoản không hợp lệ';
    }
    return null;
  }

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

  bool get canSubmit {
    if (_reason.trim().length < 3) return false;
    return true;
  }

  bool canSubmitWithBank(String bookingStatus) {
    if (_reason.trim().length < 3) return false;
    if (bookingStatus == 'PAID') {
      return _bankName.trim().isNotEmpty &&
          _accountNumber.trim().isNotEmpty &&
          _accountHolderName.trim().isNotEmpty &&
          bankNameError == null &&
          accountNumberError == null &&
          accountHolderNameError == null;
    }
    return true;
  }

  static bool _isValidBankName(String value) {
    return RegExp(r"^[\p{L}\s0-9&.-]+$", unicode: true).hasMatch(value);
  }

  static bool _isValidAccountNumber(String value) {
    return RegExp(r'^[0-9]+$').hasMatch(value);
  }

  static bool _isValidHolderName(String value) {
    return RegExp(r"^[\p{L}\s]+$", unicode: true).hasMatch(value);
  }

  void setReason(String value) {
    _reason = value;
    notifyListeners();
  }

  void setBankName(String value) {
    _bankName = value;
    notifyListeners();
  }

  void setAccountNumber(String value) {
    _accountNumber = value;
    notifyListeners();
  }

  void setAccountHolderName(String value) {
    _accountHolderName = value;
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
      request: CancelBookingRequest(
        reason: _reason,
        bankName: _bankName,
        accountNumber: _accountNumber,
        accountHolderName: _accountHolderName,
      ),
    );

    switch (result) {
      case Ok(value: final data):
        _cancelData = data;
        _isCancelling = false;
        notifyListeners();
        return true;
      case Error(error: final e):
        final msg = e.toString();
        if (msg.startsWith('HttpException: ')) {
          _error = msg.substring('HttpException: '.length);
        } else {
          _error = msg;
        }
        _isCancelling = false;
        notifyListeners();
        return false;
    }
  }
}
