import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository_dev.dart';
import 'package:travery_frontend/ui/admin/view/dashboard_screen.dart';
import 'package:travery_frontend/ui/admin/view_model/dashboard_view_model.dart';

Widget _makeTestable() {
  final repo = AdminRepositoryDev();
  final vm = DashboardViewModel(adminRepository: repo);

  return MultiProvider(
    providers: [
      ChangeNotifierProvider<AdminRepository>.value(value: repo),
      ChangeNotifierProvider<DashboardViewModel>.value(value: vm),
    ],
    child: MaterialApp(home: DashboardScreen(viewModel: vm)),
  );
}

/// Pump until all 300ms-delayed futures in AdminRepositoryDev complete.
Future<void> _pumpUntilLoaded(WidgetTester tester) async {
  await tester.pumpWidget(_makeTestable());
  // One frame so initState fires execute()
  await tester.pump();
  // Advance fake time past the 300ms delay
  await tester.pump(const Duration(milliseconds: 350));
  // One more frame to let ListenableBuilder rebuild
  await tester.pump();
}

void main() {
  group('DashboardScreen', () {
    testWidgets('renders without crashing', (tester) async {
      await tester.pumpWidget(_makeTestable());
      await tester.pump();
      expect(tester.takeException(), isNull);
      // Drain remaining timer so test cleanup doesn't fail
      await tester.pump(const Duration(milliseconds: 400));
      await tester.pump();
    });

    testWidgets('shows loading indicator on first render', (tester) async {
      await tester.pumpWidget(_makeTestable());
      await tester.pump(); // fires execute()
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      // Drain
      await tester.pump(const Duration(milliseconds: 400));
      await tester.pump();
    });

    testWidgets('shows "Báo cáo Tổng quát" after data loads', (tester) async {
      await _pumpUntilLoaded(tester);
      expect(find.text('Báo cáo Tổng quát'), findsOneWidget);
    });

    testWidgets('shows stat card labels after data loads', (tester) async {
      await _pumpUntilLoaded(tester);
      expect(find.text('DOANH THU'), findsOneWidget);
      expect(find.text('LƯỢT ĐẶT'), findsOneWidget);
    });

    testWidgets('shows revenue chart section header', (tester) async {
      await _pumpUntilLoaded(tester);
      expect(find.text('Doanh thu theo Dịch vụ'), findsOneWidget);
    });

    testWidgets('shows operational health section', (tester) async {
      await _pumpUntilLoaded(tester);
      expect(find.text('Sức khỏe Vận hành'), findsOneWidget);
    });

    testWidgets('period toggle buttons TH and QUÝ are rendered', (
      tester,
    ) async {
      await _pumpUntilLoaded(tester);
      expect(find.text('TH'), findsOneWidget);
      expect(find.text('QUÝ'), findsOneWidget);
    });

    testWidgets('tapping QUÝ does not throw', (tester) async {
      await _pumpUntilLoaded(tester);
      await tester.tap(find.text('QUÝ'));
      await tester.pump();
      expect(tester.takeException(), isNull);
    });
  });
}
