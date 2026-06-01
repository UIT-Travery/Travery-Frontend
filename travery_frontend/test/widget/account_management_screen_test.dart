import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository_dev.dart';
import 'package:travery_frontend/ui/admin/view/account_management_screen.dart';
import 'package:travery_frontend/ui/admin/view_model/account_management_view_model.dart';

Widget _makeTestable() {
  final repo = AdminRepositoryDev();
  final vm = AccountManagementViewModel(adminRepository: repo);

  return MultiProvider(
    providers: [
      ChangeNotifierProvider<AdminRepository>.value(value: repo),
      ChangeNotifierProvider<AccountManagementViewModel>.value(value: vm),
    ],
    child: MaterialApp(home: AccountManagementScreen(viewModel: vm)),
  );
}

/// Pump until the 300ms repo delay completes and UI rebuilds.
Future<void> _pumpUntilLoaded(WidgetTester tester) async {
  await tester.pumpWidget(_makeTestable());
  await tester.pump(); // fires execute()
  await tester.pump(const Duration(milliseconds: 350)); // pass delay
  await tester.pump(); // rebuild
}

void main() {
  group('AccountManagementScreen', () {
    testWidgets('renders without crashing', (tester) async {
      await tester.pumpWidget(_makeTestable());
      await tester.pump();
      expect(tester.takeException(), isNull);
      // Drain remaining timer
      await tester.pump(const Duration(milliseconds: 400));
      await tester.pump();
    });

    testWidgets('shows loading indicator initially', (tester) async {
      await tester.pumpWidget(_makeTestable());
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      // Drain
      await tester.pump(const Duration(milliseconds: 400));
      await tester.pump();
    });

    testWidgets('shows account cards after data loads', (tester) async {
      await _pumpUntilLoaded(tester);
      expect(find.text('Alex Morgan'), findsOneWidget);
      expect(find.text('Julian Kross'), findsOneWidget);
    });

    testWidgets('shows all 5 accounts by default', (tester) async {
      await _pumpUntilLoaded(tester);
      expect(find.text('Alex Morgan'), findsOneWidget);
      expect(find.text('Sarah Chen'), findsOneWidget);
      expect(find.text('Marcus Reed'), findsOneWidget);
    });

    testWidgets('filter chips are rendered', (tester) async {
      await _pumpUntilLoaded(tester);
      expect(find.text('Tất cả'), findsOneWidget);
      expect(find.text('Điều phối viên'), findsOneWidget);
      expect(find.text('Hướng dẫn viên'), findsOneWidget);
      expect(find.text('Lễ tân'), findsOneWidget);
    });

    testWidgets('search bar is rendered', (tester) async {
      await _pumpUntilLoaded(tester);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('typing in search bar filters results', (tester) async {
      await _pumpUntilLoaded(tester);

      await tester.enterText(find.byType(TextField), 'Alex');
      await tester.pump();

      expect(find.text('Alex Morgan'), findsOneWidget);
      expect(find.text('Julian Kross'), findsNothing);
    });


  });
}
