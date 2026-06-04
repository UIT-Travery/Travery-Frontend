import 'package:flutter/material.dart';
import 'package:travery_frontend/data/repositories/authentication/auth_repository.dart';
import 'package:travery_frontend/data/repositories/profile/profile_repository.dart';
import 'package:travery_frontend/data/services/api/model/profile/profile_response/profile_response.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class AdminProfileViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;

  AdminProfileViewModel({
    required AuthRepository authRepository,
    required ProfileRepository profileRepository,
  })  : _authRepository = authRepository,
        _profileRepository = profileRepository {
    logout = Command0<void>(_logout);
    loadProfile = Command0<ProfileData>(_loadProfile);
    updateProfile = Command1<ProfileData, ({String? fullName, String? phoneNumber})>(_updateProfile);
    updateAvatar = Command1<ProfileData, String>(_updateAvatar);
  }

  late final Command0<void> logout;
  late final Command0<ProfileData> loadProfile;
  late final Command1<ProfileData, ({String? fullName, String? phoneNumber})> updateProfile;
  late final Command1<ProfileData, String> updateAvatar;

  Future<Result<void>> _logout() async {
    final result = await _authRepository.logout(refreshToken: '');
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }

  Future<Result<ProfileData>> _loadProfile() async {
    return _profileRepository.getMyProfile();
  }

  Future<Result<ProfileData>> _updateProfile(
    ({String? fullName, String? phoneNumber}) args,
  ) async {
    return _profileRepository.updateAdminProfile(
      fullName: args.fullName,
      phoneNumber: args.phoneNumber,
    );
  }

  Future<Result<ProfileData>> _updateAvatar(String filePath) async {
    return _profileRepository.updateAvatar(filePath: filePath);
  }

  String? validatePhoneNumber(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }
    return null;
  }
}
