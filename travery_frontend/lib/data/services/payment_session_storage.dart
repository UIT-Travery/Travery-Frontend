import 'package:shared_preferences/shared_preferences.dart';

/// Lưu trữ tạm thời txnRef → bookingId trong phiên thanh toán.
/// Cần dùng SharedPreferences vì deeplink có thể đến khi app đã bị kill.
/// Key format: "payment_booking_{txnRef}" → bookingId
class PaymentSessionStorage {
  static const String _prefix = 'payment_booking_';

  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// Lưu txnRef → bookingId khi booking được tạo thành công
  static Future<void> save(String txnRef, String bookingId) async {
    await init();
    await _prefs!.setString('$_prefix$txnRef', bookingId);
  }

  /// Tra cứu bookingId từ txnRef khi deeplink về
  static String? getBookingIdByTxnRef(String txnRef) {
    return _prefs?.getString('$_prefix$txnRef');
  }

  /// Xóa entry sau khi payment hoàn tất hoặc timeout
  static Future<void> remove(String txnRef) async {
    await init();
    await _prefs!.remove('$_prefix$txnRef');
  }

  /// Xóa tất cả payment entries
  static Future<void> clearAll() async {
    await init();
    final keys = _prefs!.getKeys();
    for (final key in keys) {
      if (key.startsWith(_prefix)) {
        await _prefs!.remove(key);
      }
    }
  }
}
