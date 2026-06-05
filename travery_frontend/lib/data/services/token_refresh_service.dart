import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/api/auth_service.dart';
import 'package:travery_frontend/data/services/api/model/authentication/refresh_request/refresh_request.dart';
import 'package:travery_frontend/data/services/security_storage_service.dart';
import 'package:travery_frontend/utils/jwt_utils.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// A service that manages token refresh logic.
///
/// - Uses [JwtUtils] to check whether the current access token has expired
///   (or will expire within a configurable buffer).
/// - Prevents concurrent refresh calls with a simple in-flight flag.
/// - On successful refresh, persists the new tokens via [SecurityStorageService].
/// - On failure (e.g. refresh token also expired), clears all stored tokens so
///   the rest of the app can treat the user as logged-out.
class TokenRefreshService {
  TokenRefreshService({
    required AuthService authService,
    required SecurityStorageService securityStorageService,
  }) : _authService = authService,
       _storage = securityStorageService;

  final AuthService _authService;
  final SecurityStorageService _storage;

  /// How many seconds before expiry we proactively refresh the token.
  static const int _bufferSeconds = 60;

  /// In-flight refresh future – avoids duplicate concurrent requests.
  Future<Result<String>>? _refreshInFlight;

  /// Returns a valid access token.
  ///
  /// 1. Reads the stored access token.
  /// 2. If the token is still valid (not expiring within [_bufferSeconds])
  ///    it is returned as-is.
  /// 3. Otherwise a refresh is attempted using the stored refresh token.
  /// 4. If the refresh succeeds the new access token is returned.
  /// 5. If the refresh fails (network error, 401, expired refresh token)
  ///    all tokens are deleted and an error result is returned.
  Future<Result<String>> getValidAccessToken() async {
    final accessToken = await _storage.getAccessToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      if (!_isExpiringSoon(accessToken)) {
        return Result.ok(accessToken);
      }
      debugPrint("TokenRefreshService: Access token expiring soon or already expired.");
    } else {
      debugPrint("TokenRefreshService: Access token is missing.");
    }

    // Token is missing, expired, or about to expire — refresh.
    debugPrint("TokenRefreshService: Triggering refresh flow...");
    _refreshInFlight ??= _doRefresh().whenComplete(() {
      _refreshInFlight = null;
    });

    return _refreshInFlight!;
  }

  /// Performs the actual refresh call and updates stored tokens.
  Future<Result<String>> _doRefresh() async {
    final refreshToken = await _storage.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      debugPrint("TokenRefreshService: No refresh token available in storage.");
      // Don't call deleteAllTokens() here as it might wipe new tokens during login race conditions.
      // Just return an error so the caller knows the session is invalid.
      return Result.error(Exception('No refresh token available. Please log in again.'));
    }

    debugPrint("TokenRefreshService: Calling refresh API...");
    final result = await _authService.refresh(
      RefreshRequest(refreshToken: refreshToken),
    );

    switch (result) {
      case Ok():
        debugPrint("TokenRefreshService: Refresh API Success.");
        final newAccess = result.value.accessToken;
        final newRefresh = result.value.refreshToken;
        await _storage.saveAccessToken(newAccess);
        await _storage.saveRefreshToken(newRefresh);
        return Result.ok(newAccess);
      case Error():
        debugPrint("TokenRefreshService: Refresh API Error: ${result.error}");
        // Only clear tokens if it's an authentication failure (401/403)
        // or specifically requested. If it's a network error, just return the error.
        final error = result.error;
        if (error is HttpException || error.toString().contains('401') || error.toString().contains('403')) {
          debugPrint("TokenRefreshService: Auth error detected. Clearing tokens.");
          await _storage.deleteAllTokens();
        }
        return Result.error(result.error);
    }
  }

  /// Returns `true` if the JWT [token] has already expired or will expire
  /// within [_bufferSeconds] seconds.
  bool _isExpiringSoon(String token) {
    try {
      final payload = JwtUtils.decodePayload(token);
      if (payload == null) {
        debugPrint("TokenRefreshService: Failed to decode JWT payload.");
        return true;
      }

      final exp = payload['exp'];
      if (exp == null) {
        debugPrint("TokenRefreshService: JWT payload missing 'exp' field.");
        return true;
      }

      final expiryTime = DateTime.fromMillisecondsSinceEpoch(
        (exp as int) * 1000,
        isUtc: true,
      );
      final now = DateTime.now().toUtc();
      
      final diff = expiryTime.difference(now);
      debugPrint("TokenRefreshService: Token expires in ${diff.inMinutes}m ${diff.inSeconds % 60}s (at $expiryTime)");

      final expiringSoon = now.isAfter(expiryTime.subtract(Duration(seconds: _bufferSeconds)));
      if (expiringSoon) {
        debugPrint("TokenRefreshService: Token is within buffer zone of $_bufferSeconds seconds.");
      }
      
      return expiringSoon;
    } catch (e) {
      debugPrint("TokenRefreshService: Error during expiry check: $e");
      return true;
    }
  }
}
