import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/trip/trip_booking_data.dart';
import 'package:travery_frontend/data/services/trip/trip_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

enum TripPaymentConfirmState {
  waitingDeeplink,
  confirming,
  confirmed,
  failed,
  processingTimeout,
}

class TripPaymentResultViewModel extends ChangeNotifier {
  TripPaymentResultViewModel({required TripService tripService})
    : _tripService = tripService;

  final TripService _tripService;

  TripPaymentConfirmState _state = TripPaymentConfirmState.waitingDeeplink;
  TripPaymentConfirmState get state => _state;

  TripBookingData? _bookingData;
  TripBookingData? get bookingData => _bookingData;

  String? get transactionId => _bookingData?.payment?.transactionId;

  String? _txnRef;
  String? _deeplinkStatus;
  String? _responseCode;
  String? _bookingId;

  void initState({
    String? txnRef,
    String? deeplinkStatus,
    String? responseCode,
    String? bookingId,
  }) {
    if (txnRef != null) _txnRef = txnRef;
    if (deeplinkStatus != null) _deeplinkStatus = deeplinkStatus;
    if (responseCode != null) _responseCode = responseCode;
    if (bookingId != null) _bookingId = bookingId;

    if (_responseCode == '00' || _deeplinkStatus == 'success') {
      _state = TripPaymentConfirmState.confirming;
      notifyListeners();
      _pollBookingStatus();
    } else if (_deeplinkStatus == 'failed' || _responseCode != null) {
      _state = TripPaymentConfirmState.failed;
      notifyListeners();
    } else {
      _state = TripPaymentConfirmState.waitingDeeplink;
      notifyListeners();
    }
  }

  void checkManually() {
    if (_bookingId == null) {
      _state = TripPaymentConfirmState.processingTimeout;
      notifyListeners();
      return;
    }
    _state = TripPaymentConfirmState.confirming;
    notifyListeners();
    _pollBookingStatus();
  }

  Future<void> _pollBookingStatus() async {
    if (_bookingId == null) {
      _state = TripPaymentConfirmState.processingTimeout;
      notifyListeners();
      return;
    }

    const maxAttempts = 8;
    const delays = [5, 5, 10, 10, 15, 15, 20, 20];

    for (int i = 0; i < maxAttempts; i++) {
      await Future.delayed(Duration(seconds: delays[i]));

      final result = await _tripService.getTripBookingDetail(_bookingId!);
      switch (result) {
        case Ok(value: final data):
          _bookingData = data;
          if (data.paymentStatus == 'PAID' || data.status == 'PAID') {
            _state = TripPaymentConfirmState.confirmed;
            notifyListeners();
            return;
          } else if (data.status == 'CANCELLED') {
            _state = TripPaymentConfirmState.failed;
            notifyListeners();
            return;
          }
        case Error():
          continue;
      }
    }

    _state = TripPaymentConfirmState.processingTimeout;
    notifyListeners();
  }

  Future<void> retryPolling() async {
    _state = TripPaymentConfirmState.confirming;
    notifyListeners();
    await _pollBookingStatus();
  }

  String getErrorMessage() {
    switch (_responseCode) {
      case '24':
        return 'Bạn đã hủy giao dịch';
      case '51':
        return 'Tài khoản không đủ số dư';
      case '65':
        return 'Vượt hạn mức thanh toán trong ngày';
      case '75':
        return 'Ngân hàng đang bảo trì';
      case null:
        return 'Giao dịch không thành công';
      default:
        return 'Giao dịch không thành công (mã: $_responseCode)';
    }
  }
}
