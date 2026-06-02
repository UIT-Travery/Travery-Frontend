import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/seed_models/guide_tour/guide_tour.dart';
import 'package:travery_frontend/data/services/guide/guide_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

enum GuideFilter { today, upcoming, inProgress, all }

extension GuideFilterExtension on GuideFilter {
  String get label {
    switch (this) {
      case GuideFilter.today:
        return 'Hôm nay';
      case GuideFilter.upcoming:
        return 'Sắp tới';
      case GuideFilter.inProgress:
        return 'Đang chạy';
      case GuideFilter.all:
        return 'Tất cả';
    }
  }

  String get apiValue {
    switch (this) {
      case GuideFilter.today:
        return 'today';
      case GuideFilter.upcoming:
        return 'upcoming';
      case GuideFilter.inProgress:
        return 'in_progress';
      case GuideFilter.all:
        return 'all';
    }
  }
}

class GuideHomeViewModel extends ChangeNotifier {
  GuideHomeViewModel({required GuideService guideService})
    : _guideService = guideService;

  final GuideService _guideService;

  List<GuideTour> _allTours = [];
  List<GuideTour> get allTours => _allTours;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  GuideFilter _selectedFilter = GuideFilter.today;
  GuideFilter get selectedFilter => _selectedFilter;
  int get selectedTabIndex => _selectedFilter.index;

  List<GuideTour> _todayTours = [];
  List<GuideTour> _upcomingTours = [];
  List<GuideTour> _inProgressTours = [];
  List<GuideTour> _displayedTours = [];

  List<GuideTour> get todayTours => _todayTours;
  List<GuideTour> get upcomingTours => _upcomingTours;
  List<GuideTour> get inProgressTours => _inProgressTours;
  List<GuideTour> get displayedTours => _displayedTours;

  int get todayCount => _todayTours.length;
  int get upcomingCount => _upcomingTours.length;
  int get inProgressCount => _inProgressTours.length;

  void setSelectedTab(int index) {
    _selectedFilter = GuideFilter.values[index];
    _updateDisplayedTours();
    notifyListeners();
  }

  void _updateDisplayedTours() {
    switch (_selectedFilter) {
      case GuideFilter.today:
        _displayedTours = _todayTours;
        break;
      case GuideFilter.upcoming:
        _displayedTours = _upcomingTours;
        break;
      case GuideFilter.inProgress:
        _displayedTours = _inProgressTours;
        break;
      case GuideFilter.all:
        _displayedTours = _allTours;
        break;
    }
  }

  void _recomputeCaches() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));

    _todayTours = _allTours.where((t) {
      final tourDate = DateTime(
        t.startDate.year,
        t.startDate.month,
        t.startDate.day,
      );
      return tourDate.isAtSameMomentAs(today);
    }).toList();

    _upcomingTours = _allTours.where((t) {
      final tourDate = DateTime(
        t.startDate.year,
        t.startDate.month,
        t.startDate.day,
      );
      return tourDate.isAfter(today) || tourDate.isAtSameMomentAs(tomorrow);
    }).toList();

    _inProgressTours = _allTours
        .where((t) => t.status == GuideTourStatus.ongoing)
        .toList();

    _updateDisplayedTours();
  }

  Future<void> loadGuideTours() async {
    if (_isLoading) return;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final result = await _guideService.getGuideTours();

    switch (result) {
      case Ok(value: final tours):
        _allTours = tours;
        _recomputeCaches();
      case Error(error: final e):
        _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
