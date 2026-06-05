import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/ui/guide/utils/guide_error_message.dart';
import 'package:travery_frontend/utils/core_result.dart';

class GuideCoachTripPassengersViewModel extends ChangeNotifier {
  GuideCoachTripPassengersViewModel({
    required GuideMissionService missionService,
  }) : _missionService = missionService;

  final GuideMissionService _missionService;

  CoachTripDetail? _trip;
  CoachTripDetail? get trip => _trip;

  final List<CoachTripBooking> _bookings = [];
  List<CoachTripBooking> get bookings => List.unmodifiable(_bookings);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isActing = false;
  bool get isActing => _isActing;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _actionError;
  String? get actionError => _actionError;

  int get totalCount => _bookings.length;
  int get checkedInCount =>
      _bookings.where((booking) => booking.isCheckedIn).length;
  int get noShowCount => _bookings.where((booking) => booking.isNoShow).length;
  int get pendingCount =>
      _bookings.where((booking) => booking.isPending).length;
  bool get isTripEditable {
    final status = _trip?.status.toUpperCase();
    return status != 'COMPLETED' && status != 'CANCELLED';
  }

  Future<void> load(String tripId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final detailResult = await _missionService.getCoachTripDetail(tripId);
    switch (detailResult) {
      case Ok(:final value):
        _trip = value;
      case Error():
        break;
    }

    final bookingsResult = await _missionService.getCoachTripBookings(tripId);
    switch (bookingsResult) {
      case Ok(:final value):
        _bookings
          ..clear()
          ..addAll(value);
      case Error(:final error):
        _errorMessage = guideFriendlyErrorMessage(
          error,
          fallback: 'Không tải được danh sách hành khách. Vui lòng thử lại.',
        );
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> checkIn(String tripId, String bookingId) async {
    return _runBookingAction(
      () => _missionService.checkInCoachPassenger(tripId, bookingId),
      tripId,
    );
  }

  Future<bool> noShow(String tripId, String bookingId) async {
    return _runBookingAction(
      () => _missionService.markPassengerNoShow(tripId, bookingId),
      tripId,
    );
  }

  Future<bool> _runBookingAction(
    Future<Result<void>> Function() action,
    String tripId,
  ) async {
    _isActing = true;
    _actionError = null;
    notifyListeners();

    final result = await action();
    switch (result) {
      case Ok():
        await _reloadBookings(tripId);
        _isActing = false;
        notifyListeners();
        return true;
      case Error(:final error):
        _actionError = guideFriendlyErrorMessage(
          error,
          fallback: 'Không cập nhật được điểm danh. Vui lòng thử lại.',
        );
        _isActing = false;
        notifyListeners();
        return false;
    }
  }

  Future<void> _reloadBookings(String tripId) async {
    final result = await _missionService.getCoachTripBookings(tripId);
    switch (result) {
      case Ok(:final value):
        _bookings
          ..clear()
          ..addAll(value);
      case Error(:final error):
        _actionError = guideFriendlyErrorMessage(
          error,
          fallback: 'Đã cập nhật nhưng chưa tải lại được danh sách.',
        );
    }
  }
}
