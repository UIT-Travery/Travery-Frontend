import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/hotel/hotel_detail_data.dart';
import 'package:travery_frontend/data/models/review/review_data.dart';
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

  List<ReviewData> _reviews = [];
  List<ReviewData> get reviews => _reviews;

  bool _isLoadingReviews = false;
  bool get isLoadingReviews => _isLoadingReviews;

  String? _reviewsError;
  String? get reviewsError => _reviewsError;

  int _reviewPage = 0;
  int _reviewTotalElements = 0;
  int get reviewTotalElements => _reviewTotalElements;

  bool _hasMoreReviews = false;
  bool get hasMoreReviews => _hasMoreReviews;

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
    _reviews = [];
    _reviewPage = 0;
    _reviewTotalElements = 0;
    _hasMoreReviews = false;
    _reviewsError = null;
    _notifyIfNotDisposed();

    _fetchHotel(hotelId);
    _fetchReviews(hotelId, refresh: true);
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

  Future<void> loadMoreReviews() async {
    final hotelId = _hotel?.id;
    if (hotelId == null || hotelId.isEmpty) return;
    if (_isLoadingReviews || !_hasMoreReviews) return;
    await _fetchReviews(hotelId);
  }

  Future<void> _fetchReviews(String hotelId, {bool refresh = false}) async {
    if (_isLoadingReviews) return;

    if (refresh) {
      _reviewPage = 0;
      _reviews = [];
      _hasMoreReviews = false;
    }

    _isLoadingReviews = true;
    _reviewsError = null;
    _notifyIfNotDisposed();

    final result = await _hotelService.getHotelReviews(
      hotelId,
      page: _reviewPage,
      size: 10,
    );

    if (_disposed) return;

    switch (result) {
      case Ok(value: final data):
        _reviews = refresh ? data.reviews : [..._reviews, ...data.reviews];
        _reviewTotalElements = data.totalElements;
        _hasMoreReviews = data.hasMore;
        _reviewPage = data.currentPage + 1;
        _isLoadingReviews = false;
      case Error(error: final error):
        _reviewsError = error.toString();
        _isLoadingReviews = false;
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
