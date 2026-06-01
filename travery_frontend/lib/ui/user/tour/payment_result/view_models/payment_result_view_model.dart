import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/api/model/booking/create_tour_booking_response/create_tour_booking_response.dart';
import 'package:travery_frontend/data/services/tour/tour_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

enum PaymentConfirmState {
  /// User opened VNPAY but deeplink hasn't arrived yet
  waitingDeeplink,

  /// Deeplink received — polling booking status
  confirming,

  /// Booking confirmed PAID
  confirmed,

  /// Payment failed (deeplink failed or booking CANCELLED)
  failed,

  /// Polling timeout after ~45s
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

  String? _txnRef;
  String? _deeplinkStatus;
  String? _responseCode;
  String? _bookingId;
  String? get responseCode => _responseCode;

  /// Called when screen receives data (from route extra or from deeplink stream).
  void initState({
    String? txnRef,
    String? deeplinkStatus,
    String? responseCode,
    String? bookingId,
  }) {
    // Update values if provided (non-null)
    if (txnRef != null) _txnRef = txnRef;
    if (deeplinkStatus != null) _deeplinkStatus = deeplinkStatus;
    if (responseCode != null) _responseCode = responseCode;
    if (bookingId != null) _bookingId = bookingId;

    // VNPay returned 00 → start polling to check booking status
    if (_responseCode == '00' || _deeplinkStatus == 'success') {
      _state = PaymentConfirmState.confirming;
      notifyListeners();
      _pollBookingStatus();
    } else if (_deeplinkStatus == 'failed' || _responseCode != null) {
      // VNPay returned non-00 code = failed
      _state = PaymentConfirmState.failed;
      notifyListeners();
    } else {
      // No deeplink yet (user opened from VNPayPaymentScreen)
      _state = PaymentConfirmState.waitingDeeplink;
      notifyListeners();
    }
  }

  /// User manually taps "Đã thanh toán — Kiểm tra ngay"
  /// Uses the bookingId from route extra to start polling.
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
    const delays = [5, 5, 10, 10, 15, 15, 20, 20]; // ~100s total

    for (int i = 0; i < maxAttempts; i++) {
      await Future.delayed(Duration(seconds: delays[i]));

      final result = await _tourService.getBookingDetail(_bookingId!);

      switch (result) {
        case Ok(value: final data):
          _bookingData = data;
          // Check paymentStatus (PENDING/PAID) or status (PAID)
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
