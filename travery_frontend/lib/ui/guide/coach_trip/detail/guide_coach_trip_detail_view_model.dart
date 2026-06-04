import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class GuideCoachTripDetailViewModel extends ChangeNotifier {
  GuideCoachTripDetailViewModel({required GuideMissionService missionService})
    : _missionService = missionService;

  final GuideMissionService _missionService;

  CoachTripDetail? _trip;
  CoachTripDetail? get trip => _trip;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isUpdating = false;
  bool get isUpdating => _isUpdating;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _actionError;
  String? get actionError => _actionError;

  Future<void> loadTrip(String tripId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final result = await _missionService.getCoachTripDetail(tripId);
    switch (result) {
      case Ok(:final value):
        _trip = value;
      case Error(:final error):
        _errorMessage = error.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> updateStatus(String status) async {
    final trip = _trip;
    if (trip == null) return false;

    _isUpdating = true;
    _actionError = null;
    notifyListeners();

    final result = await _missionService.updateCoachTripStatus(trip.id, status);
    switch (result) {
      case Ok(:final value):
        _trip = CoachTripDetail(
          id: value.id,
          departureTime: value.departureTime,
          arrivalTime: value.arrivalTime,
          status: value.status,
          routeId: value.routeId,
          originDestinationName: value.originDestinationName,
          destinationDestinationName: value.destinationDestinationName,
          basePrice: value.basePrice,
          coachId: value.coachId,
          coachLicensePlate: value.coachLicensePlate,
          coachType: value.coachType,
          driverId: value.driverId,
          driverName: value.driverName,
          driverPhone: value.driverPhone,
          totalSeats: value.totalSeats,
          availableSeats: value.availableSeats,
          bookingsCount: value.bookingsCount,
          passengersCount: value.passengersCount,
        );
        _isUpdating = false;
        notifyListeners();
        return true;
      case Error(:final error):
        _actionError = error.toString();
        _isUpdating = false;
        notifyListeners();
        return false;
    }
  }

  Future<Result<void>> updateStatusResult(String status) async {
    final trip = _trip;
    if (trip == null) {
      return Result.error(Exception('Không tìm thấy chuyến xe'));
    }

    _isUpdating = true;
    _actionError = null;
    notifyListeners();

    final result = await _missionService.updateCoachTripStatus(trip.id, status);
    switch (result) {
      case Ok(:final value):
        _trip = CoachTripDetail(
          id: value.id,
          departureTime: value.departureTime,
          arrivalTime: value.arrivalTime,
          status: value.status,
          routeId: value.routeId,
          originDestinationName: value.originDestinationName,
          destinationDestinationName: value.destinationDestinationName,
          basePrice: value.basePrice,
          coachId: value.coachId,
          coachLicensePlate: value.coachLicensePlate,
          coachType: value.coachType,
          driverId: value.driverId,
          driverName: value.driverName,
          driverPhone: value.driverPhone,
          totalSeats: value.totalSeats,
          availableSeats: value.availableSeats,
          bookingsCount: value.bookingsCount,
          passengersCount: value.passengersCount,
        );
        _isUpdating = false;
        notifyListeners();
        return const Result.ok(null);
      case Error(:final error):
        _actionError = error.toString();
        _isUpdating = false;
        notifyListeners();
        return Result.error(error);
    }
  }
}
