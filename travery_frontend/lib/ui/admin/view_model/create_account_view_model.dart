import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/domain/models/admin/business_hotel/business_hotel.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// Payload type for [CreateAccountViewModel.createAccount].
typedef CreateAccountPayload = ({
  String name,
  String email,
  String password,
  String role,
  bool isActive,
  String? guideLicense,
  String? hotelId,
  String? avatarPath,
});

class CreateAccountViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  CreateAccountViewModel({required AdminRepository adminRepository})
    : _adminRepository = adminRepository {
    createAccount = Command1<void, CreateAccountPayload>(_createAccount);
    loadHotels = Command0<void>(_loadHotels);
  }

  late final Command1<void, CreateAccountPayload> createAccount;
  late final Command0<void> loadHotels;

  List<BusinessHotel> hotels = [];

  Future<Result<void>> _loadHotels() async {
    final result = await _adminRepository.getAllHotels();
    switch (result) {
      case Ok<List<BusinessHotel>>():
        hotels = result.value;
        return const Result.ok(null);
      case Error<List<BusinessHotel>>():
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _createAccount(CreateAccountPayload payload) async {
    final result = await _adminRepository.createAccount(
      name: payload.name,
      email: payload.email,
      password: payload.password,
      role: payload.role,
      isActive: payload.isActive,
      guideLicense: payload.guideLicense,
      hotelId: payload.hotelId,
    );
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
