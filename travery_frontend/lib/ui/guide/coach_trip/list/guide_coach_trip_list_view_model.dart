import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

enum GuideCoachTripFilter {
  all('Tất cả', null),
  open('Sẵn sàng', 'OPEN'),
  inProgress('Đang chạy', 'IN_PROGRESS'),
  completed('Đã xong', 'COMPLETED');

  const GuideCoachTripFilter(this.label, this.status);

  final String label;
  final String? status;
}

class GuideCoachTripListViewModel extends ChangeNotifier {
  GuideCoachTripListViewModel({required GuideMissionService missionService})
    : _missionService = missionService;

  final GuideMissionService _missionService;

  static const int _pageSize = 20;

  final List<CoachTripSummary> _trips = [];
  List<CoachTripSummary> get trips => List.unmodifiable(_trips);

  GuideCoachTripFilter _filter = GuideCoachTripFilter.all;
  GuideCoachTripFilter get filter => _filter;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  bool _hasMore = true;
  bool get hasMore => _hasMore;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  int _page = 0;

  Future<void> loadInitial() async {
    _page = 0;
    _hasMore = true;
    _trips.clear();
    _errorMessage = null;
    _isLoading = true;
    notifyListeners();

    final result = await _missionService.getCoachTrips(
      status: _filter.status,
      page: _page,
      size: _pageSize,
    );

    switch (result) {
      case Ok(:final value):
        _trips.addAll(value.content);
        _hasMore = !value.last && value.content.isNotEmpty;
        _page = 1;
      case Error(:final error):
        _errorMessage = error.toString();
        _hasMore = false;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadMore() async {
    if (_isLoading || _isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    notifyListeners();

    final result = await _missionService.getCoachTrips(
      status: _filter.status,
      page: _page,
      size: _pageSize,
    );

    switch (result) {
      case Ok(:final value):
        _trips.addAll(value.content);
        _hasMore = !value.last && value.content.isNotEmpty;
        _page++;
      case Error(:final error):
        _errorMessage = error.toString();
    }

    _isLoadingMore = false;
    notifyListeners();
  }

  Future<void> setFilter(GuideCoachTripFilter filter) async {
    if (_filter == filter) return;
    _filter = filter;
    notifyListeners();
    await loadInitial();
  }
}
