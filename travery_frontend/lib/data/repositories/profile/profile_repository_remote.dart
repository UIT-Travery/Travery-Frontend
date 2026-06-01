import 'package:travery_frontend/data/repositories/profile/profile_repository.dart';
import 'package:travery_frontend/data/services/api/model/profile/profile_response/profile_response.dart';
import 'package:travery_frontend/data/services/api/model/profile/update_admin_profile_request/update_admin_profile_request.dart';
import 'package:travery_frontend/data/services/api/model/profile/update_tourist_profile_request/update_tourist_profile_request.dart';
import 'package:travery_frontend/data/services/api/profile_service.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class ProfileRepositoryRemote extends ProfileRepository {
  final ProfileService _profileService;
  final TokenRefreshService _tokenRefreshService;

  ProfileRepositoryRemote({
    required ProfileService profileService,
    required TokenRefreshService tokenRefreshService,
  })  : _profileService = profileService,
        _tokenRefreshService = tokenRefreshService;

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
      req: UpdateAdminProfileRequest(
        fullName: fullName,
        phoneNumber: phoneNumber,
      ),
    );
    if (result is Ok<ProfileData>) notifyListeners();
    return result;
  }

  @override
  Future<Result<ProfileData>> updateTouristProfile({
    String? fullName,
    String? phoneNumber,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }
    final result = await _profileService.updateTouristProfile(
      accessToken: token,
      req: UpdateTouristProfileRequest(
        fullName: fullName,
        phoneNumber: phoneNumber,
      ),
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
}
