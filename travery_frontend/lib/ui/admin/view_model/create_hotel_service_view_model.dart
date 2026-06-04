import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/services/api/model/hotel/hotel_service_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

typedef CreateHotelServicePayload = ({
  String hotelId,
  String name,
  HotelServiceCategory category,
  double price,
  String unit,
  String? description,
});

class CreateHotelServiceViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  CreateHotelServiceViewModel({required AdminRepository adminRepository})
      : _adminRepository = adminRepository {
    createService = Command1<void, CreateHotelServicePayload>(_createService);
  }

  late final Command1<void, CreateHotelServicePayload> createService;

  Future<Result<void>> _createService(CreateHotelServicePayload payload) async {
    final result = await _adminRepository.createHotelService(
      hotelId: payload.hotelId,
      name: payload.name,
      category: payload.category.apiValue,
      price: payload.price,
      unit: payload.unit,
      description: payload.description,
    );
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
