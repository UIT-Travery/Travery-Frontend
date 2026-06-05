import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/hotel/hotel_booking_data.dart';
import 'package:travery_frontend/data/services/hotel/hotel_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class HotelCheckoutViewModel extends ChangeNotifier {
  HotelCheckoutViewModel({
    required HotelService hotelService,
    required String bookingId,
  }) : _hotelService = hotelService,
       _bookingId = bookingId {
    _init();
  }

  final HotelService _hotelService;
  final String _bookingId;
  bool _disposed = false;

  List<HotelAddOnServiceData> _availableServices = [];
  List<HotelAddOnServiceData> get availableServices => _availableServices;

  HotelAddOnBillData? _bill;
  HotelAddOnBillData? get bill => _bill;

  final Map<String, int> _quantities = {};
  Map<String, int> get quantities => _quantities;

  List<HotelAddOnServiceData> get _cartItems =>
      _availableServices.where((s) => (_quantities[s.id] ?? 0) > 0).toList();

  double get cartTotal =>
      _cartItems.fold(0, (sum, s) => sum + s.price * (_quantities[s.id] ?? 0));

  bool _isLoadingServices = false;
  bool get isLoadingServices => _isLoadingServices;

  bool _isLoadingBill = false;
  bool get isLoadingBill => _isLoadingBill;

  bool _isOrdering = false;
  bool get isOrdering => _isOrdering;

  String? _error;
  String? get error => _error;

  int get selectedTab {
    if (_selectedCategory == null) return 0;
    switch (_selectedCategory!.toUpperCase()) {
      case 'FOOD':
        return 1;
      case 'SPA':
        return 2;
      case 'LAUNDRY':
        return 3;
      default:
        return 4;
    }
  }

  String? _selectedCategory;

  List<HotelAddOnServiceData> get filteredServices {
    if (_selectedCategory == null) return _availableServices;
    return _availableServices
        .where((s) => s.category.toUpperCase() == _selectedCategory)
        .toList();
  }

  void _init() {
    loadServices();
    loadBill();
  }

  Future<void> loadServices() async {
    _isLoadingServices = true;
    _error = null;
    notifyListeners();

    final result = await _hotelService.getAvailableServices(_bookingId);

    if (_disposed) return;

    if (result is Ok) {
      _availableServices = (result as Ok<List<HotelAddOnServiceData>>).value;
    } else {
      _error = 'Không thể tải danh sách dịch vụ';
    }

    _isLoadingServices = false;
    notifyListeners();
  }

  Future<void> loadBill() async {
    _isLoadingBill = true;
    notifyListeners();

    final result = await _hotelService.getAddOnBill(_bookingId);

    if (_disposed) return;

    if (result is Ok) {
      _bill = (result as Ok<HotelAddOnBillData>).value;
    }

    _isLoadingBill = false;
    notifyListeners();
  }

  void setQuantity(String serviceId, int qty) {
    if (qty <= 0) {
      _quantities.remove(serviceId);
    } else {
      _quantities[serviceId] = qty;
    }
    notifyListeners();
  }

  void setCategory(String? category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void selectTab(int index) {
    switch (index) {
      case 0:
        _selectedCategory = null;
        break;
      case 1:
        _selectedCategory = 'FOOD';
        break;
      case 2:
        _selectedCategory = 'SPA';
        break;
      case 3:
        _selectedCategory = 'LAUNDRY';
        break;
      default:
        _selectedCategory = 'OTHER';
    }
    notifyListeners();
  }

  int getQuantity(String serviceId) => _quantities[serviceId] ?? 0;

  bool get hasCartItems => _cartItems.isNotEmpty;

  Future<bool> submitOrder() async {
    if (!hasCartItems) return false;

    _isOrdering = true;
    _error = null;
    notifyListeners();

    bool allSuccess = true;

    final scheduledTime = DateTime.now().add(const Duration(hours: 26));

    for (final item in _cartItems) {
      final qty = _quantities[item.id] ?? 1;
      final result = await _hotelService.createAddOnOrder(
        bookingId: _bookingId,
        serviceId: item.id,
        quantity: qty,
        scheduledTime: scheduledTime,
      );

      if (result is! Ok) {
        allSuccess = false;
        _error = 'Có lỗi khi đặt dịch vụ. Vui lòng thử lại.';
      }
    }

    if (allSuccess) {
      _quantities.clear();
      await loadBill();
    }

    if (_disposed) return false;

    _isOrdering = false;
    notifyListeners();

    return allSuccess;
  }

  Future<bool> cancelOrder(String orderId) async {
    final result = await _hotelService.cancelAddOnOrder(orderId);

    if (result is Ok) {
      await loadBill();
      return true;
    }

    if (_disposed) return false;
    _error = 'Không thể hủy dịch vụ. Vui lòng thử lại.';
    notifyListeners();
    return false;
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
