import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class MissionDetailViewModel extends ChangeNotifier {
  MissionDetailViewModel({required GuideMissionService missionService})
    : _missionService = missionService;

  final GuideMissionService _missionService;

  GuideMissionDetail? _mission;
  GuideMissionDetail? get mission => _mission;

  String? _missionId;
  String? get missionId => _missionId;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isUpdatingProgress = false;
  bool get isUpdatingProgress => _isUpdatingProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> loadMissionDetail(String instanceId) async {
    _missionId = instanceId;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final result = await _missionService.getMissionDetail(instanceId);

    switch (result) {
      case Ok(value: final data):
        _mission = data;
      case Error(error: final e):
        _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> updateProgress(String newStatus) async {
    if (_missionId == null) return false;

    _isUpdatingProgress = true;
    _errorMessage = null;
    notifyListeners();

    final result = await _missionService.updateProgress(_missionId!, newStatus);

    switch (result) {
      case Ok():
        await loadMissionDetail(_missionId!);
        _isUpdatingProgress = false;
        notifyListeners();
        return true;
      case Error(error: final e):
        _errorMessage = e.toString();
        _isUpdatingProgress = false;
        notifyListeners();
        return false;
    }
  }

  void clear() {
    _mission = null;
    _missionId = null;
    _errorMessage = null;
    notifyListeners();
  }
}
