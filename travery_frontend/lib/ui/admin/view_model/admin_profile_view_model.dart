import 'package:flutter/material.dart';
import 'package:travery_frontend/data/repositories/authentication/auth_repository.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class AdminProfileViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  AdminProfileViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository {
    logout = Command0<void>(_logout);
  }

  late final Command0<void> logout;

  Future<Result<void>> _logout() async {
    final result = await _authRepository.logout(refreshToken: '');
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }

  String? validatePhoneNumber(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }
    return null;
  }
}
