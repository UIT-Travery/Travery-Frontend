import 'package:flutter/foundation.dart';
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
import 'package:travery_frontend/data/services/chat/chat_service.dart';

class AuthRepositoryRemote extends AuthRepository {
  final AuthService _authService;
  final SecurityStorageService _securityStorageService;
  final TokenRefreshService _tokenRefreshService;
  final ChatService _chatService;

  AuthRepositoryRemote({
    required AuthService authService,
    required SecurityStorageService securityStorageService,
    required TokenRefreshService tokenRefreshService,
    required ChatService chatService,
  }) : _authService = authService,
       _securityStorageService = securityStorageService,
       _tokenRefreshService = tokenRefreshService,
       _chatService = chatService;

  @override
  Future<Result<String>> loginViaEmail({
    required String email,
    required String password,
  }) async {
    try {
      debugPrint("AuthRepository: Starting login flow for $email");
      // Trước khi đăng nhập mới, đảm bảo logout CometChat của phiên cũ (nếu có)
      await _chatService.logout();

      // Gọi API đăng nhập
      final fcmToken = await _securityStorageService.getFcmToken();
      final result = await _authService.loginViaEmail(
        LoginRequest(email: email, password: password, fcmToken: fcmToken),
      );

      // Lưu token vào storage và decode role
      switch (result) {
        case Ok<LoginResponse>():
          debugPrint("AuthRepository: Login API Success. Saving tokens...");
          debugPrint("AuthRepository: AccessToken: ${result.value.accessToken.substring(0, 10)}...");
          debugPrint("AuthRepository: RefreshToken: ${result.value.refreshToken.substring(0, 10)}...");
          
          await _securityStorageService.saveAccessToken(
            result.value.accessToken,
          );
          await _securityStorageService.saveRefreshToken(
            result.value.refreshToken,
          );
          if (result.value.cometchatUid != null) {
            debugPrint("AuthRepository: CometChatUID: ${result.value.cometchatUid}");
            await _securityStorageService.saveCometchatUid(
              result.value.cometchatUid!,
            );
          }
          // Decode role từ JWT access token và persist
          final role =
              JwtUtils.extractRole(result.value.accessToken) ?? 'ROLE_TOURIST';
          debugPrint("AuthRepository: Extracted Role: $role");
          await _securityStorageService.saveUserRole(role);
          
          debugPrint("AuthRepository: Notifying listeners for navigation...");
          return Result.ok(role);

        case Error<LoginResponse>():
          debugPrint("AuthRepository: Login API Error: ${result.error}");
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
      final fcmToken = await _securityStorageService.getFcmToken();
      final result = await _authService.signup(
        SignupRequest(
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          fullName: fullName,
          fcmToken: fcmToken,
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
      final fcmToken = await _securityStorageService.getFcmToken();
      final result = await _authService.verifyOtp(
        VerifyOtpRequest(email: email, otp: otp, fcmToken: fcmToken),
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
      debugPrint("AuthRepository: Starting logout flow...");
      // Lấy accessToken và refreshToken từ storage
      final accessToken = await _securityStorageService.getAccessToken();
      String? actualRefreshToken = await _securityStorageService
          .getRefreshToken();
      
      if (actualRefreshToken == null || actualRefreshToken.isEmpty) {
        debugPrint("AuthRepository: No refresh token in storage, using provided one.");
        actualRefreshToken = refreshToken;
      }

      if (accessToken == null || accessToken.isEmpty) {
        debugPrint("AuthRepository: No access token, clearing local session only.");
        // Nếu không có accessToken thì xóa token local và coi như đã logout
        await _securityStorageService.deleteAccessToken();
        await _securityStorageService.deleteRefreshToken();
        return const Result.ok(null);
      }

      // Gọi API logout
      debugPrint("AuthRepository: Calling backend logout API...");
      final fcmToken = await _securityStorageService.getFcmToken();
      final result = await _authService.logout(
        LogoutRequest(refreshToken: actualRefreshToken, fcmToken: fcmToken),
        accessToken: accessToken,
      );

      // Đảm bảo logout CometChat
      debugPrint("AuthRepository: Logging out from CometChat...");
      await _chatService.logout();

      switch (result) {
        case Ok<void>():
          debugPrint("AuthRepository: Logout successful. Clearing all tokens.");
          await _securityStorageService.deleteAllTokens();
          return const Result.ok(null);

        case Error<void>():
          debugPrint("AuthRepository: Logout API Error: ${result.error}. Clearing local tokens anyway.");
          // Dù API logout thất bại (network error, server error, v.v.),
          // vẫn xóa token local để người dùng không bị auto-login lại.
          await _securityStorageService.deleteAllTokens();
          return Result.error(result.error);
      }
    } finally {
      debugPrint("AuthRepository: Logout flow complete. Notifying listeners.");
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
