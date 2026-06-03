import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/services/api/model/hotel/amenity_response.dart';
import 'package:travery_frontend/data/services/api/model/tour/refund_policy_response/refund_policy_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// Payload for [CreateHotelViewModel.createHotel].
typedef CreateHotelPayload = ({
  String name,
  String? description,
  String address,
  String cityProvince,
  String checkInTime,
  String checkOutTime,
  List<String> amenityIds,
  String refundPolicyId,
});

class CreateHotelViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  CreateHotelViewModel({required AdminRepository adminRepository})
    : _adminRepository = adminRepository {
    createHotel = Command1<String, CreateHotelPayload>(_createHotel);
    loadAmenities = Command0<void>(_loadAmenities);
    loadRefundPolicies = Command0<void>(_loadRefundPolicies);
  }

  late final Command1<String, CreateHotelPayload> createHotel;
  late final Command0<void> loadAmenities;
  late final Command0<void> loadRefundPolicies;

  List<AmenityResponse> amenities = [];
  List<RefundPolicyResponse> refundPolicies = [];

  Future<Result<void>> _loadAmenities() async {
    final result = await _adminRepository.getAllAmenities();
    switch (result) {
      case Ok<List<dynamic>>():
        amenities = result.value
            .map((e) => AmenityResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        notifyListeners();
        return const Result.ok(null);
      case Error<List<dynamic>>():
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _loadRefundPolicies() async {
    final result = await _adminRepository.getAllRefundPolicies();
    switch (result) {
      case Ok<List<dynamic>>():
        final all = result.value
            .map(
              (e) => RefundPolicyResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        refundPolicies = all
            .where((element) => element.serviceType == 'HOTEL')
            .toList();
        notifyListeners();
        return const Result.ok(null);
      case Error<List<dynamic>>():
        return Result.error(result.error);
    }
  }

  Future<Result<String>> _createHotel(CreateHotelPayload payload) async {
    final result = await _adminRepository.createHotel(
      name: payload.name,
      description: payload.description,
      address: payload.address,
      cityProvince: payload.cityProvince,
      checkInTime: payload.checkInTime,
      checkOutTime: payload.checkOutTime,
      amenityIds: payload.amenityIds,
      refundPolicyId: payload.refundPolicyId,
    );
    switch (result) {
      case Ok<String>():
        return Result.ok(result.value);
      case Error<String>():
        return Result.error(result.error);
    }
  }
}
