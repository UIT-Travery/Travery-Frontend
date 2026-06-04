import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/domain/models/admin/business_hotel/business_hotel.dart';
import 'package:travery_frontend/data/services/api/model/hotel/amenity_response.dart';
import 'package:travery_frontend/data/services/api/model/tour/refund_policy_response/refund_policy_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// Payload for [UpdateHotelViewModel.updateHotel].
typedef UpdateHotelPayload = ({
  String hotelId,
  String? name,
  String? description,
  String? address,
  String? cityProvince,
  String? checkInTime,
  String? checkOutTime,
  List<String>? amenityIds,
  String? refundPolicyId,
});

class UpdateHotelViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  UpdateHotelViewModel({required AdminRepository adminRepository})
    : _adminRepository = adminRepository {
    loadHotel = Command1<BusinessHotel, String>(_loadHotel);
    updateHotel = Command1<void, UpdateHotelPayload>(_updateHotel);
    loadAmenities = Command0<void>(_loadAmenities);
    loadRefundPolicies = Command0<void>(_loadRefundPolicies);
  }

  late final Command1<BusinessHotel, String> loadHotel;
  late final Command1<void, UpdateHotelPayload> updateHotel;
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

  Future<Result<BusinessHotel>> _loadHotel(String id) async {
    final result = await _adminRepository.getHotel(id: id);
    switch (result) {
      case Ok<BusinessHotel>():
        return Result.ok(result.value);
      case Error<BusinessHotel>():
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _updateHotel(UpdateHotelPayload payload) async {
    final result = await _adminRepository.updateHotel(
      hotelId: payload.hotelId,
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
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
