import 'package:flutter/foundation.dart';
import 'package:travery_frontend/utils/core_result.dart';

abstract class AuthRepository extends ChangeNotifier {
  /// Returns the user's role string on success (e.g. "ROLE_TOURIST").
  Future<Result<String>> loginViaEmail({
    required String email,
    required String password,
  });
  Future<Result<void>> registerViaEmail({
    required String email,
    required String password,
    required String confirmPassword,
    required String fullName,
  });
  Future<Result<void>> forgotPassword({required String email});
  Future<Result<void>> verifyOtp({required String email, required String otp});
  Future<Result<void>> resendOtp({required String email});
  Future<Result<void>> logout({required String refreshToken});
  Future<Result<void>> resetPassword({
    required String email,
    required String otp,
    required String confirmPassword,
    required String newPassword,
  });

  /// Returns the role that was persisted during the last successful login,
  /// or `null` if the user is not logged in (no token / role found).
  Future<String?> getPersistedRole();

  /// Refreshes the access token using the stored refresh token.
  ///
  /// Returns `Result.ok(newAccessToken)` on success.
  /// Returns `Result.error(...)` and clears all stored tokens when the
  /// refresh token is also expired/invalid (forcing the user to log in again).
  Future<Result<String>> refreshAccessToken();
}
