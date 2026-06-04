import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/hotel/hotel_booking_data.dart';
import 'package:travery_frontend/data/services/hotel/hotel_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class HotelAddonListViewModel extends ChangeNotifier {
  HotelAddonListViewModel({required HotelService hotelService})
    : _hotelService = hotelService;

  final HotelService _hotelService;

  List<HotelAddOnServiceData> _services = [];
  List<HotelAddOnServiceData> get services => _services;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  bool _isOrdering = false;
  bool get isOrdering => _isOrdering;

  String? _orderSuccess;
  String? get orderSuccess => _orderSuccess;

  int _selectedTab = 0;
  int get selectedTab => _selectedTab;

  final Map<String, int> _quantities = {};
  Map<String, int> get quantities => _quantities;

  final Map<String, DateTime> _scheduledTimes = {};
  Map<String, DateTime> get scheduledTimes => _scheduledTimes;

  String? _currentBookingId;

  List<String> get tabs => ['TẤT CẢ', 'ĐỒ ĂN', 'SPA', 'GIẶT ỦI', 'KHÁC'];

  List<HotelAddOnServiceData> get filteredServices {
    if (_services.isEmpty) return [];
    if (_selectedTab == 0) return _services;

    final categoryMap = {1: 'FOOD', 2: 'SPA', 3: 'LAUNDRY', 4: 'OTHER'};
    final category = categoryMap[_selectedTab] ?? '';
    return _services.where((s) => s.category == category).toList();
  }

  int getTabCount(int tabIndex) {
    if (_services.isEmpty) return 0;
    if (tabIndex == 0) return _services.length;

    final categoryMap = {1: 'FOOD', 2: 'SPA', 3: 'LAUNDRY', 4: 'OTHER'};
    final category = categoryMap[tabIndex] ?? '';
    return _services.where((s) => s.category == category).length;
  }

  int getQuantity(String serviceId) => _quantities[serviceId] ?? 1;

  DateTime getScheduledTime(String serviceId) {
    return _scheduledTimes[serviceId] ?? DateTime.now();
  }

  void setTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  void setQuantity(String serviceId, int quantity) {
    _quantities[serviceId] = quantity;
    notifyListeners();
  }

  void setScheduledTime(String serviceId, DateTime time) {
    _scheduledTimes[serviceId] = time;
    notifyListeners();
  }

  Future<void> loadServices(String bookingId) async {
    _currentBookingId = bookingId;
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _hotelService.getAvailableServices(bookingId);
      if (result is Ok) {
        _services = (result as Ok<List<HotelAddOnServiceData>>).value;
        debugPrint('[AddonListVM] Loaded ${_services.length} services');
      } else {
        _error = 'Không thể tải danh sách dịch vụ';
      }
    } catch (e) {
      _error = e.toString();
      debugPrint('[AddonListVM] Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<HotelAddOnOrderData?> orderService(
    String serviceId, {
    required int quantity,
    required DateTime scheduledTime,
  }) async {
    if (_currentBookingId == null) return null;

    _isOrdering = true;
    _orderSuccess = null;
    _error = null;
    notifyListeners();

    try {
      final result = await _hotelService.createAddOnOrder(
        bookingId: _currentBookingId!,
        serviceId: serviceId,
        quantity: quantity,
        scheduledTime: scheduledTime,
      );

      if (result is Ok) {
        final order = (result as Ok<HotelAddOnOrderData>).value;
        _orderSuccess = 'Đặt dịch vụ thành công!';
        _quantities.remove(serviceId);
        _scheduledTimes.remove(serviceId);
        return order;
      } else {
        _error = 'Không thể đặt dịch vụ';
        return null;
      }
    } catch (e) {
      _error = e.toString();
      debugPrint('[AddonListVM] Order error: $e');
      return null;
    } finally {
      _isOrdering = false;
      notifyListeners();
    }
  }

  void clearMessages() {
    _error = null;
    _orderSuccess = null;
    notifyListeners();
  }

  double get totalSelected {
    double total = 0;
    for (final entry in _quantities.entries) {
      final service = _services.firstWhere(
        (s) => s.id == entry.key,
        orElse: () =>
            HotelAddOnServiceData(id: '', name: '', category: '', price: 0),
      );
      total += service.price * entry.value;
    }
    return total;
  }

  int get selectedCount => _quantities.length;
}
