import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/trip/trip_booking_data.dart';
import 'package:travery_frontend/data/services/trip/trip_booking_repository.dart';
import 'package:travery_frontend/utils/core_result.dart';

class MyTripBookingViewModel extends ChangeNotifier {
  MyTripBookingViewModel({required TripBookingRepository repository})
    : _repository = repository;

  final TripBookingRepository _repository;

  List<TripBookingData> _bookings = [];
  List<TripBookingData> get bookings => _bookings;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  String _selectedStatus = allStatusFilter;
  String get selectedStatus => _selectedStatus;

  static const String allStatusFilter = 'Tất cả';
  static const List<String> _allStatuses = [
    allStatusFilter,
    'PENDING',
    'PAID',
    'CHECKED_IN',
    'CHECKED_OUT',
    'CANCELLED',
    'NO_SHOW',
  ];
  List<String> get statusFilters => _allStatuses;

  Future<void> loadBookings({String? status, bool refresh = false}) async {
    final nextStatus = _normalizeStatus(status);
    if (_isLoading) return;

    final shouldReset = refresh || nextStatus != _selectedStatus;

    if (shouldReset) {
      _bookings = [];
    }

    _selectedStatus = nextStatus;
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _repository.getMyBookings(
      status: _statusForApi(_selectedStatus),
    );

    switch (result) {
      case Ok(value: final data):
        _bookings = data;
      case Error(error: final e):
        _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  String _normalizeStatus(String? status) {
    if (status == null || status.isEmpty) {
      return _selectedStatus;
    }
    return status;
  }

  String? _statusForApi(String status) {
    return status == allStatusFilter ? null : status;
  }

  String getStatusLabel(String status) {
    switch (status) {
      case 'PAID':
        return 'Đã thanh toán';
      case 'CHECKED_IN':
        return 'Đã check-in';
      case 'CHECKED_OUT':
        return 'Đã check-out';
      case 'CANCELLED':
        return 'Đã hủy';
      case 'NO_SHOW':
        return 'Không đến';
      default:
        return 'Đang chờ';
    }
  }
}
