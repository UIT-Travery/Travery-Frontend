import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/hotel/hotel_list_data.dart';
import 'package:travery_frontend/data/services/hotel/hotel_service.dart';

import '../../../../../utils/core_result.dart';

class HotelHomeViewModel extends ChangeNotifier {
  HotelHomeViewModel({required HotelService hotelService})
    : _hotelService = hotelService;

  final HotelService _hotelService;

  List<HotelListData> _hotels = [];
  List<HotelListData> get hotels => _hotels;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  // Pagination
  int _currentPage = 0;
  bool _hasMore = true;
  bool get hasMore => _hasMore;

  // Search filters
  String? _keyword;
  String? _cityProvince;
  DateTime? _startDate;
  DateTime? _endDate;
  int? _adults;
  int? _children;
  int? _roomCount;
  int? _minRating;
  double? _minPrice;
  double? _maxPrice;
  List<String>? _amenityIds;

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

  void loadHotels({bool refresh = false}) {
    if (_isLoading) return;

    if (refresh) {
      _currentPage = 0;
      _hotels = [];
      _hasMore = true;
    }

    _isLoading = true;
    _error = null;
    _notifyIfNotDisposed();

    _performSearch();
  }

  Future<void> _performSearch() async {
    final result = await _hotelService.searchHotels(
      keyword: _keyword,
      cityProvince: _cityProvince,
      startDate: _startDate,
      endDate: _endDate,
      adults: _adults,
      children: _children,
      roomCount: _roomCount,
      minRating: _minRating,
      minPrice: _minPrice,
      maxPrice: _maxPrice,
      amenityIds: _amenityIds,
      page: _currentPage,
      size: 20,
    );

    if (_disposed) return;

    switch (result) {
      case Ok(value: final searchResult):
        _hotels = [..._hotels, ...searchResult.hotels];
        _hasMore = searchResult.hasMore;
        _currentPage++;
        _isLoading = false;
      case Error(error: final error):
        _error = error.toString();
        _isLoading = false;
    }
    _notifyIfNotDisposed();
  }

  void loadMore() {
    if (!_isLoading && _hasMore) {
      loadHotels();
    }
  }

  void setKeyword(String? keyword) {
    _keyword = keyword;
  }

  void setCityProvince(String? cityProvince) {
    _cityProvince = cityProvince;
  }

  void setDates(DateTime? start, DateTime? end) {
    _startDate = start;
    _endDate = end;
  }

  void setGuests({int? adults, int? children, int? roomCount}) {
    _adults = adults;
    _children = children;
    _roomCount = roomCount;
  }

  void setRating(int? minRating) {
    _minRating = minRating;
  }

  void setPriceRange(double? min, double? max) {
    _minPrice = min;
    _maxPrice = max;
  }

  void setAmenities(List<String>? amenityIds) {
    _amenityIds = amenityIds;
  }

  void applyFilters({
    String? keyword,
    String? cityProvince,
    DateTime? startDate,
    DateTime? endDate,
    int? adults,
    int? children,
    int? roomCount,
    int? minRating,
    double? minPrice,
    double? maxPrice,
    List<String>? amenityIds,
  }) {
    _keyword = keyword;
    _cityProvince = cityProvince;
    _startDate = startDate;
    _endDate = endDate;
    _adults = adults;
    _children = children;
    _roomCount = roomCount;
    _minRating = minRating;
    _minPrice = minPrice;
    _maxPrice = maxPrice;
    _amenityIds = amenityIds;
    loadHotels(refresh: true);
  }

  void clearFilters() {
    _keyword = null;
    _cityProvince = null;
    _startDate = null;
    _endDate = null;
    _adults = null;
    _children = null;
    _roomCount = null;
    _minRating = null;
    _minPrice = null;
    _maxPrice = null;
    _amenityIds = null;
    loadHotels(refresh: true);
  }
}
