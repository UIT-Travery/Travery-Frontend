import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/trip/trip_booking_data.dart';
import 'package:travery_frontend/data/models/trip/trip_search_item.dart';
import 'package:travery_frontend/data/models/trip/trip_seat_data.dart';
import 'package:travery_frontend/data/models/trip/destination_data.dart';
import 'package:travery_frontend/data/services/trip/trip_service.dart';
import 'package:travery_frontend/data/services/api/model/trip/create_trip_booking_request/create_trip_booking_request.dart';
import 'package:travery_frontend/utils/core_result.dart';

class TripBookingReviewViewModel extends ChangeNotifier {
  TripBookingReviewViewModel({required TripService tripService})
    : _tripService = tripService;

  final TripService _tripService;

  TripSearchItem? _trip;
  TripSearchItem? get trip => _trip;

  List<SeatItem> _selectedSeats = [];
  List<SeatItem> get selectedSeats => _selectedSeats;

  String _contactName = '';
  String get contactName => _contactName;

  String _contactPhone = '';
  String get contactPhone => _contactPhone;

  StationData? _originStation;
  StationData? get originStation => _originStation;

  StationData? _destinationStation;
  StationData? get destinationStation => _destinationStation;

  double get totalPrice => _selectedSeats.length * (_trip?.basePrice ?? 0);

  bool get isLoading => _isCreatingBooking || _isCreatingPayment;

  TripBookingData? _bookingData;
  TripBookingData? get bookingData => _bookingData;

  bool _isCreatingBooking = false;
  bool get isCreatingBooking => _isCreatingBooking;

  bool _isCreatingPayment = false;
  bool get isCreatingPayment => _isCreatingPayment;

  String? _error;
  String? get error => _error;

  void setBookingData({
    required TripSearchItem trip,
    required List<SeatItem> seats,
    required String contactName,
    required String contactPhone,
    StationData? originStation,
    StationData? destinationStation,
  }) {
    _trip = trip;
    _selectedSeats = seats;
    _contactName = contactName;
    _contactPhone = contactPhone;
    _originStation = originStation;
    _destinationStation = destinationStation;
    _bookingData = null;
    _error = null;
    notifyListeners();
  }

  Future<TripBookingData?> createBooking() async {
    if (_trip == null || _selectedSeats.isEmpty) return null;

    _isCreatingBooking = true;
    _error = null;
    notifyListeners();

    final request = CreateTripBookingRequest(
      tripId: _trip!.id,
      seatLayoutItemIds: _selectedSeats.map((s) => s.seatLayoutItemId).toList(),
      contactName: _contactName,
      contactPhone: _contactPhone,
    );

    final result = await _tripService.createTripBooking(request);

    switch (result) {
      case Ok(value: final data):
        _bookingData = data;
        _isCreatingBooking = false;
        notifyListeners();
        return data;
      case Error(error: final e):
        _error = e.toString();
        _isCreatingBooking = false;
        notifyListeners();
        return null;
    }
  }

  Future<TripPaymentData?> createPayment() async {
    if (_bookingData == null) return null;

    _isCreatingPayment = true;
    _error = null;
    notifyListeners();

    final result = await _tripService.createTripPayment(_bookingData!.id);

    switch (result) {
      case Ok(value: final data):
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

  void reset() {
    _trip = null;
    _selectedSeats = [];
    _contactName = '';
    _contactPhone = '';
    _bookingData = null;
    _isCreatingBooking = false;
    _isCreatingPayment = false;
    _error = null;
    notifyListeners();
  }
}
