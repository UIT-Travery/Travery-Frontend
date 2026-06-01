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

  String? _selectedStatus;
  String? get selectedStatus => _selectedStatus;

  static const List<String> _allStatuses = [
    'Tất cả',
    'PENDING',
    'PAID',
    'CANCELLED',
  ];
  List<String> get statusFilters => _allStatuses;

  Future<void> loadBookings({String? status, bool refresh = false}) async {
    if (refresh) {
      _bookings = [];
    }
    _selectedStatus = status ?? 'Tất cả';
    _isLoading = true;
    _error = null;
    notifyListeners();

    final apiStatus = _selectedStatus == 'Tất cả' ? null : _selectedStatus;
    final result = await _repository.getMyBookings(status: apiStatus);

    switch (result) {
      case Ok(value: final data):
        _bookings = data;
      case Error(error: final e):
        _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  String getStatusLabel(String status) {
    switch (status) {
      case 'PAID':
        return 'Đã thanh toán';
      case 'CANCELLED':
        return 'Đã hủy';
      case 'CHECKED_IN':
        return 'Đã check-in';
      default:
        return 'Đang chờ';
    }
  }
}
