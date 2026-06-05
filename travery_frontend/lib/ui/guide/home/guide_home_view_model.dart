import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/seed_models/guide_tour/guide_tour.dart';
import 'package:travery_frontend/data/services/guide/guide_service.dart';
import 'package:travery_frontend/ui/guide/utils/guide_error_message.dart';
import 'package:travery_frontend/utils/core_result.dart' as core_result;

/// Filter options for guide tours
enum GuideFilterOption {
  all('Tất cả', null),
  open('Đang mở', 'OPEN'),
  ongoing('Đang diễn ra', 'IN_PROGRESS'),
  completed('Hoàn thành', 'COMPLETED');

  const GuideFilterOption(this.label, this.apiStatus);
  final String label;
  final String? apiStatus;
}

/// ViewModel for Guide Home Screen
class GuideHomeViewModel extends ChangeNotifier {
  GuideHomeViewModel({required GuideService guideService})
    : _guideService = guideService {
    selectedFilter.addListener(_applyFilter);
    searchQuery.addListener(_applyFilter);
    loadTours.addListener(_onLoadToursChanged);
  }

  final GuideService _guideService;

  final GuideLoadToursAsyncTask loadTours = GuideLoadToursAsyncTask();
  final ValueNotifier<GuideFilterOption> selectedFilter = ValueNotifier(
    GuideFilterOption.all,
  );
  final ValueNotifier<String> searchQuery = ValueNotifier('');

  ValueNotifier<List<GuideTour>> get filteredTours => _filteredTours;
  final ValueNotifier<List<GuideTour>> _filteredTours = ValueNotifier([]);

  void _onLoadToursChanged() {
    if (loadTours.hasData) {
      _applyFilter();
    }
  }

  Future<void> fetchTours() async {
    loadTours.execute(_guideService);
  }

  Future<void> _applyFilter() async {
    if (loadTours.value == null) return;

    final allTours = loadTours.value!;
    final filter = selectedFilter.value;
    final query = searchQuery.value.toLowerCase();

    List<GuideTour> filtered;

    // Apply status filter
    if (filter == GuideFilterOption.all) {
      filtered = allTours;
    } else {
      filtered = allTours.where((tour) {
        return _matchApiStatus(tour.status, filter.apiStatus);
      }).toList();
    }

    // Apply search filter
    if (query.isNotEmpty) {
      filtered = filtered.where((tour) {
        return tour.tourName.toLowerCase().contains(query) ||
            (tour.pickupLocation?.toLowerCase().contains(query) ?? false);
      }).toList();
    }

    _filteredTours.value = filtered;
    notifyListeners();
  }

  bool _matchApiStatus(GuideTourStatus status, String? filterStatus) {
    if (filterStatus == null) return true;

    switch (filterStatus) {
      case 'OPEN':
        return status == GuideTourStatus.upcoming;
      case 'IN_PROGRESS':
        return status == GuideTourStatus.ongoing;
      case 'COMPLETED':
        return status == GuideTourStatus.completed;
      default:
        return true;
    }
  }

  @override
  void dispose() {
    selectedFilter.removeListener(_applyFilter);
    searchQuery.removeListener(_applyFilter);
    loadTours.removeListener(_onLoadToursChanged);
    super.dispose();
  }
}

/// Async task for loading guide tours
class GuideLoadToursAsyncTask extends ChangeNotifier {
  core_result.Result<List<GuideTour>>? _result;
  bool _running = false;

  core_result.Result<List<GuideTour>>? get result => _result;
  bool get running => _running;
  bool get hasData => _result is core_result.Ok;
  bool get error => _result is core_result.Error;
  String get friendlyErrorMessage => guideFriendlyErrorMessage(
    _result,
    fallback: 'Không tải được chuyến đi. Vui lòng thử lại.',
  );
  List<GuideTour>? get value => _result is core_result.Ok<List<GuideTour>>
      ? (_result as core_result.Ok<List<GuideTour>>).value
      : null;

  Future<void> execute(GuideService guideService) async {
    _running = true;
    _result = null;
    notifyListeners();

    final result = await guideService.getGuideTours();

    _running = false;
    _result = result;
    notifyListeners();
  }
}
