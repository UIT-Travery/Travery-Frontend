import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/trip/trip_booking_data.dart';
import 'package:travery_frontend/data/models/trip/cancel_trip_data.dart';
import 'package:travery_frontend/data/services/trip/trip_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class TripBookingDetailViewModel extends ChangeNotifier {
  TripBookingDetailViewModel({required TripService tripService})
    : _tripService = tripService;

  final TripService _tripService;

  TripBookingData? _bookingData;
  TripBookingData? get bookingData => _bookingData;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  bool _isCancelling = false;
  bool get isCancelling => _isCancelling;

  CancelTripData? _cancelData;
  CancelTripData? get cancelData => _cancelData;

  Future<void> loadBooking(String bookingId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _tripService.getTripBookingDetail(bookingId);

    switch (result) {
      case Ok(value: final data):
        _bookingData = data;
      case Error(error: final e):
        _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> cancelBooking(String bookingId, {String? reason}) async {
    _isCancelling = true;
    _error = null;
    notifyListeners();

    final result = await _tripService.cancelTripBooking(
      bookingId,
      reason: reason,
    );

    switch (result) {
      case Ok(value: final data):
        _cancelData = data;
        _isCancelling = false;
        notifyListeners();
        return true;
      case Error(error: final e):
        _error = e.toString();
        _isCancelling = false;
        notifyListeners();
        return false;
    }
  }
}
