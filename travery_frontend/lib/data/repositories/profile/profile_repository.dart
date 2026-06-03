import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/api/model/profile/profile_response/profile_response.dart';
import 'package:travery_frontend/utils/core_result.dart';

abstract class ProfileRepository extends ChangeNotifier {
  Future<Result<ProfileData>> getMyProfile();

  Future<Result<ProfileData>> updateAdminProfile({
    String? fullName,
    String? phoneNumber,
  });

  Future<Result<ProfileData>> updateTouristProfile({
    String? fullName,
    String? phoneNumber,
    String? passportNumber,
    String? dateOfBirth,
    String? gender,
  });

  Future<Result<ProfileData>> updateAvatar({required String filePath});

  Future<Result<void>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<Result<void>> deleteAccount();

  Future<Result<void>> logout();
}
