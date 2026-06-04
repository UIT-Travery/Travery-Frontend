import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/tour/tour_featured_response.dart';
import 'package:travery_frontend/data/services/tour/tour_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required TourService tourService})
    : _tourService = tourService;

  final TourService _tourService;

  List<TourFeaturedItem> _featuredTours = [];
  List<TourFeaturedItem> get featuredTours => _featuredTours;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> refresh() => loadFeaturedTours();

  Future<void> loadFeaturedTours() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _tourService.getFeaturedTours();

    switch (result) {
      case Ok(value: final tours):
        _featuredTours = tours;
      case Error(error: final e):
        _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
