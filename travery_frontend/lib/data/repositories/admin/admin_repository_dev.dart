import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/seed_models/room/room.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'package:travery_frontend/domain/models/admin/business_account/business_account.dart';
import 'package:travery_frontend/domain/models/admin/business_dashboard/business_dashboard.dart';
import 'package:travery_frontend/domain/models/admin/business_coach/business_coach.dart';
import 'package:travery_frontend/domain/models/admin/business_hotel/business_hotel.dart';
import 'package:travery_frontend/domain/models/admin/business_tour/business_tour.dart';
import 'package:travery_frontend/domain/models/admin/tour_summary/tour_summary.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour_template/coordinator_tour_template.dart';

/// Development/local implementation of [AdminRepository] that returns
/// in-memory seed data. Simulates a network delay of 300 ms.
class AdminRepositoryDev extends AdminRepository {
  // ── Seed data ──────────────────────────────────────────────────────────────

  static final List<BusinessAccount> _accounts = [
    BusinessAccount(
      id: 'acc_1',
      name: 'Alex Morgan',
      email: 'alex.morgan@travery.com',
      role: AccountRole.guide,
      status: AccountStatus.active,
      avatarUrl: 'https://i.pravatar.cc/150?u=acc_1',
    ),
    BusinessAccount(
      id: 'acc_2',
      name: 'Julian Kross',
      email: 'j.kross@travery.com',
      role: AccountRole.coordinator,
      status: AccountStatus.active,
      avatarUrl: 'https://i.pravatar.cc/150?u=acc_2',
    ),
    BusinessAccount(
      id: 'acc_3',
      name: 'Sarah Chen',
      email: 's.chen@travery.com',
      role: AccountRole.receptionist,
      status: AccountStatus.inactive,
      avatarUrl: 'https://i.pravatar.cc/150?u=acc_3',
    ),
    BusinessAccount(
      id: 'acc_4',
      name: 'Marcus Reed',
      email: 'm.reed@travery.com',
      role: AccountRole.guide,
      status: AccountStatus.active,
      avatarUrl: 'https://i.pravatar.cc/150?u=acc_4',
    ),
    BusinessAccount(
      id: 'acc_5',
      name: 'Linh Nguyễn',
      email: 'l.nguyen@travery.com',
      role: AccountRole.coordinator,
      status: AccountStatus.active,
      avatarUrl: 'https://i.pravatar.cc/150?u=acc_5',
    ),
    BusinessAccount(
      id: 'acc_6',
      name: 'Trần Minh Khoa',
      email: 't.minhkhoa@travery.com',
      role: AccountRole.receptionist,
      status: AccountStatus.active,
      avatarUrl: 'https://i.pravatar.cc/150?u=acc_6',
    ),
    BusinessAccount(
      id: 'acc_7',
      name: 'Nguyễn Thị Hoa',
      email: 'n.thihoa@travery.com',
      role: AccountRole.guide,
      status: AccountStatus.inactive,
      avatarUrl: 'https://i.pravatar.cc/150?u=acc_7',
    ),
    BusinessAccount(
      id: 'acc_8',
      name: 'David Park',
      email: 'd.park@travery.com',
      role: AccountRole.coordinator,
      status: AccountStatus.active,
      avatarUrl: 'https://i.pravatar.cc/150?u=acc_8',
    ),
  ];

  static final List<BusinessCoach> _vehicles = [
    BusinessCoach(
      id: 'veh_1',
      plateNumber: '51B - 882.41',
      coachType: CoachType.limousine.toString(),
      seatCount: 22,
    ),
    BusinessCoach(
      id: 'veh_2',
      plateNumber: '29B - 110.02',
      coachType: 'Standard',
      seatCount: 45,
    ),
    BusinessCoach(
      id: 'veh_3',
      plateNumber: '59B - 564.29',
      coachType: 'Limousine',
      seatCount: 9,
    ),
    BusinessCoach(
      id: 'veh_4',
      plateNumber: '49B - 023.15',
      coachType: 'Standard',
      seatCount: 34,
    ),
    BusinessCoach(
      id: 'veh_5',
      plateNumber: '30A - 765.33',
      coachType: 'VIP Sleeper',
      seatCount: 18,
    ),
    BusinessCoach(
      id: 'veh_6',
      plateNumber: '79C - 441.88',
      coachType: 'Standard',
      seatCount: 40,
    ),
  ];

  static final List<BusinessHotel> _hotels = [
    BusinessHotel(
      id: 'hot_1',
      name: 'Grand Diamond Saigon',
      address: 'Quận 1',
      cityProvince: 'TP. Hồ Chí Minh',
      roomCount: 120,
      occupancyRate: 0.92,
      starRating: 4.8,
      imageUrl:
          'https://images.unsplash.com/photo-1566073771259-4e6a850e645b?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80',
    ),
    BusinessHotel(
      id: 'hot_2',
      name: 'Coastal Breeze Resort',
      address: 'Ngũ Hành Sơn',
      cityProvince: 'Đà Nẵng',
      roomCount: 85,
      occupancyRate: 0.78,
      starRating: 4.9,
    ),
    BusinessHotel(
      id: 'hot_3',
      name: 'Urban Sky Suites',
      address: 'Hoàn Kiếm',
      cityProvince: 'Hà Nội',
      roomCount: 45,
      occupancyRate: 0.64,
      starRating: 4.2,
    ),
    BusinessHotel(
      id: 'hot_4',
      name: 'Pine Valley Retreat',
      address: 'Đà Lạt',
      cityProvince: 'Lâm Đồng',
      roomCount: 30,
      occupancyRate: 0.88,
      starRating: 4.9,
    ),
    BusinessHotel(
      id: 'hot_5',
      name: 'Pearl Island Resort',
      address: 'Phú Quốc',
      cityProvince: 'Kiên Giang',
      roomCount: 210,
      occupancyRate: 0.45,
      starRating: 4.7,
    ),
    BusinessHotel(
      id: 'hot_6',
      name: 'Ancient Town Villas',
      address: 'Hội An',
      cityProvince: 'Quảng Nam',
      roomCount: 18,
      occupancyRate: 1.0,
      starRating: 4.6,
    ),
    BusinessHotel(
      id: 'hot_7',
      name: 'Cliff Edge BusinessHotel',
      address: 'Nha Trang',
      cityProvince: 'Khánh Hòa',
      roomCount: 65,
      occupancyRate: 0.52,
      starRating: 4.4,
    ),
    BusinessHotel(
      id: 'hot_8',
      name: 'Metropolis Lodge',
      address: 'Bình Thạnh',
      cityProvince: 'TP. HCM',
      roomCount: 54,
      occupancyRate: 0.71,
      starRating: 4.3,
    ),
  ];

  static final List<BusinessTour> _tours = [
    BusinessTour(
      id: 'tour_1',
      rank: 1,
      tourName: 'Hạ Long – Cát Bà 3N2D',
      category: 'Cruise & Luxury Resort',
      trend: TourTrend.up,
      imageUrl:
          'https://images.unsplash.com/photo-1543726016-0a9e60a594e4?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80',
    ),
    BusinessTour(
      id: 'tour_2',
      rank: 2,
      tourName: 'Phố cổ Hội An – Đà Nẵng',
      category: 'Văn hóa & Ẩm thực',
      trend: TourTrend.up,
    ),
    BusinessTour(
      id: 'tour_3',
      rank: 3,
      tourName: 'Sapa – Đỉnh Fansipan',
      category: 'Trekking & Trải nghiệm',
      trend: TourTrend.up,
    ),
    BusinessTour(
      id: 'tour_4',
      rank: 4,
      tourName: 'Phú Quốc Pearl Island',
      category: 'Nghỉ dưỡng 5 sao',
      trend: TourTrend.down,
    ),
    BusinessTour(
      id: 'tour_5',
      rank: 5,
      tourName: 'Cố đô Huế – Lăng tẩm',
      category: 'Lịch sử & Di sản',
      trend: TourTrend.up,
    ),
  ];

  static const BusinessDashboard _dashboardStats = BusinessDashboard(
    totalRevenue: 4820150,
    totalBooking: 12842,
    netProfit: 1204500,
    revenueGrowthPercent: 12.4,
    bookingGrowthPercent: 5.2,
    profitGrowthPercent: 8.1,
    ongoingTours: 24,
    vehicleUtilizationPercent: 88,
    hotelOccupancyPercent: 94,
    systemStabilityPercent: 99.9,
    tourRevenueM: 400,
    carRevenueM: 400,
    hotelRevenueM: 400,
    tourRevenueQuarterM: 320,
    carRevenueQuarterM: 360,
    hotelRevenueQuarterM: 450,
  );

  static const TourSummary _tourSummaryStats = TourSummary(
    completed: 1284,
    ongoing: 42,
    occupancyRate: 94,
    avgRating: 4.8,
    cancellations: 2,
  );

  // ── Mutable copies for CRUD operations ─────────────────────────────────────

  final List<BusinessAccount> _mutableAccounts = List.of(_accounts);
  final List<BusinessCoach> _mutableVehicles = List.of(_vehicles);
  final List<BusinessHotel> _mutableHotels = List.of(_hotels);
  final List<BusinessTour> _mutableTours = List.of(_tours);

  // ── Helpers ────────────────────────────────────────────────────────────────

  Future<Result<T>> _delay<T>(T value) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return Result.ok(value);
  }

  // ── Dashboard ──────────────────────────────────────────────────────────────

  @override
  Future<Result<BusinessDashboard>> getDashboardStats() =>
      _delay(_dashboardStats);

  @override
  Future<Result<List<double>>> getRevenueByMonth({
    required int month,
    required int year,
  }) {
    // Returns [tourRevenue, carRevenue, hotelRevenue] per month (unit: triệu VNĐ).
    // Simulates seasonal fluctuation based on month.
    const monthlyData = <int, List<double>>{
      1: [280, 310, 350],
      2: [320, 290, 380],
      3: [370, 340, 400],
      4: [410, 360, 420],
      5: [390, 380, 410],
      6: [450, 420, 460],
      7: [500, 470, 510],
      8: [480, 440, 490],
      9: [420, 400, 440],
      10: [460, 430, 470],
      11: [380, 370, 400],
      12: [440, 410, 450],
    };
    final data = monthlyData[month] ?? [400.0, 400.0, 400.0];
    return _delay(data);
  }

  // ── Accounts ───────────────────────────────────────────────────────────────

  @override
  Future<Result<List<BusinessAccount>>> getAllAccounts() =>
      _delay(List.unmodifiable(_mutableAccounts));

  @override
  Future<Result<BusinessAccount>> getAccount({required String id}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return Result.ok(_mutableAccounts.firstWhere((a) => a.id == id));
    } catch (_) {
      return Result.error(Exception('Account not found: $id'));
    }
  }

  @override
  Future<Result<void>> createAccount({
    required String name,
    required String email,
    required String employeeId,
    required String role,
    required bool isActive,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final newId = 'acc_${_mutableAccounts.length + 1}';
    _mutableAccounts.add(
      BusinessAccount(
        id: newId,
        name: name,
        email: email,
        role: _parseRole(role),
        status: isActive ? AccountStatus.active : AccountStatus.inactive,
      ),
    );
    notifyListeners();
    return const Result.ok(null);
  }

  @override
  Future<Result<void>> updateAccount({
    required String id,
    required String name,
    required String email,
    required String employeeId,
    required String role,
    required bool isActive,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final idx = _mutableAccounts.indexWhere((a) => a.id == id);
    if (idx == -1) {
      return Result.error(Exception('Account not found: $id'));
    }
    final existing = _mutableAccounts[idx];
    _mutableAccounts[idx] = BusinessAccount(
      id: existing.id,
      name: name,
      email: email,
      role: _parseRole(role),
      status: isActive ? AccountStatus.active : AccountStatus.inactive,
      avatarUrl: existing.avatarUrl,
    );
    notifyListeners();
    return const Result.ok(null);
  }

  @override
  Future<Result<void>> deleteAccount({required String id}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final lengthBefore = _mutableAccounts.length;
    _mutableAccounts.removeWhere((a) => a.id == id);
    if (_mutableAccounts.length == lengthBefore) {
      return Result.error(Exception('Account not found: $id'));
    }
    notifyListeners();
    return const Result.ok(null);
  }

  // ── Vehicles ───────────────────────────────────────────────────────────────

  @override
  Future<Result<List<BusinessCoach>>> getAllVehicles() =>
      _delay(List.unmodifiable(_mutableVehicles));

  @override
  Future<Result<BusinessCoach>> getVehicle({required String id}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return Result.ok(_mutableVehicles.firstWhere((v) => v.id == id));
    } catch (_) {
      return Result.error(Exception('Vehicle not found: $id'));
    }
  }

  // ── Hotels ────────────────────────────────────────────────────────────────

  @override
  Future<Result<List<BusinessHotel>>> getAllHotels() =>
      _delay(List.unmodifiable(_mutableHotels));

  @override
  Future<Result<BusinessHotel>> getHotel({required String id}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return Result.ok(_mutableHotels.firstWhere((h) => h.id == id));
    } catch (_) {
      return Result.error(Exception('Hotel not found: $id'));
    }
  }

  // ── Tours ──────────────────────────────────────────────────────────────────

  @override
  Future<Result<List<BusinessTour>>> getAllTours() =>
      _delay(List.unmodifiable(_mutableTours));

  @override
  Future<Result<BusinessTour>> getTour({required String id}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return Result.ok(_mutableTours.firstWhere((t) => t.id == id));
    } catch (_) {
      return Result.error(Exception('BusinessTour not found: $id'));
    }
  }

  @override
  Future<Result<TourSummary>> getTourSummaryStats() =>
      _delay(_tourSummaryStats);

  // ── Private helpers ────────────────────────────────────────────────────────

  AccountRole _parseRole(String role) {
    switch (role) {
      case 'coordinator':
        return AccountRole.coordinator;
      case 'receptionist':
        return AccountRole.receptionist;
      default:
        return AccountRole.guide;
    }
  }

  // @override
  // Future<Result<void>> addHotel({
  //   required String name,
  //   required String address,
  //   required String phone,
  //   required int totalRooms,
  //   required String status,
  //   required double pricePerNight,
  // }) async {
  //   await Future.delayed(const Duration(milliseconds: 300));
  //   final newId = 'hot_${_mutableHotels.length + 1}';
  //   _mutableHotels.add(
  //     BusinessHotel(
  //       id: newId,
  //       name: name,
  //       address: address.split(',').first,
  //       cityProvince: address,
  //       roomCount: totalRooms,
  //       occupancyRate: 0.0,
  //       starRating: 5.0,
  //     ),
  //   );
  //   notifyListeners();
  //   return const Result.ok(null);
  // }

  // @override
  // Future<Result<void>> addRoom({
  //   required String hotelId,
  //   required String roomType,
  //   required int capacity,
  //   required double price,
  // }) async {
  //   await Future.delayed(const Duration(milliseconds: 300));
  //   return const Result.ok(null);
  // }

  // @override
  // Future<Result<void>> addVehicle({
  //   required String name,
  //   required String code,
  //   required String licensePlate,
  //   required int seatCount,
  //   required String status,
  //   required double rentalPrice,
  // }) async {
  //   await Future.delayed(const Duration(milliseconds: 300));
  //   final newId = 'veh_${_mutableVehicles.length + 1}';
  //   _mutableVehicles.add(
  //     BusinessCoach(
  //       id: newId,
  //       plateNumber: licensePlate,
  //       coachType: name,
  //       seatCount: seatCount,
  //     ),
  //   );
  //   notifyListeners();
  //   return const Result.ok(null);
  // }

  @override
  Future<Result<void>> deleteHotel({required String id}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final lengthBefore = _mutableHotels.length;
    _mutableHotels.removeWhere((h) => h.id == id);
    if (_mutableHotels.length == lengthBefore) {
      return Result.error(Exception('Hotel not found: $id'));
    }
    notifyListeners();
    return const Result.ok(null);
  }

  // @override
  // Future<Result<void>> deleteRoom({required String roomId}) async {
  //   await Future.delayed(const Duration(milliseconds: 300));
  //   return const Result.ok(null);
  // }

  // @override
  // Future<Result<void>> updateHotel({
  //   required String id,
  //   required String name,
  //   required String address,
  //   required String cityProvince,
  //   required double starRating,
  //   required String status,
  // }) async {
  //   await Future.delayed(const Duration(milliseconds: 300));
  //   final idx = _mutableHotels.indexWhere((h) => h.id == id);
  //   if (idx == -1) {
  //     return Result.error(Exception('Hotel not found: $id'));
  //   }
  //   final existing = _mutableHotels[idx];
  //   _mutableHotels[idx] = BusinessHotel(
  //     id: existing.id,
  //     name: name,
  //     address: address.split(',').first,
  //     cityProvince: cityProvince,
  //     occupancyRate: existing.occupancyRate,
  //     starRating: starRating,
  //   );
  //   notifyListeners();
  //   return const Result.ok(null);
  // }

  // @override
  // Future<Result<void>> createHotel({
  //   required String name,
  //   required String address,
  //   required String cityProvince,
  //   required int roomCount,
  //   required double pricePerNight,
  // }) async {
  //   await Future.delayed(const Duration(milliseconds: 300));
  //   notifyListeners();
  //   return const Result.ok(null);
  // }

  // @override
  // Future<Result<void>> createRoom({
  //   required String roomId,
  //   required String roomType,
  //   required int capacity,
  //   required double price,
  // }) async {
  //   await Future.delayed(const Duration(milliseconds: 300));
  //   notifyListeners();
  //   return const Result.ok(null);
  // }

  // @override
  // Future<Result<void>> updateRoom({
  //   required String roomId,
  //   required String roomType,
  //   required int capacity,
  //   required double price,
  // }) async {
  //   await Future.delayed(const Duration(milliseconds: 300));
  //   return const Result.ok(null);
  // }

  // @override
  // Future<Result<void>> updateVehicle({
  //   required String id,
  //   required String name,
  //   required String code,
  //   required String licensePlate,
  //   required int seatCount,
  //   required String status,
  //   required double rentalPrice,
  // }) async {
  //   await Future.delayed(const Duration(milliseconds: 300));
  //   final idx = _mutableVehicles.indexWhere((v) => v.id == id);
  //   if (idx == -1) {
  //     return Result.error(Exception('Vehicle not found: $id'));
  //   }
  //   final existing = _mutableVehicles[idx];
  //   _mutableVehicles[idx] = BusinessCoach(
  //     id: existing.id,
  //     routeFrom: existing.routeFrom,
  //     routeTo: existing.routeTo,
  //     status: status.toLowerCase() == 'running'
  //         ? CoachStatus.running
  //         : CoachStatus.available,
  //     plateNumber: licensePlate,
  //     coachType: name,
  //     seatCount: seatCount,
  //     driverName: existing.driverName,
  //   );
  //   notifyListeners();
  //   return const Result.ok(null);
  // }

  @override
  Future<Result<void>> createVehicle({
    required String registrationNumber,
    required String model,
    required String type,
    required int seatCount,
    required bool isAvailable,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    notifyListeners();
    return const Result.ok(null);
  }

  @override
  Future<Result<void>> deleteVehicle({required String id}) async {
    await Future.delayed(const Duration(milliseconds: 300));
    notifyListeners();
    return const Result.ok(null);
  }

  @override
  Future<Result<List<Room>>> getAllRooms({required String hotelId}) {
    throw UnimplementedError();
  }

  @override
  Future<Result<Room>> getRoom({required String id}) {
    // TODO: implement getRoom
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> createHotel({
    required String id,
    required String name,
    required String address,
    required String cityProvince,
    required double starRating,
    required String status,
  }) {
    // TODO: implement createHotel
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> createRoom({
    required String hotelId,
    required String roomName,
    required String roomType,
    required double pricePerNight,
    required int capacity,
    required int maxAdults,
    required int maxChildren,
    required String status,
  }) {
    // TODO: implement createRoom
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> deleteRoom({required String id}) {
    // TODO: implement deleteRoom
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> updateHotel({
    required String id,
    required String name,
    required String address,
    required int starRating,
    required String cityProvince,
    required String status,
  }) {
    // TODO: implement updateHotel
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> updateRoom({
    required String id,
    required String roomNumber,
    required String roomType,
    required double pricePerNight,
    required int capacity,
    required int maxAdults,
    required int maxChildren,
    required String status,
  }) {
    // TODO: implement updateRoom
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> updateVehicle({
    required String id,
    required String registrationNumber,
    required String model,
    required String type,
    required int seatCount,
    required bool isAvailable,
  }) {
    // TODO: implement updateVehicle
    throw UnimplementedError();
  }

  // ── Tour Templates ─────────────────────────────────────────────

  @override
  Future<Result<List<CoordinatorTourTemplate>>> getTourTemplates() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const Result.ok([]);
  }

  @override
  Future<Result<void>> createTourTemplate({
    required String name,
    required String description,
    required String destinationId,
    String? hotelId,
    required String pickupLocation,
    required double pricePerAdult,
    required double pricePerChild,
    String? refundPolicyId,
    required bool isCustom,
    required List<Map<String, dynamic>> itineraries,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    notifyListeners();
    return const Result.ok(null);
  }
}
