import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/hotel/hotel_booking_data.dart';
import 'package:travery_frontend/data/services/hotel/hotel_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class HotelMyBookingViewModel extends ChangeNotifier {
  HotelMyBookingViewModel({required HotelService hotelService})
    : _hotelService = hotelService {
    loadBookings();
  }

  final HotelService _hotelService;

  List<HotelBookingData> _bookings = [];
  List<HotelBookingData> get bookings => _filteredBookings;

  List<HotelBookingData> get _filteredBookings {
    if (_selectedStatus == null || _selectedStatus == 'Tất cả') {
      return _bookings;
    }
    return _bookings.where((b) => b.status == _selectedStatus).toList();
  }

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
    'CHECKED_IN',
    'CHECKED_OUT',
    'CANCELLED',
  ];
  List<String> get statusFilters => _allStatuses;

  void loadBookings({String? status}) {
    if (_isLoading) return;
    _selectedStatus = status ?? _selectedStatus ?? 'Tất cả';
    _isLoading = true;
    _error = null;
    notifyListeners();

    _fetchBookings();
  }

  Future<void> _fetchBookings() async {
    try {
      final result = await _hotelService.getMyBookings(
        status: _selectedStatus == 'Tất cả' ? null : _selectedStatus,
      );

      if (result is Ok) {
        final bookingResult = result as Ok<HotelBookingListResult>;
        _bookings = bookingResult.value.bookings;
      } else {
        _error = 'Không thể tải danh sách đặt phòng';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshBookings() async {
    await _fetchBookings();
  }

  void filterByStatus(String? status) {
    _selectedStatus = status ?? 'Tất cả';
    loadBookings(status: _selectedStatus);
  }

  String getStatusLabel(String status) {
    switch (status) {
      case 'PAID':
        return 'Đã thanh toán';
      case 'PENDING':
        return 'Đang chờ';
      case 'CHECKED_IN':
        return 'Đang ở';
      case 'CHECKED_OUT':
        return 'Đã trả phòng';
      case 'CANCELLED':
        return 'Đã hủy';
      default:
        return status;
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'PAID':
        return const Color(0xFF22C55E);
      case 'PENDING':
        return const Color(0xFFF59E0B);
      case 'CHECKED_IN':
        return const Color(0xFF007AFF);
      case 'CHECKED_OUT':
        return const Color(0xFF6B7280);
      case 'CANCELLED':
        return const Color(0xFFEF4444);
      default:
        return const Color(0xFF6B7280);
    }
  }
}
