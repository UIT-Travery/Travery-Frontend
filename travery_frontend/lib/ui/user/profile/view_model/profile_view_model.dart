import 'package:flutter/material.dart';
import 'package:travery_frontend/data/repositories/authentication/auth_repository.dart';
import 'package:travery_frontend/data/services/api/model/profile/profile_response/profile_response.dart';
import 'package:travery_frontend/data/services/api/profile_service.dart';
import 'package:travery_frontend/data/services/security_storage_service.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel({
    required ProfileService profileService,
    required SecurityStorageService securityStorageService,
    required AuthRepository authRepository,
  }) : _profileService = profileService,
       _securityStorageService = securityStorageService,
       _authRepository = authRepository {
    loadProfile = Command0<ProfileData>(_loadProfile);
    logout = Command0<void>(_logout);
  }

  final ProfileService _profileService;
  final SecurityStorageService _securityStorageService;
  final AuthRepository _authRepository;

  late final Command0<ProfileData> loadProfile;
  late final Command0<void> logout;

  ProfileData? _profile;
  String? _errorMessage;

  ProfileData? get profile => _profile;
  String? get errorMessage => _errorMessage;
  bool get isLoading => loadProfile.running;

  Future<Result<ProfileData>> _loadProfile() async {
    _errorMessage = null;
    notifyListeners();

    try {
      final token = await _securityStorageService.getAccessToken();
      if (token == null || token.isEmpty) {
        _errorMessage = 'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.';
        notifyListeners();
        return Result.error(Exception(_errorMessage));
      }

      final result = await _profileService.getProfile(accessToken: token);
      switch (result) {
        case Ok<ProfileData>():
          _profile = result.value;
          _errorMessage = null;
          notifyListeners();
          return Result.ok(result.value);
        case Error<ProfileData>():
          _errorMessage = 'Không thể tải thông tin hồ sơ. Vui lòng thử lại.';
          notifyListeners();
          return Result.error(result.error);
      }
    } catch (error) {
      _errorMessage = 'Không thể tải thông tin hồ sơ. Vui lòng thử lại.';
      notifyListeners();
      return Result.error(Exception(error.toString()));
    }
  }

  Future<Result<void>> _logout() async {
    try {
      final refreshToken = await _securityStorageService.getRefreshToken() ?? '';
      await _authRepository.logout(refreshToken: refreshToken);
    } catch (_) {
      // Người dùng đã chọn đăng xuất nên vẫn dọn phiên local nếu API lỗi.
    }

    await _securityStorageService.deleteAllTokens();
    _profile = null;
    _errorMessage = null;
    notifyListeners();
    return const Result.ok(null);
  }
}
