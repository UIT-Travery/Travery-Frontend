import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CheckInViewModel extends ChangeNotifier {
  CheckInViewModel({required GuideMissionService missionService})
    : _missionService = missionService;

  final GuideMissionService _missionService;

  String _instanceId = '';
  GuideMissionDetail? _missionDetail;
  GuideMissionDetail? get missionDetail => _missionDetail;

  List<GuidePassenger> _allPassengers = [];
  List<GuidePassenger> _filteredPassengers = [];
  List<GuidePassenger> get passengers => _filteredPassengers;

  int get totalCount => _allPassengers.length;
  int get arrivedCount => _allPassengers.where((p) => p.isArrived).length;
  int get noShowCount => _allPassengers.where((p) => p.isNoShow).length;
  int get pendingCount => totalCount - arrivedCount - noShowCount;
  double get progress => totalCount > 0 ? arrivedCount / totalCount : 0;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSubmitting = false;
  bool get isSubmitting => _isSubmitting;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  Future<void> loadPassengers(String instanceId) async {
    _instanceId = instanceId;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    // Load mission detail first to get tour name
    final missionResult = await _missionService.getMissionDetail(instanceId);
    switch (missionResult) {
      case Ok(value: final detail):
        _missionDetail = detail;
      case Error():
        // Continue even if mission detail fails
        break;
    }

    final result = await _missionService.getPassengers(instanceId);

    switch (result) {
      case Ok(value: final passengers):
        _allPassengers = passengers;
        _applyFilter();
      case Error(error: final e):
        _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  void search(String query) {
    _searchQuery = query;
    _applyFilter();
    notifyListeners();
  }

  void _applyFilter() {
    if (_searchQuery.isEmpty) {
      _filteredPassengers = List.from(_allPassengers);
    } else {
      final q = _searchQuery.toLowerCase();
      _filteredPassengers = _allPassengers.where((p) {
        return p.fullName.toLowerCase().contains(q) ||
            p.identityNumber.toLowerCase().contains(q);
      }).toList();
    }
  }

  Future<bool> toggleArrived(GuidePassenger passenger) async {
    if (_instanceId.isEmpty) return false;

    final newStatus = passenger.isArrived ? 'NOT_CHECKED' : 'CHECKED_IN';
    final attendances = [
      {'memberId': passenger.id, 'status': newStatus},
    ];

    final result = await _missionService.updateAttendance(
      _instanceId,
      attendances,
    );

    switch (result) {
      case Ok():
        final idx = _allPassengers.indexWhere((p) => p.id == passenger.id);
        if (idx != -1) {
          _allPassengers[idx] = GuidePassenger(
            id: passenger.id,
            fullName: passenger.fullName,
            identityNumber: passenger.identityNumber,
            dateOfBirth: passenger.dateOfBirth,
            attendanceStatus: newStatus,
            memberType: passenger.memberType,
          );
          _applyFilter();
          notifyListeners();
        }
        return true;
      case Error(error: final e):
        _errorMessage = e.toString();
        notifyListeners();
        return false;
    }
  }

  Future<bool> markNoShow(GuidePassenger passenger) async {
    if (_instanceId.isEmpty) return false;

    final attendances = [
      {'memberId': passenger.id, 'status': 'NO_SHOW'},
    ];

    final result = await _missionService.updateAttendance(
      _instanceId,
      attendances,
    );

    switch (result) {
      case Ok():
        final idx = _allPassengers.indexWhere((p) => p.id == passenger.id);
        if (idx != -1) {
          _allPassengers[idx] = GuidePassenger(
            id: passenger.id,
            fullName: passenger.fullName,
            identityNumber: passenger.identityNumber,
            dateOfBirth: passenger.dateOfBirth,
            attendanceStatus: 'NO_SHOW',
            memberType: passenger.memberType,
          );
          _applyFilter();
          notifyListeners();
        }
        return true;
      case Error(error: final e):
        _errorMessage = e.toString();
        notifyListeners();
        return false;
    }
  }

  Future<bool> submitAll() async {
    if (_instanceId.isEmpty) return false;
    _isSubmitting = true;
    _errorMessage = null;
    notifyListeners();

    final pending = _allPassengers.where((p) => !p.isArrived && !p.isNoShow);
    final attendances = pending
        .map((p) => {'memberId': p.id, 'status': 'NO_SHOW'})
        .toList();

    final result = await _missionService.updateAttendance(
      _instanceId,
      attendances,
    );

    switch (result) {
      case Ok():
        for (var i = 0; i < _allPassengers.length; i++) {
          final p = _allPassengers[i];
          if (!p.isArrived) {
            _allPassengers[i] = GuidePassenger(
              id: p.id,
              fullName: p.fullName,
              identityNumber: p.identityNumber,
              dateOfBirth: p.dateOfBirth,
              attendanceStatus: 'NO_SHOW',
              memberType: p.memberType,
            );
          }
        }
        _applyFilter();
        _isSubmitting = false;
        notifyListeners();
        return true;
      case Error(error: final e):
        _errorMessage = e.toString();
        _isSubmitting = false;
        notifyListeners();
        return false;
    }
  }
}
