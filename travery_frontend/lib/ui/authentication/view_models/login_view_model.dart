import 'package:travery_frontend/data/repositories/authentication/auth_repository.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class LoginViewModel {
  final AuthRepository _authRepository;

  /// Role được trả về sau khi đăng nhập thành công.
  /// Ví dụ: "ROLE_TOURIST", "ROLE_ADMIN", "ROLE_COORDINATOR", "ROLE_GUIDE"
  String? userRole;

  LoginViewModel({required AuthRepository authRepository})
    : _authRepository = authRepository {
    loginViaEmail = Command1<String, (String email, String password)>(
      _loginViaEmail,
    );
  }

  late final Command1 loginViaEmail;

  Future<Result<String>> _loginViaEmail(
    (String, String) credentials,
  ) async {
    final (email, password) = credentials;
    final result = await _authRepository.loginViaEmail(
      email: email,
      password: password,
    );
    switch (result) {
      case Ok<String>():
        userRole = result.value;
        return Result.ok(result.value);

      case Error<String>():
        userRole = null;
        return Result.error(result.error);
    }
  }
}
