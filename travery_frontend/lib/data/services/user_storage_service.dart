import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStorageService extends ChangeNotifier {
  static UserStorageService? _instance;

  UserStorageService._();

  static Future<UserStorageService> getInstance() async {
    if (_instance == null) {
      _instance = UserStorageService._();
      await _instance!._init();
    }
    return _instance!;
  }

  late SharedPreferences _prefs;

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const _keyFullName = 'user_full_name';
  static const _keyPhone = 'user_phone';
  static const _keyEmail = 'user_email';

  String? get fullName => _prefs.getString(_keyFullName);
  String? get phone => _prefs.getString(_keyPhone);
  String? get email => _prefs.getString(_keyEmail);

  bool get hasUserInfo => fullName != null && fullName!.isNotEmpty;

  Future<void> saveUserInfo({
    required String fullName,
    String? phone,
    String? email,
  }) async {
    await _prefs.setString(_keyFullName, fullName);
    if (phone != null) {
      await _prefs.setString(_keyPhone, phone);
    }
    if (email != null) {
      await _prefs.setString(_keyEmail, email);
    }
    notifyListeners();
  }

  Future<void> clearUserInfo() async {
    await _prefs.remove(_keyFullName);
    await _prefs.remove(_keyPhone);
    await _prefs.remove(_keyEmail);
    notifyListeners();
  }
}
