import 'package:flutter_test/flutter_test.dart';
import 'package:travery_frontend/domain/models/admin/business_account/business_account.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository_dev.dart';
import 'package:travery_frontend/ui/admin/view_model/account_management_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart';

void main() {
  late AdminRepositoryDev repo;
  late AccountManagementViewModel vm;

  setUp(() {
    repo = AdminRepositoryDev();
    vm = AccountManagementViewModel(adminRepository: repo);
  });

  // ── loadAccounts ───────────────────────────────────────────────────────────

  group('AccountManagementViewModel.loadAccounts', () {
    test('initially not running and no result', () {
      expect(vm.loadAccounts.running, isFalse);
      expect(vm.loadAccounts.result, isNull);
    });

    test('execute() completes with list of accounts', () async {
      await vm.loadAccounts.execute();

      expect(vm.loadAccounts.completed, isTrue);
      expect(vm.loadAccounts.error, isFalse);
      expect(vm.loadAccounts.result, isA<Ok<List<BusinessAccount>>>());
    });

    test('result contains 8 accounts', () async {
      await vm.loadAccounts.execute();
      final accounts =
          (vm.loadAccounts.result as Ok<List<BusinessAccount>>).value;
      expect(accounts.length, equals(8));
    });

    test('result includes accounts of different roles', () async {
      await vm.loadAccounts.execute();
      final accounts =
          (vm.loadAccounts.result as Ok<List<BusinessAccount>>).value;

      final roles = accounts.map((a) => a.role).toSet();
      expect(
        roles,
        containsAll([
          AccountRole.guide,
          AccountRole.coordinator,
          AccountRole.receptionist,
        ]),
      );
    });

    test('can filter accounts by role guide', () async {
      await vm.loadAccounts.execute();
      final all = (vm.loadAccounts.result as Ok<List<BusinessAccount>>).value;
      final guides = all.where((a) => a.role == AccountRole.guide).toList();
      expect(guides, isNotEmpty);
      expect(guides.every((a) => a.role == AccountRole.guide), isTrue);
    });

    test('can filter accounts by status active', () async {
      await vm.loadAccounts.execute();
      final all = (vm.loadAccounts.result as Ok<List<BusinessAccount>>).value;
      final active = all
          .where((a) => a.status == AccountStatus.active)
          .toList();
      expect(active, isNotEmpty);
    });

    test('can search by name', () async {
      await vm.loadAccounts.execute();
      final all = (vm.loadAccounts.result as Ok<List<BusinessAccount>>).value;
      final q = 'alex';
      final filtered = all
          .where((a) => a.name.toLowerCase().contains(q))
          .toList();
      expect(filtered.length, equals(1));
      expect(filtered.first.name, equals('Alex Morgan'));
    });

    test('can search by email', () async {
      await vm.loadAccounts.execute();
      final all = (vm.loadAccounts.result as Ok<List<BusinessAccount>>).value;
      final q = 'kross';
      final filtered = all
          .where((a) => a.email.toLowerCase().contains(q))
          .toList();
      expect(filtered.length, equals(1));
      expect(filtered.first.name, equals('Julian Kross'));
    });
  });

  // ── deleteAccount ──────────────────────────────────────────────────────────

  group('AccountManagementViewModel.deleteAccount', () {
    test('execute() returns Ok for valid id', () async {
      await vm.deleteAccount.execute('acc_1');
      expect(vm.deleteAccount.completed, isTrue);
      expect(vm.deleteAccount.error, isFalse);
    });

    test('execute() returns Error for non-existent id', () async {
      await vm.deleteAccount.execute('does_not_exist');
      expect(vm.deleteAccount.error, isTrue);
    });

    test('after delete, loadAccounts has one fewer account', () async {
      await vm.loadAccounts.execute();
      final countBefore =
          (vm.loadAccounts.result as Ok<List<BusinessAccount>>).value.length;

      await vm.deleteAccount.execute('acc_2');

      // Reload
      vm.loadAccounts.clearResult();
      await vm.loadAccounts.execute();
      final countAfter =
          (vm.loadAccounts.result as Ok<List<BusinessAccount>>).value.length;

      expect(countAfter, equals(countBefore - 1));
    });
  });
}
