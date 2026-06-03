import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/trip/trip_seat_data.dart';
import 'package:travery_frontend/data/models/trip/trip_search_item.dart';
import 'package:travery_frontend/data/services/trip/trip_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class SeatPickerViewModel extends ChangeNotifier {
  SeatPickerViewModel({required TripService tripService})
    : _tripService = tripService;

  final TripService _tripService;

  TripSearchItem? _trip;
  TripSearchItem? get trip => _trip;

  TripSeatData? _seatData;
  TripSeatData? get seatData => _seatData;

  List<SeatItem> _selectedSeats = [];
  List<SeatItem> get selectedSeats => _selectedSeats;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  int _activeDeck = 0;
  int get activeDeck => _activeDeck;

  void setTrip(TripSearchItem trip) {
    _trip = trip;
    _selectedSeats = [];
    _activeDeck = 0;
    notifyListeners();
  }

  void setActiveDeck(int index) {
    _activeDeck = index;
    notifyListeners();
  }

  Future<void> loadSeats() async {
    if (_trip == null) return;

    _isLoading = true;
    _error = null;
    _selectedSeats = [];
    notifyListeners();

    final result = await _tripService.getTripSeats(_trip!.id);

    switch (result) {
      case Ok(value: final data):
        _seatData = data;
      case Error(error: final e):
        _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  void toggleSeat(SeatItem seat) {
    if (!seat.isAvailable) return;

    final index = _selectedSeats.indexWhere(
      (s) => s.seatLayoutItemId == seat.seatLayoutItemId,
    );
    if (index >= 0) {
      _selectedSeats.removeAt(index);
    } else {
      _selectedSeats.add(seat);
    }
    notifyListeners();
  }

  bool isSeatSelected(SeatItem seat) {
    return _selectedSeats.any(
      (s) => s.seatLayoutItemId == seat.seatLayoutItemId,
    );
  }

  List<SeatItem> get seatsForActiveDeck {
    if (_seatData == null) return [];
    if (_seatData!.isDoubleDecker) {
      return _seatData!.seats.where((s) {
        if (_activeDeck == 0) return !s.isUpperTier;
        return s.isUpperTier;
      }).toList();
    }
    return _seatData!.seats;
  }

  List<SeatItem> get seatsForLowerDeck {
    if (_seatData == null) return [];
    return _seatData!.seats.where((s) => !s.isUpperTier).toList();
  }

  List<SeatItem> get seatsForUpperDeck {
    if (_seatData == null) return [];
    return _seatData!.seats.where((s) => s.isUpperTier).toList();
  }

  int get upperDeckSeatCount {
    if (_seatData == null) return 0;
    return _seatData!.seats.where((s) => s.isUpperTier).length;
  }

  int get lowerDeckSeatCount {
    if (_seatData == null) return 0;
    return _seatData!.seats.where((s) => !s.isUpperTier).length;
  }

  double get totalPrice {
    if (_trip == null || _seatData == null) return 0;
    return _selectedSeats.length * _trip!.basePrice;
  }

  void clearSelection() {
    _selectedSeats = [];
    notifyListeners();
  }
}
