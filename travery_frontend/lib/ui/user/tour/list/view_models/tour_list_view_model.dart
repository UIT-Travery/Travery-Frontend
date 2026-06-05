import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/tour/tour_search_item.dart';
import 'package:travery_frontend/data/models/tour/tour_search_response.dart';
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

  String? _loadMoreError;
  String? get loadMoreError => _loadMoreError;

  String _keyword = '';
  double? _minPrice;
  double? _maxPrice;
  int? _minRating;
  DateTime? _startDate;
  int _currentPage = 0;
  static const int _pageSize = 10;

  Timer? _debounceTimer;
  static const Duration _debounceDuration = Duration(milliseconds: 500);

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

  void setKeywordDebounced(String value) {
    _keyword = value;
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_debounceDuration, () {
      loadTours(keyword: value, refresh: true);
    });
    notifyListeners();
  }

  void setKeywordImmediate(String value) {
    _keyword = value;
    _debounceTimer?.cancel();
    notifyListeners();
  }

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
      _loadMoreError = null;
    }

    _keyword = keyword ?? _keyword;
    _minPrice = minPrice ?? _minPrice;
    _maxPrice = maxPrice ?? _maxPrice;
    _minRating = minRating ?? _minRating;
    _startDate = startDate ?? _startDate;

    if (_isLoading) return;

    _isLoading = _currentPage == 0;
    _error = null;
    _loadMoreError = null;
    notifyListeners();

    final pageToLoad = _currentPage;
    final result = await _tourService.searchTours(
      keyword: _keyword.isNotEmpty ? _keyword : null,
      minPrice: _minPrice,
      maxPrice: _maxPrice,
      minRating: _minRating,
      startDate: _startDate,
      page: pageToLoad,
      size: _pageSize,
    );

    switch (result) {
      case Ok(value: final data):
        _currentPage = pageToLoad;
        _tours = data.content;
        _hasMore = _hasNextPage(data, pageToLoad);
      case Error(error: final e):
        _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadMore({bool retry = false}) async {
    if (_isLoading ||
        _isLoadingMore ||
        !_hasMore ||
        _tours.isEmpty ||
        (_loadMoreError != null && !retry)) {
      return;
    }

    _isLoadingMore = true;
    _loadMoreError = null;
    notifyListeners();

    final pageToLoad = _currentPage + 1;
    final result = await _tourService.searchTours(
      keyword: _keyword.isNotEmpty ? _keyword : null,
      minPrice: _minPrice,
      maxPrice: _maxPrice,
      minRating: _minRating,
      startDate: _startDate,
      page: pageToLoad,
      size: _pageSize,
    );

    switch (result) {
      case Ok(value: final data):
        _currentPage = pageToLoad;
        _tours.addAll(data.content);
        _hasMore = _hasNextPage(data, pageToLoad);
      case Error(error: final e):
        _loadMoreError = e.toString();
    }

    _isLoadingMore = false;
    notifyListeners();
  }

  bool _hasNextPage(TourSearchPageData data, int loadedPage) {
    if (data.content.isEmpty) return false;
    if (data.totalPages > 0) {
      return loadedPage + 1 < data.totalPages;
    }
    if (data.last) return false;
    return data.content.length >= _pageSize;
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}
