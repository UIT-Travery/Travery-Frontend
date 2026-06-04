import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/review/review_data.dart';
import 'package:travery_frontend/data/models/tour/tour_detail_page_data.dart';
import 'package:travery_frontend/data/seed_models/tour_instance/tour_instance.dart';
import 'package:travery_frontend/data/services/tour/tour_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class TourDetailViewModel extends ChangeNotifier {
  TourDetailViewModel({required TourService tourService})
    : _tourService = tourService;

  final TourService _tourService;

  TourDetailPageData? _tourDetail;
  TourDetailPageData? get tourDetail => _tourDetail;

  List<TourInstance> _instances = [];
  List<TourInstance> get instances => _instances;

  String? _loadedInstancesForTourId;
  String? get loadedInstancesForTourId => _loadedInstancesForTourId;

  bool _isLoadingDetail = false;
  bool get isLoadingDetail => _isLoadingDetail;

  bool _isLoadingInstances = false;
  bool get isLoadingInstances => _isLoadingInstances;

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

  String? _selectedInstanceId;
  String? get selectedInstanceId => _selectedInstanceId;

  void selectInstance(String? instanceId) {
    _selectedInstanceId = instanceId;
    notifyListeners();
  }

  Future<void> loadTourDetail(String tourId) async {
    _isLoadingDetail = true;
    _error = null;
    _reviews = [];
    _reviewPage = 0;
    _reviewTotalElements = 0;
    _hasMoreReviews = false;
    _reviewsError = null;
    notifyListeners();

    unawaited(loadReviews(tourId, refresh: true));
    final result = await _tourService.getTourById(tourId);

    switch (result) {
      case Ok(value: final data):
        _tourDetail = data;
      case Error(error: final e):
        _error = e.toString();
    }

    _isLoadingDetail = false;
    notifyListeners();
  }

  Future<void> loadReviews(String tourId, {bool refresh = false}) async {
    if (_isLoadingReviews) return;

    if (refresh) {
      _reviewPage = 0;
      _reviews = [];
      _hasMoreReviews = false;
    }

    _isLoadingReviews = true;
    _reviewsError = null;
    notifyListeners();

    final result = await _tourService.getTourReviews(
      tourId,
      page: _reviewPage,
      size: 10,
    );

    switch (result) {
      case Ok(value: final data):
        _reviews = refresh ? data.reviews : [..._reviews, ...data.reviews];
        _reviewTotalElements = data.totalElements;
        _hasMoreReviews = data.hasMore;
        _reviewPage = data.currentPage + 1;
      case Error(error: final e):
        _reviewsError = e.toString();
    }

    _isLoadingReviews = false;
    notifyListeners();
  }

  Future<void> loadMoreReviews(String tourId) async {
    if (_isLoadingReviews || !_hasMoreReviews) return;
    await loadReviews(tourId);
  }

  Future<void> loadTourInstances(String tourId) async {
    _isLoadingInstances = true;
    _selectedInstanceId = null;
    notifyListeners();

    final result = await _tourService.getTourInstances(tourId);

    switch (result) {
      case Ok(value: final data):
        final now = DateTime.now();
        final cutoff = now.add(const Duration(days: 5));
        _instances = data.where((i) => i.startDate.isAfter(cutoff)).toList()
          ..sort((a, b) => a.startDate.compareTo(b.startDate));
        _loadedInstancesForTourId = tourId;
      case Error(error: final e):
        _error = e.toString();
    }

    _isLoadingInstances = false;
    notifyListeners();
  }
}
