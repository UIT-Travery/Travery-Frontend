import 'package:travery_frontend/data/repositories/profile/profile_repository.dart';
import 'package:travery_frontend/data/services/api/model/profile/profile_response/profile_response.dart';
import 'package:travery_frontend/data/services/api/profile_service.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';
import 'package:travery_frontend/data/services/security_storage_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class ProfileRepositoryRemote extends ProfileRepository {
  final ProfileService _profileService;
  final TokenRefreshService _tokenRefreshService;
  final SecurityStorageService _securityStorageService;

  ProfileRepositoryRemote({
    required ProfileService profileService,
    required TokenRefreshService tokenRefreshService,
    required SecurityStorageService securityStorageService,
  })  : _profileService = profileService,
        _tokenRefreshService = tokenRefreshService,
        _securityStorageService = securityStorageService;

  Future<String?> _getAccessToken() async {
    final result = await _tokenRefreshService.getValidAccessToken();
    return result is Ok ? (result as Ok<String>).value : null;
  }

  @override
  Future<Result<ProfileData>> getMyProfile() async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    return _profileService.getProfile(accessToken: token);
  }

  @override
  Future<Result<ProfileData>> updateAdminProfile({
    String? fullName,
    String? phoneNumber,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    final result = await _profileService.updateAdminProfile(
      accessToken: token,
      fullName: fullName,
      phoneNumber: phoneNumber,
    );
    if (result is Ok<ProfileData>) notifyListeners();
    return result;
  }

  @override
  Future<Result<ProfileData>> updateTouristProfile({
    String? fullName,
    String? phoneNumber,
    String? passportNumber,
    String? dateOfBirth,
    String? gender,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    final result = await _profileService.updateTouristProfile(
      accessToken: token,
      fullName: fullName,
      phoneNumber: phoneNumber,
      passportNumber: passportNumber,
      dateOfBirth: dateOfBirth,
      gender: gender,
    );
    if (result is Ok<ProfileData>) notifyListeners();
    return result;
  }

  @override
  Future<Result<ProfileData>> updateAvatar({required String filePath}) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    final result = await _profileService.updateAvatar(
      accessToken: token,
      filePath: filePath,
    );
    if (result is Ok<ProfileData>) notifyListeners();
    return result;
  }

  @override
  Future<Result<void>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    return await _profileService.changePassword(
      accessToken: token,
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }

  @override
  Future<Result<void>> deleteAccount() async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    return await _profileService.deleteAccount(
      accessToken: token,
    );
  }

  @override
  Future<Result<void>> logout() async {
    final accessToken = await _securityStorageService.getAccessToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      await _profileService
          .changePassword(
            accessToken: accessToken,
            currentPassword: '',
            newPassword: '',
          )
          .catchError((_) => const Result.ok(null));
    }

    await _securityStorageService.deleteAllTokens();
    notifyListeners();
    return const Result.ok(null);
  }
}
