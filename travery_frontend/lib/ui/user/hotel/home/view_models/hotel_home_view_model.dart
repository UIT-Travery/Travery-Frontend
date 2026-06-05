import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/hotel/hotel_detail_data.dart';
import 'package:travery_frontend/data/models/hotel/hotel_list_data.dart';
import 'package:travery_frontend/data/services/hotel/hotel_service.dart';

import '../../../../../utils/core_result.dart';

class HotelHomeViewModel extends ChangeNotifier {
  HotelHomeViewModel({required HotelService hotelService})
    : _hotelService = hotelService;

  final HotelService _hotelService;

  List<HotelListData> _hotels = [];
  List<HotelListData> get hotels => _hotels;

  List<HotelAmenityData> _amenities = [];
  List<HotelAmenityData> get amenities => _amenities;

  List<HotelAmenityData> get hotelAmenities => _amenities
      .where(
        (amenity) => amenity.type == null || amenity.type == 'HOTEL_AMENITY',
      )
      .toList();

  List<HotelAmenityData> get roomAmenities =>
      _amenities.where((amenity) => amenity.type == 'ROOM_AMENITY').toList();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool get isInitialLoading => _isLoading && _hotels.isEmpty;
  bool get isLoadingMore => _isLoading && _hotels.isNotEmpty;

  bool _isLoadingAmenities = false;
  bool get isLoadingAmenities => _isLoadingAmenities;

  String? _error;
  String? get error => _error;

  String? _amenitiesError;
  String? get amenitiesError => _amenitiesError;

  int _currentPage = 0;
  bool _hasMore = true;
  bool get hasMore => _hasMore;

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
  List<String>? get selectedAmenityIds => _amenityIds;
  String? get keyword => _keyword;
  String? get cityProvince => _cityProvince;
  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;
  int? get adults => _adults;
  int? get children => _children;
  int? get roomCount => _roomCount;
  int? get minRating => _minRating;
  double? get minPrice => _minPrice;
  double? get maxPrice => _maxPrice;

  int get activeFilterCount {
    var count = 0;
    if ((_cityProvince ?? '').trim().isNotEmpty) count++;
    if (_startDate != null || _endDate != null) count++;
    if ((_adults ?? 0) > 0 || (_children ?? 0) > 0 || (_roomCount ?? 0) > 0) {
      count++;
    }
    if (_minRating != null) count++;
    if (_minPrice != null || _maxPrice != null) count++;
    if ((_amenityIds ?? const []).isNotEmpty) count++;
    return count;
  }

  bool _disposed = false;
  Timer? _searchDebounce;
  int _requestSerial = 0;

  @override
  void dispose() {
    _disposed = true;
    _searchDebounce?.cancel();
    super.dispose();
  }

  void _notifyIfNotDisposed() {
    if (!_disposed) {
      notifyListeners();
    }
  }

  Future<void> loadHotels({bool refresh = false}) async {
    if (_isLoading && !refresh) return;

    if (refresh) {
      _currentPage = 0;
      _hotels = [];
      _hasMore = true;
    }

    final requestPage = _currentPage;
    final requestId = ++_requestSerial;

    _isLoading = true;
    _error = null;
    _notifyIfNotDisposed();

    await _performSearch(requestId: requestId, page: requestPage);
  }

  Future<void> loadAmenities() async {
    if (_isLoadingAmenities || _amenities.isNotEmpty) return;

    _isLoadingAmenities = true;
    _amenitiesError = null;
    _notifyIfNotDisposed();

    final result = await _hotelService.getAmenities();

    if (_disposed) return;

    switch (result) {
      case Ok(value: final amenities):
        _amenities = amenities;
        _isLoadingAmenities = false;
      case Error(error: final error):
        _amenitiesError = error.toString();
        _isLoadingAmenities = false;
    }
    _notifyIfNotDisposed();
  }

  Future<void> _performSearch({
    required int requestId,
    required int page,
  }) async {
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
      page: page,
      size: 10,
    );

    if (_disposed || requestId != _requestSerial) return;

    switch (result) {
      case Ok(value: final searchResult):
        _hotels = page == 0
            ? searchResult.hotels
            : [..._hotels, ...searchResult.hotels];
        _hasMore = searchResult.hasMore;
        _currentPage = searchResult.currentPage + 1;
        _isLoading = false;
      case Error(error: final error):
        _error = error.toString();
        _isLoading = false;
    }
    _notifyIfNotDisposed();
  }

  void loadMore() {
    if (!_isLoading && _hasMore) {
      unawaited(loadHotels());
    }
  }

  void setKeyword(String? keyword) {
    _keyword = _normalizeText(keyword);
  }

  void searchByKeywordDebounced(String? keyword) {
    _keyword = _normalizeText(keyword);
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 400), () {
      unawaited(loadHotels(refresh: true));
    });
  }

  void setCityProvince(String? cityProvince) {
    _cityProvince = _normalizeText(cityProvince);
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
    _amenityIds = _normalizeIds(amenityIds);
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
    _searchDebounce?.cancel();
    _keyword = _normalizeText(keyword);
    _cityProvince = _normalizeText(cityProvince);
    _startDate = startDate;
    _endDate = endDate;
    _adults = adults;
    _children = children;
    _roomCount = roomCount;
    _minRating = minRating;
    _minPrice = minPrice;
    _maxPrice = maxPrice;
    _amenityIds = _normalizeIds(amenityIds);
    unawaited(loadHotels(refresh: true));
  }

  void clearFilters() {
    _searchDebounce?.cancel();
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
    unawaited(loadHotels(refresh: true));
  }

  void clearAll() {
    _searchDebounce?.cancel();
    _keyword = null;
    clearFilters();
  }

  String? _normalizeText(String? value) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }

  List<String>? _normalizeIds(List<String>? values) {
    final ids = values
        ?.map((value) => value.trim())
        .where((value) => value.isNotEmpty)
        .toSet()
        .toList();
    return ids == null || ids.isEmpty ? null : ids;
  }
}
