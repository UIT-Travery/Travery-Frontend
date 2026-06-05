import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/ui/guide/utils/guide_error_message.dart';
import 'package:travery_frontend/utils/core_result.dart' as core_result;

/// ViewModel for Guide Check-in Screen
class GuideCheckinViewModel extends ChangeNotifier {
  GuideCheckinViewModel({required GuideMissionService missionService})
    : _missionService = missionService;

  final GuideMissionService _missionService;

  final AsyncTask<GuideMissionDetail> loadMission = AsyncTask();
  final ValueNotifier<Map<String, String>> attendanceChanges = ValueNotifier(
    {},
  );
  final ValueNotifier<bool> isSaving = ValueNotifier(false);
  final ValueNotifier<String?> saveError = ValueNotifier(null);

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

  /// Get all members flattened from bookings
  List<GuideMember> getAllMembers() {
    final m = mission;
    if (m == null) return [];
    return m.bookings.expand((b) => b.members).toList();
  }

  /// Get current attendance status for a member — always returns a valid dropdown value
  String getAttendanceStatus(String memberId) {
    final changes = attendanceChanges.value;
    if (changes.containsKey(memberId)) {
      return _normalizeStatus(changes[memberId]!);
    }
    // Find in original data
    final members = getAllMembers();
    for (final m in members) {
      if (m.id == memberId) {
        return _normalizeStatus(m.status);
      }
    }
    return 'NOT_CHECKED';
  }

  String _normalizeStatus(String status) {
    final s = status.toUpperCase();
    if (s == 'CHECKED_IN' || s == 'PRESENT') return 'CHECKED_IN';
    if (s == 'NO_SHOW' || s == 'ABSENT') return 'NO_SHOW';
    return 'NOT_CHECKED';
  }

  /// Update attendance for a member
  void updateAttendance(String memberId, String status) {
    final changes = Map<String, String>.from(attendanceChanges.value);
    changes[memberId] = status;
    attendanceChanges.value = changes;
    notifyListeners();
  }

  /// Check if there are unsaved changes
  bool get hasChanges => attendanceChanges.value.isNotEmpty;

  /// Get count of checked-in members
  int get checkedInCount {
    int count = 0;
    for (final member in getAllMembers()) {
      final status = attendanceChanges.value[member.id] ?? member.status;
      if (status == 'CHECKED_IN') count++;
    }
    return count;
  }

  /// Get total member count
  int get totalCount => getAllMembers().length;

  /// Save attendance changes
  Future<bool> saveAttendance() async {
    if (_missionId == null) return false;

    isSaving.value = true;
    saveError.value = null;

    try {
      final attendances = attendanceChanges.value.entries
          .map((e) => {'memberId': e.key, 'status': _toApiStatus(e.value)})
          .toList();

      final result = await _missionService.updateAttendance(
        _missionId!,
        attendances,
      );

      final missionResult = result;
      if (missionResult is core_result.Ok<GuideMissionDetail>) {
        loadMission.setData(missionResult.value);
        attendanceChanges.value = {};
        return true;
      } else {
        saveError.value = guideFriendlyErrorMessage(
          missionResult,
          fallback: 'Không lưu được điểm danh. Vui lòng thử lại.',
        );
        return false;
      }
    } catch (e) {
      saveError.value = guideFriendlyErrorMessage(
        e,
        fallback: 'Không lưu được điểm danh. Vui lòng thử lại.',
      );
      return false;
    } finally {
      isSaving.value = false;
    }
  }

  /// Convert internal 'CHECKED_IN' → API 'PRESENT', pass others through.
  String _toApiStatus(String internal) {
    return internal == 'CHECKED_IN' ? 'PRESENT' : internal;
  }
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
    fallback: 'Không tải được dữ liệu điểm danh. Vui lòng thử lại.',
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

  /// Replace the current result with fresh data (used after receiving updated
  /// data from an API response that already returns the full model).
  void setData(T data) {
    _result = core_result.Result.ok(data);
    notifyListeners();
  }
}
