import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/api/profile_service.dart';
import 'package:travery_frontend/data/services/security_storage_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class ProfileRepository extends ChangeNotifier {
  final ProfileService _profileService;
  final SecurityStorageService _securityStorageService;

  ProfileRepository({
    required ProfileService profileService,
    required SecurityStorageService securityStorageService,
  }) : _profileService = profileService,
       _securityStorageService = securityStorageService;

  Future<Result<void>> _getAccessToken() async {
    final token = await _securityStorageService.getAccessToken();
    if (token == null || token.isEmpty) {
      return Result.error(Exception('No access token found'));
    }
    return Result.ok(null);
  }

  Future<Result<String>> _getAccessTokenOrError() async {
    final token = await _securityStorageService.getAccessToken();
    if (token == null || token.isEmpty) {
      return Result.error(Exception('No access token found'));
    }
    return Result.ok(token);
  }

  Future<Result<void>> logout() async {
    final refreshToken = await _securityStorageService.getRefreshToken() ?? '';
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

  Future<Result<void>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final tokenResult = await _getAccessTokenOrError();
    switch (tokenResult) {
      case Ok<String>():
        return await _profileService.changePassword(
          accessToken: tokenResult.value,
          currentPassword: currentPassword,
          newPassword: newPassword,
        );
      case Error<String>():
        return Result.error(tokenResult.error);
    }
  }

  Future<Result<void>> deleteAccount() async {
    final tokenResult = await _getAccessTokenOrError();
    switch (tokenResult) {
      case Ok<String>():
        return await _profileService.deleteAccount(
          accessToken: tokenResult.value,
        );
      case Error<String>():
        return Result.error(tokenResult.error);
    }
  }
}
