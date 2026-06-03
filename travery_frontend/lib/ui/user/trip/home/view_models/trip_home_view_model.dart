import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/trip/destination_data.dart';
import 'package:travery_frontend/data/services/trip/trip_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class TripHomeViewModel extends ChangeNotifier {
  TripHomeViewModel({required TripService tripService})
    : _tripService = tripService;

  final TripService _tripService;

  List<StationData> _stations = [];
  List<StationData> get stations => _stations;

  List<DestinationData> _origins = [];
  List<DestinationData> get origins => _origins;

  List<DestinationData> _destinations = [];
  List<DestinationData> get destinations => _destinations;

  DestinationData? _selectedOrigin;
  DestinationData? get selectedOrigin => _selectedOrigin;

  DestinationData? _selectedDestination;
  DestinationData? get selectedDestination => _selectedDestination;

  StationData? _selectedOriginStation;
  StationData? get selectedOriginStation => _selectedOriginStation;

  StationData? _selectedDestinationStation;
  StationData? get selectedDestinationStation => _selectedDestinationStation;

  DateTime _departureDate = DateTime.now().add(const Duration(days: 1));
  DateTime get departureDate => _departureDate;

  bool _isLoadingStations = false;
  bool get isLoadingStations => _isLoadingStations;

  String? _error;
  String? get error => _error;

  Future<void> loadStations() async {
    _isLoadingStations = true;
    _error = null;
    notifyListeners();

    final result = await _tripService.getStations();

    switch (result) {
      case Ok(value: final data):
        _stations = data;
        _buildDestinationsFromStations();
      case Error(error: final e):
        _error = e.toString();
    }

    _isLoadingStations = false;
    notifyListeners();
  }

  void _buildDestinationsFromStations() {
    final destinationMap = <String, DestinationData>{};
    for (final station in _stations) {
      if (!destinationMap.containsKey(station.destinationId)) {
        destinationMap[station.destinationId] = DestinationData(
          id: station.destinationId,
          name: station.destinationName,
          code: '',
          stations: _stations
              .where((s) => s.destinationId == station.destinationId)
              .toList(),
        );
      }
    }
    _destinations = destinationMap.values.toList();
    _origins = List.from(_destinations);
  }

  void selectOrigin(DestinationData origin) {
    _selectedOrigin = origin;
    _selectedOriginStation = origin.stations.isNotEmpty
        ? origin.stations.first
        : null;
    notifyListeners();
  }

  void selectDestination(DestinationData destination) {
    _selectedDestination = destination;
    _selectedDestinationStation = destination.stations.isNotEmpty
        ? destination.stations.first
        : null;
    notifyListeners();
  }

  void selectOriginStation(StationData station) {
    _selectedOriginStation = station;
    notifyListeners();
  }

  void selectDestinationStation(StationData station) {
    _selectedDestinationStation = station;
    notifyListeners();
  }

  void setDepartureDate(DateTime date) {
    _departureDate = date;
    notifyListeners();
  }

  void swapOriginDestination() {
    final tempOrigin = _selectedOrigin;
    final tempOriginStation = _selectedOriginStation;
    _selectedOrigin = _selectedDestination;
    _selectedOriginStation = _selectedDestinationStation;
    _selectedDestination = tempOrigin;
    _selectedDestinationStation = tempOriginStation;
    notifyListeners();
  }

  Future<Result<List<DestinationData>>> searchDestinations(
    String keyword,
  ) async {
    return await _tripService.searchDestinations(keyword);
  }

  bool get canSearch =>
      _selectedOrigin != null &&
      _selectedDestination != null &&
      _selectedOriginStation != null &&
      _selectedDestinationStation != null;
}
