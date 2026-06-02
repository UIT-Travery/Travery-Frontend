import 'package:flutter/foundation.dart';
import 'package:travery_frontend/domain/models/admin/business_account/business_account.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/utils/core_result.dart';

class AccountManagementViewModel extends ChangeNotifier {
  final AdminRepository _adminRepository;

  AccountManagementViewModel({required AdminRepository adminRepository})
    : _adminRepository = adminRepository {
    loadAccounts = Command0<List<BusinessAccount>>(_loadAccounts);
    loadUsers = Command1<Map<String, dynamic>, ({String? role, String? status, int page, int size})>(
      _loadUsers,
    );
    banUser = Command1<BusinessAccount, String>(_banUser);
    unbanUser = Command1<BusinessAccount, String>(_unbanUser);
    deleteUser = Command1<void, String>(_deleteUser);
  }

  /// Legacy command kept for backward compatibility with account_management_screen.
  late final Command0<List<BusinessAccount>> loadAccounts;

  /// Paginated user list with optional role/status filters.
  late final Command1<Map<String, dynamic>, ({String? role, String? status, int page, int size})> loadUsers;

  late final Command1<BusinessAccount, String> banUser;
  late final Command1<BusinessAccount, String> unbanUser;
  late final Command1<void, String> deleteUser;

  /// Alias for backward compatibility with existing tests.
  Command1<void, String> get deleteAccount => deleteUser;

  // ── Command implementations ────────────────────────────────────────────────

  Future<Result<List<BusinessAccount>>> _loadAccounts() async {
    final result = await _adminRepository.getAllAccounts();
    switch (result) {
      case Ok<List<BusinessAccount>>():
        return Result.ok(result.value);
      case Error<List<BusinessAccount>>():
        return Result.error(result.error);
    }
  }

  Future<Result<Map<String, dynamic>>> _loadUsers(
    ({String? role, String? status, int page, int size}) args,
  ) async {
    final result = await _adminRepository.getUsers(
      role: args.role,
      status: args.status,
      page: args.page,
      size: args.size,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        return Result.ok(result.value);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  Future<Result<BusinessAccount>> _banUser(String id) async {
    final result = await _adminRepository.banUser(id: id);
    switch (result) {
      case Ok<BusinessAccount>():
        return Result.ok(result.value);
      case Error<BusinessAccount>():
        return Result.error(result.error);
    }
  }

  Future<Result<BusinessAccount>> _unbanUser(String id) async {
    final result = await _adminRepository.unbanUser(id: id);
    switch (result) {
      case Ok<BusinessAccount>():
        return Result.ok(result.value);
      case Error<BusinessAccount>():
        return Result.error(result.error);
    }
  }

  Future<Result<void>> _deleteUser(String id) async {
    final result = await _adminRepository.deleteAccount(id: id);
    switch (result) {
      case Ok<void>():
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }
}
