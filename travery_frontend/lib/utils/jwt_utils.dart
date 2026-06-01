import 'dart:convert';

/// Utility để decode JWT token mà không cần verify signature.
/// Chỉ dùng để đọc claims phía client-side (role navigation).
class JwtUtils {
  /// Decode payload từ JWT và trả về Map.
  /// Trả về null nếu token không hợp lệ.
  static Map<String, dynamic>? decodePayload(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      // Base64url → Base64 chuẩn
      String payload = parts[1];
      // Thêm padding nếu thiếu
      final remainder = payload.length % 4;
      if (remainder != 0) {
        payload = payload.padRight(payload.length + (4 - remainder), '=');
      }
      // Thay ký tự base64url thành base64
      payload = payload.replaceAll('-', '+').replaceAll('_', '/');

      final decoded = utf8.decode(base64.decode(payload));
      return jsonDecode(decoded) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }

  /// Lấy role đầu tiên từ field `authorities` trong JWT payload.
  /// Ví dụ: "ROLE_TOURIST", "ROLE_ADMIN", "ROLE_COORDINATOR", "ROLE_GUIDE"
  static String? extractRole(String token) {
    final payload = decodePayload(token);
    if (payload == null) return null;

    final authorities = payload['authorities'];
    if (authorities is List && authorities.isNotEmpty) {
      return authorities.first as String?;
    }
    return null;
  }

  static String? extractFullName(String token) {
    return decodePayload(token)?['fullName'] as String?;
  }

  static String? extractPhone(String token) {
    return decodePayload(token)?['phone'] as String?;
  }

  static String? extractEmail(String token) {
    return decodePayload(token)?['sub'] as String?;
  }
}
