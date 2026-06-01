import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/seed_models/guide_tour/guide_tour.dart';
import 'package:travery_frontend/data/services/guide/guide_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

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

  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  List<GuideTour> _ongoingTours = [];
  List<GuideTour> _completedTours = [];
  List<GuideTour> _displayedTours = [];

  List<GuideTour> get ongoingTours => _ongoingTours;
  List<GuideTour> get completedTours => _completedTours;
  List<GuideTour> get displayedTours => _displayedTours;
  int get ongoingCount => _ongoingTours.length;
  int get completedCount => _completedTours.length;

  void setSelectedTab(int index) {
    _selectedTabIndex = index;
    _updateDisplayedTours();
    notifyListeners();
  }

  void _updateDisplayedTours() {
    switch (_selectedTabIndex) {
      case 0:
        _displayedTours = _allTours;
        break;
      case 1:
        _displayedTours = _ongoingTours;
        break;
      case 2:
        _displayedTours = _completedTours;
        break;
      default:
        _displayedTours = _allTours;
    }
  }

  void _recomputeCaches() {
    _ongoingTours = _allTours
        .where(
          (t) =>
              t.status == GuideTourStatus.ongoing ||
              t.status == GuideTourStatus.upcoming,
        )
        .toList();
    _completedTours = _allTours
        .where((t) => t.status == GuideTourStatus.completed)
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
