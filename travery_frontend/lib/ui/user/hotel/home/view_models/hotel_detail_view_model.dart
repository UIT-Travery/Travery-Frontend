import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/hotel/hotel_detail_data.dart';
import 'package:travery_frontend/data/services/hotel/hotel_service.dart';

import '../../../../../utils/core_result.dart';

class HotelDetailViewModel extends ChangeNotifier {
  HotelDetailViewModel({required HotelService hotelService})
    : _hotelService = hotelService;

  final HotelService _hotelService;

  HotelDetailData? _hotel;
  HotelDetailData? get hotel => _hotel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  List<HotelRoomData> _selectedRooms = [];
  List<HotelRoomData> get selectedRooms => _selectedRooms;

  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  void _notifyIfNotDisposed() {
    if (!_disposed) {
      notifyListeners();
    }
  }

  void loadHotel(String hotelId) {
    _isLoading = true;
    _error = null;
    _selectedRooms = [];
    _notifyIfNotDisposed();

    _fetchHotel(hotelId);
  }

  Future<void> _fetchHotel(String hotelId) async {
    final result = await _hotelService.getHotelById(hotelId);

    if (_disposed) return;

    switch (result) {
      case Ok(value: final hotelData):
        _hotel = hotelData;
        _isLoading = false;
      case Error(error: final error):
        _error = error.toString();
        _isLoading = false;
    }
    _notifyIfNotDisposed();
  }

  void toggleRoomSelection(HotelRoomData room) {
    if (_selectedRooms.contains(room)) {
      _selectedRooms = _selectedRooms.where((r) => r.id != room.id).toList();
    } else {
      _selectedRooms = [..._selectedRooms, room];
    }
    _notifyIfNotDisposed();
  }

  void clearSelection() {
    _selectedRooms = [];
    _notifyIfNotDisposed();
  }

  double get totalPrice {
    return _selectedRooms.fold(0, (sum, room) => sum + room.pricePerNight);
  }

  int get selectedRoomCount => _selectedRooms.length;
}
