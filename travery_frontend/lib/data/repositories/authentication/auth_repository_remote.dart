import 'package:travery_frontend/data/services/api/model/authentication/forgot_password_request/forgot_password_request.dart';
import 'package:travery_frontend/data/services/api/model/authentication/login_request/login_request.dart';
import 'package:travery_frontend/data/services/api/model/authentication/login_response/login_response.dart';
import 'package:travery_frontend/data/services/api/model/authentication/logout_request/logout_request.dart';
import 'package:travery_frontend/data/services/api/model/authentication/resend_otp_request/resend_otp_request.dart';
import 'package:travery_frontend/data/services/api/model/authentication/reset_password_request/reset_password_request.dart';
import 'package:travery_frontend/data/services/api/model/authentication/signup_request/signup_request.dart';
import 'package:travery_frontend/data/services/api/model/authentication/verify_otp_request/verify_otp_request.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'package:travery_frontend/utils/jwt_utils.dart';

import 'auth_repository.dart';
import 'package:travery_frontend/data/services/api/auth_service.dart';
import 'package:travery_frontend/data/services/security_storage_service.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';

class AuthRepositoryRemote extends AuthRepository {
  final AuthService _authService;
  final SecurityStorageService _securityStorageService;
  final TokenRefreshService _tokenRefreshService;

  AuthRepositoryRemote({
    required AuthService authService,
    required SecurityStorageService securityStorageService,
    required TokenRefreshService tokenRefreshService,
  }) : _authService = authService,
       _securityStorageService = securityStorageService,
       _tokenRefreshService = tokenRefreshService;

  @override
  Future<Result<String>> loginViaEmail({
    required String email,
    required String password,
  }) async {
    try {
      // Gọi API đăng nhập
      final result = await _authService.loginViaEmail(
        LoginRequest(email: email, password: password),
      );
      // Lưu token vào storage và decode role
      switch (result) {
        case Ok<LoginResponse>():
          await _securityStorageService.saveAccessToken(
            result.value.accessToken,
          );
          await _securityStorageService.saveRefreshToken(
            result.value.refreshToken,
          );
          // Decode role từ JWT access token và persist
          final role =
              JwtUtils.extractRole(result.value.accessToken) ?? 'ROLE_TOURIST';
          await _securityStorageService.saveUserRole(role);
          return Result.ok(role);

        case Error<LoginResponse>():
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> registerViaEmail({
    required String email,
    required String password,
    required String confirmPassword,
    required String fullName,
  }) async {
    try {
      // Gọi API đăng ký
      final result = await _authService.signup(
        SignupRequest(
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          fullName: fullName,
        ),
      );
      // Đăng ký xong chưa có token, phải đợi xác thực OTP xong mới có thể login.
      switch (result) {
        case Ok<void>():
          return const Result.ok(null);

        case Error<void>():
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> forgotPassword({required String email}) async {
    try {
      final result = await _authService.forgotPassword(
        ForgotPasswordRequest(email: email),
      );
      switch (result) {
        case Ok<void>():
          return const Result.ok(null);

        case Error<void>():
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final result = await _authService.verifyOtp(
        VerifyOtpRequest(email: email, otp: otp),
      );
      switch (result) {
        case Ok<void>():
          return const Result.ok(null);

        case Error<void>():
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> resendOtp({required String email}) async {
    try {
      final result = await _authService.resendOtp(
        ResendOtpRequest(email: email),
      );
      switch (result) {
        case Ok<void>():
          return const Result.ok(null);

        case Error<void>():
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> resetPassword({
    required String email,
    required String otp,
    required String confirmPassword,
    required String newPassword,
  }) async {
    try {
      final result = await _authService.resetPassword(
        ResetPasswordRequest(
          email: email,
          otp: otp,
          confirmPassword: confirmPassword,
          newPassword: newPassword,
        ),
      );
      switch (result) {
        case Ok<void>():
          return const Result.ok(null);

        case Error<void>():
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> logout({required String refreshToken}) async {
    try {
      // Lấy accessToken và refreshToken từ storage
      final accessToken = await _securityStorageService.getAccessToken();
      String? actualRefreshToken = await _securityStorageService
          .getRefreshToken();
      if (actualRefreshToken == null || actualRefreshToken.isEmpty) {
        actualRefreshToken = refreshToken;
      }

      if (accessToken == null || accessToken.isEmpty) {
        // Nếu không có accessToken thì xóa token local và coi như đã logout
        await _securityStorageService.deleteAccessToken();
        await _securityStorageService.deleteRefreshToken();
        return const Result.ok(null);
      }

      // Gọi API logout
      final result = await _authService.logout(
        LogoutRequest(refreshToken: actualRefreshToken),
        accessToken: accessToken,
      );
      switch (result) {
        case Ok<void>():
          await _securityStorageService.deleteAllTokens();
          return const Result.ok(null);

        case Error<void>():
          // Dù API logout thất bại (network error, server error, v.v.),
          // vẫn xóa token local để người dùng không bị auto-login lại.
          await _securityStorageService.deleteAllTokens();
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  /// Refreshes the access token using the stored refresh token via
  /// [TokenRefreshService]. Notifies listeners on completion so that
  /// any widget observing [AuthRepository] can react (e.g. update UI state
  /// or redirect to login when the refresh token is also expired).
  @override
  Future<Result<String>> refreshAccessToken() async {
    final result = await _tokenRefreshService.getValidAccessToken();
    // Only notify when the result is an error (tokens were cleared), so that
    // the app can redirect the user to the login screen.
    if (result is Error) {
      notifyListeners();
    }
    return result;
  }

  /// Reads the persisted role from secure storage.
  ///
  /// Returns null when:
  /// - There is no stored access token (user never logged in or has logged out).
  /// - The stored role key is missing (falls back to JWT decode).
  @override
  Future<String?> getPersistedRole() async {
    // Guard: must have at least an access token or a refresh token.
    final hasAccess = await _securityStorageService.isLoggedIn();
    final refreshToken = await _securityStorageService.getRefreshToken();
    final hasSession =
        hasAccess || (refreshToken != null && refreshToken.isNotEmpty);
    if (!hasSession) return null;

    // Prefer the persisted role key (fastest, works even when token is expired).
    final savedRole = await _securityStorageService.getUserRole();
    if (savedRole != null && savedRole.isNotEmpty) return savedRole;

    // Fallback: decode from live access token.
    final accessToken = await _securityStorageService.getAccessToken();
    if (accessToken != null && accessToken.isNotEmpty) {
      return JwtUtils.extractRole(accessToken);
    }

    return null;
  }
}
