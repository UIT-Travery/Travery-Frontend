import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/services/api/model/hotel/hotel_service_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class HotelServiceListViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  HotelServiceListViewModel({required AdminRepository adminRepository})
      : _adminRepository = adminRepository {
    loadServices = Command1<List<HotelServiceResponse>, String>(_loadServices);
    deleteService = Command1<void, String>(_deleteService);
  }

  late final Command1<List<HotelServiceResponse>, String> loadServices;
  late final Command1<void, String> deleteService;

  // Stored hotelId so delete can reference it if needed
  String? _currentHotelId;

  Future<Result<List<HotelServiceResponse>>> _loadServices(String hotelId) async {
    _currentHotelId = hotelId;
    final result = await _adminRepository.getHotelServices(hotelId: hotelId);
    switch (result) {
      case Ok<List<dynamic>>():
        final list = result.value
            .map((e) => HotelServiceResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return Result.ok(list);
      case Error<List<dynamic>>():
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _deleteService(String serviceId) async {
    final result = await _adminRepository.deleteHotelService(serviceId: serviceId);
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }

  String? get currentHotelId => _currentHotelId;
}
