import 'package:flutter_test/flutter_test.dart';
import 'package:travery_frontend/domain/models/admin/business_account/business_account.dart';
import 'package:travery_frontend/domain/models/admin/business_dashboard/business_dashboard.dart';
import 'package:travery_frontend/domain/models/admin/business_coach/business_coach.dart';
import 'package:travery_frontend/domain/models/admin/business_hotel/business_hotel.dart';
import 'package:travery_frontend/domain/models/admin/business_tour/business_tour.dart';
import 'package:travery_frontend/domain/models/admin/tour_summary/tour_summary.dart';
import 'package:travery_frontend/data/repositories/admin/admin_repository_dev.dart';
import 'package:travery_frontend/utils/core_result.dart';

void main() {
  late AdminRepositoryDev repo;

  setUp(() {
    repo = AdminRepositoryDev();
  });

  // ── getDashboardStats ──────────────────────────────────────────────────────

  group('getDashboardStats', () {
    test('returns Ok with Dashboard', () async {
      final result = await repo.getDashboardStats();
      expect(result, isA<Ok<BusinessDashboard>>());
    });

    test('stats have correct totalRevenue', () async {
      final result = await repo.getDashboardStats();
      final stats = (result as Ok<BusinessDashboard>).value;
      expect(stats.totalRevenue, equals(4820150));
    });

    test('stats have correct ongoingTours', () async {
      final result = await repo.getDashboardStats();
      final stats = (result as Ok<BusinessDashboard>).value;
      expect(stats.ongoingTours, equals(24));
    });

    test('systemStabilityPercent is 99.9', () async {
      final result = await repo.getDashboardStats();
      final stats = (result as Ok<BusinessDashboard>).value;
      expect(stats.systemStabilityPercent, equals(99.9));
    });
  });

  // ── getAllAccounts ─────────────────────────────────────────────────────────

  group('getAllAccounts', () {
    test('first BusinessAccount is Alex Morgan with guide role', () async {
      final result = await repo.getAllAccounts();
      final accounts = (result as Ok<List<BusinessAccount>>).value;
      expect(accounts.first.name, equals('Alex Morgan'));
      expect(accounts.first.role, equals(AccountRole.guide));
    });

    test('contains active and inactive accounts', () async {
      final result = await repo.getAllAccounts();
      final accounts = (result as Ok<List<BusinessAccount>>).value;
      final activeCount = accounts
          .where((a) => a.status == AccountStatus.active)
          .length;
      final inactiveCount = accounts
          .where((a) => a.status == AccountStatus.inactive)
          .length;
      expect(activeCount, greaterThan(0));
      expect(inactiveCount, greaterThan(0));
    });

    test('accounts have non-empty emails', () async {
      final result = await repo.getAllAccounts();
      final accounts = (result as Ok<List<BusinessAccount>>).value;
      for (final a in accounts) {
        expect(a.email, isNotEmpty);
      }
    });
  });

  // ── createAccount ──────────────────────────────────────────────────────────

  group('createAccount', () {
    test('returns Ok and increases list size by 1', () async {
      final before = await repo.getAllAccounts();
      final countBefore = (before as Ok<List<BusinessAccount>>).value.length;

      final result = await repo.createAccount(
        name: 'Test User',
        email: 'test@travery.com',
        employeeId: 'TRV-TEST-001',
        role: 'guide',
        isActive: true,
      );

      expect(result, isA<Ok<void>>());

      final after = await repo.getAllAccounts();
      final countAfter = (after as Ok<List<BusinessAccount>>).value.length;
      expect(countAfter, equals(countBefore + 1));
    });

    test('created account has correct data', () async {
      await repo.createAccount(
        name: 'New Employee',
        email: 'new@travery.com',
        employeeId: 'TRV-NEW-001',
        role: 'coordinator',
        isActive: false,
      );

      final allResult = await repo.getAllAccounts();
      final accounts = (allResult as Ok<List<BusinessAccount>>).value;
      final created = accounts.lastWhere((a) => a.email == 'new@travery.com');

      expect(created.name, equals('New Employee'));
      expect(created.role, equals(AccountRole.coordinator));
      expect(created.status, equals(AccountStatus.inactive));
    });
  });

  // ── deleteAccount ──────────────────────────────────────────────────────────

  group('deleteAccount', () {
    test('returns Ok and removes the account', () async {
      final result = await repo.deleteAccount(id: 'acc_1');
      expect(result, isA<Ok<void>>());

      final allResult = await repo.getAllAccounts();
      final accounts = (allResult as Ok<List<BusinessAccount>>).value;
      expect(accounts.any((a) => a.id == 'acc_1'), isFalse);
    });

    test('returns Error when account not found', () async {
      final result = await repo.deleteAccount(id: 'non_existent_id');
      expect(result, isA<Error<void>>());
    });
  });

  // ── getAccount ─────────────────────────────────────────────────────────────

  group('getAccount', () {
    test('returns Ok for existing id', () async {
      final result = await repo.getAccount(id: 'acc_2');
      expect(result, isA<Ok<BusinessAccount>>());
      final account = (result as Ok<BusinessAccount>).value;
      expect(account.name, equals('Julian Kross'));
    });

    test('returns Error for non-existent id', () async {
      final result = await repo.getAccount(id: 'xyz_not_found');
      expect(result, isA<Error<BusinessAccount>>());
    });
  });

  // ── getAllVehicles ─────────────────────────────────────────────────────────

  group('getAllVehicles', () {
    test('vehicles have non-empty plateNumbers', () async {
      final result = await repo.getAllVehicles();
      final vehicles = (result as Ok<List<BusinessCoach>>).value;
      for (final v in vehicles) {
        expect(v.plateNumber, isNotEmpty);
      }
    });
  });

  // ── getAllHotels ───────────────────────────────────────────────────────────

  group('getAllHotels', () {
    test('returns Ok with 8 hotels', () async {
      final result = await repo.getAllHotels();
      expect(result, isA<Ok<List<BusinessHotel>>>());
      final hotels = (result as Ok<List<BusinessHotel>>).value;
      expect(hotels.length, equals(8));
    });

    test('BusinessHotel occupancy rates are between 0 and 1', () async {
      final result = await repo.getAllHotels();
      final hotels = (result as Ok<List<BusinessHotel>>).value;
      for (final h in hotels) {
        expect(h.occupancyRate, greaterThanOrEqualTo(0.0));
        expect(h.occupancyRate, lessThanOrEqualTo(1.0));
      }
    });

    test('BusinessHotel ratings are between 1 and 5', () async {
      final result = await repo.getAllHotels();
      final hotels = (result as Ok<List<BusinessHotel>>).value;
      for (final h in hotels) {
        expect(h.starRating, greaterThanOrEqualTo(1.0));
        expect(h.starRating, lessThanOrEqualTo(5.0));
      }
    });
  });

  // ── getAllTours ────────────────────────────────────────────────────────────

  group('getAllTours', () {
    test('returns Ok with 5 tours', () async {
      final result = await repo.getAllTours();
      expect(result, isA<Ok<List<BusinessTour>>>());
      final tours = (result as Ok<List<BusinessTour>>).value;
      expect(tours.length, equals(5));
    });

    test('tours are sorted by rank', () async {
      final result = await repo.getAllTours();
      final tours = (result as Ok<List<BusinessTour>>).value;
      for (int i = 0; i < tours.length - 1; i++) {
        expect(tours[i].rank, lessThan(tours[i + 1].rank));
      }
    });

    test('tours have up and down trends', () async {
      final result = await repo.getAllTours();
      final tours = (result as Ok<List<BusinessTour>>).value;
      expect(tours.any((t) => t.trend == TourTrend.up), isTrue);
      expect(tours.any((t) => t.trend == TourTrend.down), isTrue);
    });
  });

  // ── getTourSummaryStats ────────────────────────────────────────────────────

  group('getTourSummaryStats', () {
    test('returns Ok with TourSummary', () async {
      final result = await repo.getTourSummaryStats();
      expect(result, isA<Ok<TourSummary>>());
    });

    test('stats have expected values', () async {
      final result = await repo.getTourSummaryStats();
      final stats = (result as Ok<TourSummary>).value;
      expect(stats.completed, equals(1284));
      expect(stats.ongoing, equals(42));
      expect(stats.avgRating, equals(4.8));
    });
  });
}
