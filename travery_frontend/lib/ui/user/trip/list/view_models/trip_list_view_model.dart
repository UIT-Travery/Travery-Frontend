import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/trip/trip_search_item.dart';
import 'package:travery_frontend/data/models/trip/destination_data.dart';
import 'package:travery_frontend/data/services/trip/trip_service.dart';
import 'package:travery_frontend/data/services/api/model/trip/search_trip_request/search_trip_request.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// 0 = all, -1 = low to high, 1 = high to low
class TripListViewModel extends ChangeNotifier {
  TripListViewModel({required TripService tripService})
    : _tripService = tripService;

  final TripService _tripService;

  List<TripSearchItem> _trips = [];
  List<TripSearchItem> get trips => _trips;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  CoachType? _selectedCoachType;
  CoachType? get selectedCoachType => _selectedCoachType;

  TimeSlot? _selectedTimeSlot;
  TimeSlot? get selectedTimeSlot => _selectedTimeSlot;

  /// 0 = all, -1 = low to high, 1 = high to low
  int _priceSort = 0;
  int get priceSort => _priceSort;

  DestinationData? _origin;
  DestinationData? get origin => _origin;

  DestinationData? _destination;
  DestinationData? get destination => _destination;

  StationData? _originStation;
  StationData? get originStation => _originStation;

  StationData? _destinationStation;
  StationData? get destinationStation => _destinationStation;

  DateTime? _departureDate;
  DateTime? get departureDate => _departureDate;

  DateTime? _initDepartureDate;
  DateTime? get initDepartureDate => _initDepartureDate;

  void setSearchParams({
    required DestinationData origin,
    required DestinationData destination,
    required DateTime departureDate,
    StationData? originStation,
    StationData? destinationStation,
  }) {
    _origin = origin;
    _destination = destination;
    _departureDate = departureDate;
    _initDepartureDate = departureDate;
    _originStation = originStation;
    _destinationStation = destinationStation;
    _trips = [];
    _selectedCoachType = null;
    _selectedTimeSlot = null;
    _priceSort = 0;
    notifyListeners();
  }

  void setDepartureDate(DateTime date) {
    if (_departureDate == null ||
        _departureDate!.year != date.year ||
        _departureDate!.month != date.month ||
        _departureDate!.day != date.day) {
      _departureDate = date;
      notifyListeners();
      _searchTrips();
    }
  }

  void setCoachType(CoachType? type) {
    _selectedCoachType = type;
    notifyListeners();
    _searchTrips();
  }

  void setTimeSlot(TimeSlot? slot) {
    _selectedTimeSlot = slot;
    notifyListeners();
    _searchTrips();
  }

  void setPriceSort(int value) {
    _priceSort = value;
    notifyListeners();
    _searchTrips();
  }

  void resetCoachType() {
    _selectedCoachType = null;
    notifyListeners();
    _searchTrips();
  }

  void resetTimeSlot() {
    _selectedTimeSlot = null;
    notifyListeners();
    _searchTrips();
  }

  void resetPriceSort() {
    _priceSort = 0;
    notifyListeners();
    _searchTrips();
  }

  Future<void> _searchTrips() async {
    if (_origin == null || _destination == null || _departureDate == null)
      return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    final request = SearchTripRequest(
      originId: _origin!.id,
      destinationId: _destination!.id,
      departureDate: _departureDate!.toIso8601String().split('T').first,
      coachType: _selectedCoachType?.value,
      departureTimeSlot: _selectedTimeSlot?.value,
      sortByPriceAsc: _priceSort == -1
          ? true
          : (_priceSort == 1 ? false : null),
    );

    final result = await _tripService.searchTrips(request);

    switch (result) {
      case Ok(value: final data):
        _trips = data;
      case Error(error: final e):
        _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> search() async {
    await _searchTrips();
  }
}
