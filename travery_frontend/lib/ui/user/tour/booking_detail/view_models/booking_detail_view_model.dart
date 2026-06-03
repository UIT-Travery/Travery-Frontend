import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/seed_models/booking_detail/booking_detail_model.dart';
import 'package:travery_frontend/data/services/api/model/booking/create_payment_response/create_payment_response.dart';
import 'package:travery_frontend/data/services/booking/booking_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class BookingDetailViewModel extends ChangeNotifier {
  BookingDetailViewModel({required BookingService bookingService})
    : _bookingService = bookingService;

  final BookingService _bookingService;

  BookingDetailModel? _bookingDetail;
  BookingDetailModel? get bookingDetail => _bookingDetail;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  PaymentResponseData? _paymentData;
  PaymentResponseData? get paymentData => _paymentData;

  bool _isCreatingPayment = false;
  bool get isCreatingPayment => _isCreatingPayment;

  Future<void> loadBookingDetail(String bookingId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _bookingService.getBookingDetail(bookingId);

    switch (result) {
      case Ok(value: final data):
        _bookingDetail = data;
      case Error(error: final e):
        _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<PaymentResponseData?> createPayment(String bookingId) async {
    _isCreatingPayment = true;
    _error = null;
    notifyListeners();

    final result = await _bookingService.createPayment(bookingId);

    switch (result) {
      case Ok(value: final data):
        _paymentData = data;
        _isCreatingPayment = false;
        notifyListeners();
        return data;
      case Error(error: final e):
        _error = e.toString();
        _isCreatingPayment = false;
        notifyListeners();
        return null;
    }
  }

  Future<void> refreshBookingDetail() async {
    if (_bookingDetail != null) {
      await loadBookingDetail(_bookingDetail!.id);
    }
  }
}
