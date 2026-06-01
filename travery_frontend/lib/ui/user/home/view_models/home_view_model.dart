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
        _featuredTours = await _filterByMinDays(tours);
      case Error(error: final e):
        _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Filters tours to only include those with a nearest instance at least [minDays] from now.
  ///
  /// Server rule: a tour is only bookable if its nearest instance starts at least 5 days
  /// from today. Tours/instances within 5 days must not be displayed.
  Future<List<TourFeaturedItem>> _filterByMinDays(
    List<TourFeaturedItem> tours,
  ) async {
    const minDays = 5;
    final now = DateTime.now();
    final cutoff = now.add(Duration(days: minDays));
    final result = <TourFeaturedItem>[];

    for (final tour in tours) {
      final instancesResult = await _tourService.getTourInstances(tour.id);
      switch (instancesResult) {
        case Ok(value: final instances):
          final upcoming =
              instances.where((i) => i.startDate.isAfter(now)).toList()
                ..sort((a, b) => a.startDate.compareTo(b.startDate));
          if (upcoming.isNotEmpty && upcoming.first.startDate.isAfter(cutoff)) {
            result.add(tour);
          }
        case Error():
          // If we can't fetch instances, include the tour to avoid hiding it
          result.add(tour);
      }
    }

    return result;
  }
}
