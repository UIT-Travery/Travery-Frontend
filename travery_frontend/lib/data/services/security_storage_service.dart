import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      sharedPreferencesName: 'travery_secure_storage',
    ),
  );

  static const String _accessToken = 'access_token';
  static const String _refreshToken = 'refresh_token';
  static const String _cometchatUid = 'cometchat_uid';
  static const String _userRole = 'user_role';
  static const String _fcmToken = 'fcm_token';

  Future<void> saveAccessToken(String token) async {
    debugPrint("SecurityStorage: Saving access token (len: ${token.length})");
    await _storage.write(key: _accessToken, value: token);
  }

  Future<String?> getAccessToken() async {
    final token = await _storage.read(key: _accessToken);
    debugPrint("SecurityStorage: Reading access token (found: ${token != null})");
    return token;
  }

  Future<void> deleteAccessToken() async {
    debugPrint("SecurityStorage: Deleting access token");
    await _storage.delete(key: _accessToken);
  }

  Future<void> saveRefreshToken(String token) async {
    debugPrint("SecurityStorage: Saving refresh token (len: ${token.length})");
    await _storage.write(key: _refreshToken, value: token);
  }

  Future<String?> getRefreshToken() async {
    final token = await _storage.read(key: _refreshToken);
    debugPrint("SecurityStorage: Reading refresh token (found: ${token != null})");
    return token;
  }

  Future<void> saveCometchatUid(String uid) async {
    debugPrint("SecurityStorage: Saving CometChat UID: $uid");
    await _storage.write(key: _cometchatUid, value: uid);
  }

  Future<String?> getCometchatUid() async {
    return await _storage.read(key: _cometchatUid);
  }

  Future<void> deleteCometchatUid() async {
    debugPrint("SecurityStorage: Deleting CometChat UID");
    await _storage.delete(key: _cometchatUid);
  }

  Future<void> saveFcmToken(String token) async {
    await _storage.write(key: _fcmToken, value: token);
  }

  Future<String?> getFcmToken() async {
    return await _storage.read(key: _fcmToken);
  }

  Future<void> deleteFcmToken() async {
    await _storage.delete(key: _fcmToken);
  }

  Future<bool> isLoggedIn() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> deleteRefreshToken() async {
    debugPrint("SecurityStorage: Deleting refresh token");
    await _storage.delete(key: _refreshToken);
  }

  Future<void> deleteAllTokens() async {
    debugPrint("SecurityStorage: Deleting ALL tokens and roles");
    await _storage.delete(key: _accessToken);
    await _storage.delete(key: _refreshToken);
    await _storage.delete(key: _cometchatUid);
    await _storage.delete(key: _userRole);
    await _storage.delete(key: _fcmToken);
  }

  // ── Role persistence ────────────────────────────────────────────────────────

  /// Persists the user's role (e.g. "ROLE_TOURIST") across app restarts.
  Future<void> saveUserRole(String role) async {
    debugPrint("SecurityStorage: Saving user role: $role");
    await _storage.write(key: _userRole, value: role);
  }

  /// Returns the last-saved role, or null if not set.
  Future<String?> getUserRole() async {
    final role = await _storage.read(key: _userRole);
    debugPrint("SecurityStorage: Reading user role (found: $role)");
    return role;
  }

  /// Removes the persisted role (called on logout).
  Future<void> deleteUserRole() async {
    await _storage.delete(key: _userRole);
  }
}
