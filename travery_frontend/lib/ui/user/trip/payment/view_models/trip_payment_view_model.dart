import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/trip/trip_booking_data.dart';
import 'package:travery_frontend/data/services/trip/trip_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class TripPaymentViewModel extends ChangeNotifier {
  TripPaymentViewModel({required TripService tripService})
    : _tripService = tripService;

  final TripService _tripService;

  TripBookingData? _bookingData;
  TripBookingData? get bookingData => _bookingData;

  TripPaymentData? _paymentData;
  TripPaymentData? get paymentData => _paymentData;

  String? _bookingId;
  String? get bookingId => _bookingId;

  bool _isCreating = false;
  bool get isCreating => _isCreating;

  String? _error;
  String? get error => _error;

  Future<TripPaymentData?> createPayment(String bookingId) async {
    _isCreating = true;
    _error = null;
    _bookingId = bookingId;
    notifyListeners();

    final result = await _tripService.createTripPayment(bookingId);

    switch (result) {
      case Ok(value: final data):
        _paymentData = data;
        _isCreating = false;
        notifyListeners();
        return data;
      case Error(error: final e):
        _error = e.toString();
        _isCreating = false;
        notifyListeners();
        return null;
    }
  }

  Future<TripBookingData?> checkBookingStatus(String bookingId) async {
    final result = await _tripService.getTripBookingDetail(bookingId);
    switch (result) {
      case Ok(value: final data):
        _bookingData = data;
        notifyListeners();
        return data;
      case Error():
        return null;
    }
  }

  Future<TripBookingData?> refreshBooking() async {
    if (_bookingId == null) return null;
    return await checkBookingStatus(_bookingId!);
  }
}
