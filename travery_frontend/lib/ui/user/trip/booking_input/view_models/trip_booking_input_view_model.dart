import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/trip/trip_seat_data.dart';
import 'package:travery_frontend/data/models/trip/trip_search_item.dart';
import 'package:travery_frontend/data/models/trip/destination_data.dart';

class TripBookingInputViewModel extends ChangeNotifier {
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

  double get totalPrice {
    if (_trip == null) return 0;
    return _selectedSeats.length * _trip!.basePrice;
  }

  void setTripAndSeats({
    required TripSearchItem trip,
    required List<SeatItem> seats,
    StationData? originStation,
    StationData? destinationStation,
  }) {
    _trip = trip;
    _selectedSeats = seats;
    _contactName = '';
    _contactPhone = '';
    _originStation = originStation;
    _destinationStation = destinationStation;
    notifyListeners();
  }

  void setContactName(String name) {
    _contactName = name;
    notifyListeners();
  }

  void setContactPhone(String phone) {
    _contactPhone = phone;
    notifyListeners();
  }
}
