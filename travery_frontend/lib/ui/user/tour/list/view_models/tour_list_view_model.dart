import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/tour/tour_search_item.dart';
import 'package:travery_frontend/data/services/tour/tour_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class TourListViewModel extends ChangeNotifier {
  TourListViewModel({required TourService tourService})
    : _tourService = tourService;

  final TourService _tourService;

  List<TourSearchItem> _tours = [];
  List<TourSearchItem> get tours => _tours;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  bool _hasMore = true;
  bool get hasMore => _hasMore;

  String? _error;
  String? get error => _error;

  // Filter state
  String _keyword = '';
  double? _minPrice;
  double? _maxPrice;
  int? _minRating;
  DateTime? _startDate;
  int _currentPage = 0;
  static const int _pageSize = 20;
  static const int _defaultMinDays = 5;

  // Debounce timer for search
  Timer? _debounceTimer;
  static const Duration _debounceDuration = Duration(milliseconds: 500);

  // Getters for filter state
  String get keyword => _keyword;
  double? get minPrice => _minPrice;
  double? get maxPrice => _maxPrice;
  int? get minRating => _minRating;
  DateTime? get startDate => _startDate;

  bool get hasActiveFilters =>
      _minPrice != null ||
      _maxPrice != null ||
      _minRating != null ||
      _startDate != null;

  void setKeyword(String value) {
    _keyword = value;
    notifyListeners();
  }

  void setFilters({
    double? minPrice,
    double? maxPrice,
    int? minRating,
    DateTime? startDate,
    bool clearMinPrice = false,
    bool clearMaxPrice = false,
    bool clearMinRating = false,
    bool clearStartDate = false,
  }) {
    _minPrice = clearMinPrice ? null : (minPrice ?? _minPrice);
    _maxPrice = clearMaxPrice ? null : (maxPrice ?? _maxPrice);
    _minRating = clearMinRating ? null : (minRating ?? _minRating);
    _startDate = clearStartDate ? null : (startDate ?? _startDate);
    notifyListeners();
  }

  void clearAllFilters() {
    _minPrice = null;
    _maxPrice = null;
    _minRating = null;
    _startDate = null;
    notifyListeners();
  }

  /// Set keyword with debounce support
  void setKeywordDebounced(String value) {
    _keyword = value;
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_debounceDuration, () {
      loadTours(keyword: value, refresh: true);
    });
    notifyListeners();
  }

  /// Immediate search without debounce
  void setKeywordImmediate(String value) {
    _keyword = value;
    _debounceTimer?.cancel();
    notifyListeners();
  }

  /// Perform immediate search
  void searchNow() {
    _debounceTimer?.cancel();
    loadTours(keyword: _keyword, refresh: true);
  }

  Future<void> loadTours({
    String? keyword,
    double? minPrice,
    double? maxPrice,
    int? minRating,
    DateTime? startDate,
    bool refresh = false,
  }) async {
    if (refresh) {
      _currentPage = 0;
      _tours = [];
      _hasMore = true;
    }

    _keyword = keyword ?? _keyword;
    _minPrice = minPrice ?? _minPrice;
    _maxPrice = maxPrice ?? _maxPrice;
    _minRating = minRating ?? _minRating;
    _startDate = startDate ?? _startDate;

    if (_isLoading) return;

    _isLoading = _currentPage == 0;
    _error = null;
    notifyListeners();

    final result = await _tourService.searchTours(
      keyword: _keyword.isNotEmpty ? _keyword : null,
      minPrice: _minPrice,
      maxPrice: _maxPrice,
      minRating: _minRating,
      startDate: _startDate,
      page: _currentPage,
      size: _pageSize,
      minDays: _defaultMinDays,
    );

    switch (result) {
      case Ok(value: final data):
        _tours = data.content;
        _hasMore = _tours.length >= _pageSize;
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
    final result = await _tourService.searchTours(
      keyword: _keyword.isNotEmpty ? _keyword : null,
      minPrice: _minPrice,
      maxPrice: _maxPrice,
      minRating: _minRating,
      startDate: _startDate,
      page: _currentPage,
      size: _pageSize,
      minDays: _defaultMinDays,
    );

    switch (result) {
      case Ok(value: final data):
        _tours.addAll(data.content);
        _hasMore = data.content.length >= _pageSize;
      case Error(error: final e):
        _currentPage--;
        _error = e.toString();
    }

    _isLoadingMore = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}
