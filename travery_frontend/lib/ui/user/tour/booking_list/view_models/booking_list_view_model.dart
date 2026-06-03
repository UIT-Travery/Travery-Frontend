import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/api/model/booking/user_booking_list_response/user_booking_list_response.dart';
import 'package:travery_frontend/data/services/booking/booking_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class BookingListViewModel extends ChangeNotifier {
  BookingListViewModel({required BookingService bookingService})
    : _bookingService = bookingService;

  final BookingService _bookingService;

  List<UserBookingItem> _bookings = [];
  List<UserBookingItem> get bookings => _bookings;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  bool _hasMore = true;
  bool get hasMore => _hasMore;

  String? _error;
  String? get error => _error;

  String? _selectedStatus;
  String? get selectedStatus => _selectedStatus;

  int _currentPage = 0;
  static const int _pageSize = 20;

  final List<String> _statusFilters = [
    'Tất cả',
    'PENDING',
    'PAID',
    'CANCELLED',
  ];
  List<String> get statusFilters => _statusFilters;

  Future<void> loadBookings({String? status, bool refresh = false}) async {
    if (refresh) {
      _currentPage = 0;
      _bookings = [];
      _hasMore = true;
    }

    _selectedStatus = status;
    if (_isLoading) return;

    _isLoading = _currentPage == 0;
    _error = null;
    notifyListeners();

    final apiStatus = status == 'Tất cả' ? null : status;

    final result = await _bookingService.getMyBookings(
      status: apiStatus,
      page: _currentPage,
      size: _pageSize,
    );

    switch (result) {
      case Ok(value: final data):
        _bookings = data.content.where((b) => !b.isTooSoon).toList();
        _hasMore = data.content.length >= _pageSize;
      case Error(error: final e):
        _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    notifyListeners();

    _currentPage++;
    final apiStatus = _selectedStatus == 'Tất cả' ? null : _selectedStatus;

    final result = await _bookingService.getMyBookings(
      status: apiStatus,
      page: _currentPage,
      size: _pageSize,
    );

    switch (result) {
      case Ok(value: final data):
        _bookings.addAll(data.content.where((b) => !b.isTooSoon));
        _hasMore = data.content.length >= _pageSize;
      case Error(error: final e):
        _currentPage--;
        _error = e.toString();
    }

    _isLoadingMore = false;
    notifyListeners();
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
      default:
        return status;
    }
  }

  String getStatusColor(String status) {
    switch (status) {
      case 'PAID':
        return 'green';
      case 'CANCELLED':
        return 'red';
      default:
        return 'grey';
    }
  }
}
