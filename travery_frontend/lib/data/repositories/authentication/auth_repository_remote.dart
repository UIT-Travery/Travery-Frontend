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

class AuthRepositoryRemote extends AuthRepository {
  final AuthService _authService;
  final SecurityStorageService _securityStorageService;

  AuthRepositoryRemote({
    required AuthService authService,
    required SecurityStorageService securityStorageService,
  }) : _authService = authService,
       _securityStorageService = securityStorageService;

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
          // Decode role từ JWT access token
          final role =
              JwtUtils.extractRole(result.value.accessToken) ?? 'ROLE_TOURIST';
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
      // Gọi API logout
      final result = await _authService.logout(
        LogoutRequest(refreshToken: refreshToken),
      );
      switch (result) {
        case Ok<void>():
          await _securityStorageService.deleteAccessToken();
          await _securityStorageService.deleteRefreshToken();
          return const Result.ok(null);

        case Error<void>():
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }
}
