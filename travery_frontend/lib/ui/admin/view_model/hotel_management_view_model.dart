import 'package:flutter/foundation.dart';
import 'package:travery_frontend/domain/models/admin/business_hotel/business_hotel.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/utils/core_result.dart';

class HotelManagementViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  HotelManagementViewModel({required AdminRepository adminRepository})
    : _adminRepository = adminRepository;

  List<BusinessHotel> hotels = [];
  bool isLoading = false;
  bool isLoadingMore = false;
  bool hasMore = true;
  bool hasError = false;
  int _currentPage = 0;
  final int _pageSize = 20;

  Future<void> loadHotels() async {
    isLoading = true;
    hasError = false;
    _currentPage = 0;
    hasMore = true;
    notifyListeners();

    final result = await _adminRepository.getAllHotels(page: _currentPage, size: _pageSize);
    if (result is Ok<List<BusinessHotel>>) {
      hotels = result.value;
      hasMore = result.value.length == _pageSize;
    } else {
      hotels = [];
      hasError = true;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> loadMoreHotels() async {
    if (isLoading || isLoadingMore || !hasMore) return;

    isLoadingMore = true;
    notifyListeners();

    _currentPage++;
    final result = await _adminRepository.getAllHotels(page: _currentPage, size: _pageSize);
    if (result is Ok<List<BusinessHotel>>) {
      if (result.value.isEmpty) {
        hasMore = false;
      } else {
        hotels.addAll(result.value);
        hasMore = result.value.length == _pageSize;
      }
    } else {
      _currentPage--;
    }
    isLoadingMore = false;
    notifyListeners();
  }
}
