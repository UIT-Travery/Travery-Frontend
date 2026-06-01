import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _accessToken = 'access_token';
  static const String _refreshToken = 'refresh_token';
  static const String _userRole = 'user_role';

  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _accessToken, value: token);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessToken);
  }

  Future<void> deleteAccessToken() async {
    await _storage.delete(key: _accessToken);
  }

  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshToken, value: token);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshToken);
  }

  Future<bool> isLoggedIn() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> deleteRefreshToken() async {
    await _storage.delete(key: _refreshToken);
  }

  Future<void> deleteAllTokens() async {
    await _storage.delete(key: _accessToken);
    await _storage.delete(key: _refreshToken);
    await _storage.delete(key: _userRole);
  }

  // ── Role persistence ────────────────────────────────────────────────────────

  /// Persists the user's role (e.g. "ROLE_TOURIST") across app restarts.
  Future<void> saveUserRole(String role) async {
    await _storage.write(key: _userRole, value: role);
  }

  /// Returns the last-saved role, or null if not set.
  Future<String?> getUserRole() async {
    return await _storage.read(key: _userRole);
  }

  /// Removes the persisted role (called on logout).
  Future<void> deleteUserRole() async {
    await _storage.delete(key: _userRole);
  }
}
