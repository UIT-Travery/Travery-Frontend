import 'package:flutter/foundation.dart';
import 'package:travery_frontend/domain/models/admin/business_account/business_account.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class ViewDetailAccountViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  ViewDetailAccountViewModel({required AdminRepository adminRepository})
    : _adminRepository = adminRepository {
    loadAccount = Command1<BusinessAccount, String>(_loadAccount);
    deleteAccount = Command1<void, String>(_deleteAccount);
    banAccount = Command1<BusinessAccount, String>(_banAccount);
    unbanAccount = Command1<BusinessAccount, String>(_unbanAccount);
    updateReceptionistProfile =
        Command1<BusinessAccount, ({String id, String? fullName, String? phoneNumber, String? shiftType, String? hotelId})>(
      _updateReceptionistProfile,
    );
    updateGuideProfile =
        Command1<BusinessAccount, ({String id, String? fullName, String? phoneNumber, String? guideLicense, int? yearsExperience, List<String>? languages})>(
      _updateGuideProfile,
    );
    updateCoordinatorProfile =
        Command1<BusinessAccount, ({String id, String? fullName, String? phoneNumber, String? department})>(
      _updateCoordinatorProfile,
    );
    updateAvatar =
        Command1<BusinessAccount, ({String id, String filePath})>(_updateAvatar);
  }

  late final Command1<BusinessAccount, String> loadAccount;
  late final Command1<void, String> deleteAccount;
  late final Command1<BusinessAccount, String> banAccount;
  late final Command1<BusinessAccount, String> unbanAccount;
  late final Command1<
      BusinessAccount,
      ({
        String id,
        String? fullName,
        String? phoneNumber,
        String? shiftType,
        String? hotelId,
      })> updateReceptionistProfile;
  late final Command1<
      BusinessAccount,
      ({
        String id,
        String? fullName,
        String? phoneNumber,
        String? guideLicense,
        int? yearsExperience,
        List<String>? languages,
      })> updateGuideProfile;
  late final Command1<
      BusinessAccount,
      ({
        String id,
        String? fullName,
        String? phoneNumber,
        String? department,
      })> updateCoordinatorProfile;
  late final Command1<BusinessAccount, ({String id, String filePath})> updateAvatar;

  // ── Command implementations ────────────────────────────────────────────────

  Future<Result<BusinessAccount>> _loadAccount(String id) async {
    return _adminRepository.getUserById(id: id);
  }

  Future<Result<void>> _deleteAccount(String id) async {
    final result = await _adminRepository.deleteAccount(id: id);
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }

  Future<Result<BusinessAccount>> _banAccount(String id) async {
    final result = await _adminRepository.banUser(id: id);
    switch (result) {
      case Ok<BusinessAccount>():
        return Result.ok(result.value);
      case Error<BusinessAccount>():
        return Result.error(result.error);
    }
  }

  Future<Result<BusinessAccount>> _unbanAccount(String id) async {
    final result = await _adminRepository.unbanUser(id: id);
    switch (result) {
      case Ok<BusinessAccount>():
        return Result.ok(result.value);
      case Error<BusinessAccount>():
        return Result.error(result.error);
    }
  }

  Future<Result<BusinessAccount>> _updateReceptionistProfile(
    ({
      String id,
      String? fullName,
      String? phoneNumber,
      String? shiftType,
      String? hotelId,
    }) args,
  ) async {
    final result = await _adminRepository.updateReceptionistProfile(
      id: args.id,
      fullName: args.fullName,
      phoneNumber: args.phoneNumber,
      shiftType: args.shiftType,
      hotelId: args.hotelId,
    );
    switch (result) {
      case Ok<BusinessAccount>():
        return Result.ok(result.value);
      case Error<BusinessAccount>():
        return Result.error(result.error);
    }
  }

  Future<Result<BusinessAccount>> _updateGuideProfile(
    ({
      String id,
      String? fullName,
      String? phoneNumber,
      String? guideLicense,
      int? yearsExperience,
      List<String>? languages,
    }) args,
  ) async {
    final result = await _adminRepository.updateGuideProfile(
      id: args.id,
      fullName: args.fullName,
      phoneNumber: args.phoneNumber,
      guideLicense: args.guideLicense,
      yearsExperience: args.yearsExperience,
      languages: args.languages,
    );
    switch (result) {
      case Ok<BusinessAccount>():
        return Result.ok(result.value);
      case Error<BusinessAccount>():
        return Result.error(result.error);
    }
  }

  Future<Result<BusinessAccount>> _updateCoordinatorProfile(
    ({
      String id,
      String? fullName,
      String? phoneNumber,
      String? department,
    }) args,
  ) async {
    final result = await _adminRepository.updateCoordinatorProfile(
      id: args.id,
      fullName: args.fullName,
      phoneNumber: args.phoneNumber,
      department: args.department,
    );
    switch (result) {
      case Ok<BusinessAccount>():
        return Result.ok(result.value);
      case Error<BusinessAccount>():
        return Result.error(result.error);
    }
  }

  Future<Result<BusinessAccount>> _updateAvatar(
    ({String id, String filePath}) args,
  ) async {
    final result = await _adminRepository.updateUserAvatar(
      id: args.id,
      filePath: args.filePath,
    );
    switch (result) {
      case Ok<BusinessAccount>():
        return Result.ok(result.value);
      case Error<BusinessAccount>():
        return Result.error(result.error);
    }
  }
}
