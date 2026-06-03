import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/models/tour/tour_detail_page_data.dart';
import 'package:travery_frontend/data/seed_models/tour_instance/tour_instance.dart';
import 'package:travery_frontend/data/services/tour/tour_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class TourDetailViewModel extends ChangeNotifier {
  TourDetailViewModel({required TourService tourService})
    : _tourService = tourService;

  final TourService _tourService;

  TourDetailPageData? _tourDetail;
  TourDetailPageData? get tourDetail => _tourDetail;

  List<TourInstance> _instances = [];
  List<TourInstance> get instances => _instances;

  String? _loadedInstancesForTourId;
  String? get loadedInstancesForTourId => _loadedInstancesForTourId;

  bool _isLoadingDetail = false;
  bool get isLoadingDetail => _isLoadingDetail;

  bool _isLoadingInstances = false;
  bool get isLoadingInstances => _isLoadingInstances;

  String? _error;
  String? get error => _error;

  String? _selectedInstanceId;
  String? get selectedInstanceId => _selectedInstanceId;

  void selectInstance(String? instanceId) {
    _selectedInstanceId = instanceId;
    notifyListeners();
  }

  Future<void> loadTourDetail(String tourId) async {
    _isLoadingDetail = true;
    _error = null;
    notifyListeners();

    final result = await _tourService.getTourById(tourId);

    switch (result) {
      case Ok(value: final data):
        _tourDetail = data;
      case Error(error: final e):
        _error = e.toString();
    }

    _isLoadingDetail = false;
    notifyListeners();
  }

  Future<void> loadTourInstances(String tourId) async {
    _isLoadingInstances = true;
    _selectedInstanceId = null;
    notifyListeners();

    final result = await _tourService.getTourInstances(tourId);

    switch (result) {
      case Ok(value: final data):
        final now = DateTime.now();
        final cutoff = now.add(const Duration(days: 5));
        _instances = data.where((i) => i.startDate.isAfter(cutoff)).toList()
          ..sort((a, b) => a.startDate.compareTo(b.startDate));
        _loadedInstancesForTourId = tourId;
      case Error(error: final e):
        _error = e.toString();
    }

    _isLoadingInstances = false;
    notifyListeners();
  }
}
