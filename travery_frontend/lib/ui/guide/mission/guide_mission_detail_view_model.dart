import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/ui/guide/utils/guide_error_message.dart';
import 'package:travery_frontend/utils/core_result.dart' as core_result;

/// ViewModel for Mission Detail Screen
class GuideMissionDetailViewModel extends ChangeNotifier {
  GuideMissionDetailViewModel({required GuideMissionService missionService})
    : _missionService = missionService;

  final GuideMissionService _missionService;

  final AsyncTask<GuideMissionDetail> loadMission = AsyncTask();
  String? _missionId;

  Future<void> fetchMission(String missionId) async {
    _missionId = missionId;
    await loadMission.execute(
      () => _missionService.getMissionDetail(missionId),
    );
  }

  Future<void> refresh() async {
    if (_missionId != null) {
      await fetchMission(_missionId!);
    }
  }

  GuideMissionDetail? get mission => loadMission.value;
}

/// Async task wrapper for reactive state management
class AsyncTask<T> extends ChangeNotifier {
  core_result.Result<T>? _result;
  bool _running = false;

  core_result.Result<T>? get result => _result;
  bool get running => _running;
  bool get hasData => _result is core_result.Ok;
  bool get error => _result is core_result.Error;
  String get friendlyErrorMessage => guideFriendlyErrorMessage(
    _result,
    fallback: 'Không tải được thông tin nhiệm vụ. Vui lòng thử lại.',
  );
  T? get value => _result is core_result.Ok<T>
      ? (_result as core_result.Ok<T>).value
      : null;

  Future<void> execute(Future<core_result.Result<T>> Function() fetcher) async {
    _running = true;
    _result = null;
    notifyListeners();

    final result = await fetcher();

    _running = false;
    _result = result;
    notifyListeners();
  }
}
