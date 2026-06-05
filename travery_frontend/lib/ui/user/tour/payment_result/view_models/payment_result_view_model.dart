import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/api/model/booking/create_tour_booking_response/create_tour_booking_response.dart';
import 'package:travery_frontend/data/services/tour/tour_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

enum PaymentConfirmState {
  waitingDeeplink,

  confirming,

  confirmed,

  failed,

  processingTimeout,
}

class PaymentResultViewModel extends ChangeNotifier {
  PaymentResultViewModel({required TourService tourService})
    : _tourService = tourService;

  final TourService _tourService;

  PaymentConfirmState _state = PaymentConfirmState.waitingDeeplink;
  PaymentConfirmState get state => _state;

  TourBookingData? _bookingData;
  TourBookingData? get bookingData => _bookingData;

  String? _deeplinkStatus;
  String? _responseCode;
  String? _bookingId;
  String? get responseCode => _responseCode;

  void initState({
    String? txnRef,
    String? deeplinkStatus,
    String? responseCode,
    String? bookingId,
  }) {
    if (deeplinkStatus != null) _deeplinkStatus = deeplinkStatus;
    if (responseCode != null) _responseCode = responseCode;
    if (bookingId != null) _bookingId = bookingId;

    if (_responseCode == '00' || _deeplinkStatus == 'success') {
      _state = PaymentConfirmState.confirming;
      notifyListeners();
      _pollBookingStatus();
    } else if (_deeplinkStatus == 'failed' || _responseCode != null) {
      _state = PaymentConfirmState.failed;
      notifyListeners();
    } else {
      _state = PaymentConfirmState.waitingDeeplink;
      notifyListeners();
    }
  }

  void checkManually() {
    if (_bookingId == null) {
      _state = PaymentConfirmState.processingTimeout;
      notifyListeners();
      return;
    }
    _state = PaymentConfirmState.confirming;
    notifyListeners();
    _pollBookingStatus();
  }

  Future<void> _pollBookingStatus() async {
    if (_bookingId == null) {
      _state = PaymentConfirmState.processingTimeout;
      notifyListeners();
      return;
    }

    const maxAttempts = 8;
    const delays = [5, 5, 10, 10, 15, 15, 20, 20];

    for (int i = 0; i < maxAttempts; i++) {
      await Future.delayed(Duration(seconds: delays[i]));

      final result = await _tourService.getBookingDetail(_bookingId!);

      switch (result) {
        case Ok(value: final data):
          _bookingData = data;

          if (data.paymentStatus == 'PAID' || data.status == 'PAID') {
            _state = PaymentConfirmState.confirmed;
            notifyListeners();
            return;
          } else if (data.status == 'CANCELLED') {
            _state = PaymentConfirmState.failed;
            notifyListeners();
            return;
          }
        case Error():
          continue;
      }
    }

    _state = PaymentConfirmState.processingTimeout;
    notifyListeners();
  }

  Future<void> retryPolling() async {
    _state = PaymentConfirmState.confirming;
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
