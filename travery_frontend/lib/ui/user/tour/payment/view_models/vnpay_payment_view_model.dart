import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/tour/tour_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

enum CheckResult { paid, pending, failed, error }

class PaymentData {
  final String paymentUrl;
  final String transactionId;
  final double amount;
  final String? expiresAt;

  PaymentData({
    required this.paymentUrl,
    required this.transactionId,
    required this.amount,
    this.expiresAt,
  });
}

class VNPayPaymentViewModel extends ChangeNotifier {
  VNPayPaymentViewModel({required TourService tourService})
    : _tourService = tourService;

  final TourService _tourService;

  bool _isCreatingPayment = false;
  bool get isCreatingPayment => _isCreatingPayment;

  String? _error;
  String? get error => _error;

  Future<String?> createPaymentUrl(String bookingId) async {
    _isCreatingPayment = true;
    _error = null;
    notifyListeners();

    final result = await _tourService.createPayment(bookingId);

    switch (result) {
      case Ok(value: final data):
        _isCreatingPayment = false;
        notifyListeners();
        return data.paymentUrl;
      case Error(error: final e):
        _error = e.toString();
        _isCreatingPayment = false;
        notifyListeners();
        return null;
    }
  }

  Future<PaymentData?> createPaymentData(String bookingId) async {
    _isCreatingPayment = true;
    _error = null;
    notifyListeners();

    final result = await _tourService.createPayment(bookingId);

    switch (result) {
      case Ok(value: final data):
        _isCreatingPayment = false;
        notifyListeners();
        return PaymentData(
          paymentUrl: data.paymentUrl,
          transactionId: data.transactionId,
          amount: data.amount,
          expiresAt: data.expiresAt,
        );
      case Error(error: final e):
        _error = e.toString();
        _isCreatingPayment = false;
        notifyListeners();
        return null;
    }
  }

  Future<CheckResult> checkBookingStatus(String bookingId) async {
    final result = await _tourService.getBookingDetail(bookingId);

    switch (result) {
      case Ok(value: final data):
        if (data.status == 'PAID' ||
            data.status == 'Đã thanh toán' ||
            data.paymentStatus == 'PAID') {
          return CheckResult.paid;
        } else if (data.status == 'CANCELLED' || data.status == 'Đã hủy') {
          return CheckResult.failed;
        }
        return CheckResult.pending;
      case Error():
        return CheckResult.error;
    }
  }
}
