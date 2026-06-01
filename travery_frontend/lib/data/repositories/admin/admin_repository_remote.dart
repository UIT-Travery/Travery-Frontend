import 'package:travery_frontend/data/repositories/admin/admin_repository.dart';
import 'package:travery_frontend/data/seed_models/room/room.dart';
import 'package:travery_frontend/data/services/api/admin_api_service.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';
import 'package:travery_frontend/domain/models/admin/business_account/business_account.dart';
import 'package:travery_frontend/domain/models/admin/business_coach/business_coach.dart';
import 'package:travery_frontend/domain/models/admin/business_dashboard/business_dashboard.dart';
import 'package:travery_frontend/domain/models/admin/business_hotel/business_hotel.dart';
import 'package:travery_frontend/domain/models/admin/business_tour/business_tour.dart';
import 'package:travery_frontend/domain/models/admin/tour_summary/tour_summary.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour_template/coordinator_tour_template.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// Remote implementation of [AdminRepository] that calls the real backend API.
///
/// Methods backed by real endpoints delegate to [AdminApiService].
/// Methods whose endpoints are not yet available (hotel, vehicle, dashboard)
/// return a [Result.error] so the UI can handle them gracefully.
class AdminRepositoryRemote extends AdminRepository {
  AdminRepositoryRemote({
    required AdminApiService adminApiService,
    required TokenRefreshService tokenRefreshService,
  }) : _adminApiService = adminApiService,
       _tokenRefreshService = tokenRefreshService;

  final AdminApiService _adminApiService;
  final TokenRefreshService _tokenRefreshService;

  // ── Helper ─────────────────────────────────────────────────────────────────

  Future<String?> _getAccessToken() async {
    final result = await _tokenRefreshService.getValidAccessToken();
    return result is Ok ? (result as Ok<String>).value : null;
  }

  static final _notImplemented = Exception('API endpoint not yet available');

  // ── Dashboard ──────────────────────────────────────────────────────────────

  @override
  Future<Result<BusinessDashboard>> getDashboardStats() async {
    return Result.error(_notImplemented);
  }

  @override
  Future<Result<List<double>>> getRevenueByMonth({
    required int month,
    required int year,
  }) async {
    return Result.error(_notImplemented);
  }

  // ── Accounts ───────────────────────────────────────────────────────────────

  @override
  Future<Result<void>> createAccount({
    required String name,
    required String email,
    required String employeeId,
    required String role,
    required bool isActive,
  }) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final apiRole = _mapRoleToApi(role);

    final result = await _adminApiService.createStaff(
      accessToken: token,
      email: email,
      password: employeeId, // employeeId used as initial password
      fullName: name,
      role: apiRole,
    );

    switch (result) {
      case Ok<void>():
        notifyListeners();
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }

  String _mapRoleToApi(String role) {
    switch (role.toLowerCase()) {
      case 'coordinator':
        return 'COORDINATOR';
      case 'receptionist':
        return 'RECEPTIONIST';
      default:
        return 'GUIDE';
    }
  }

  @override
  Future<Result<List<BusinessAccount>>> getAllAccounts() async {
    return const Result.ok([]);
  }

  @override
  Future<Result<BusinessAccount>> getAccount({required String id}) async {
    return Result.error(_notImplemented);
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
    return Result.error(_notImplemented);
  }

  @override
  Future<Result<void>> deleteAccount({required String id}) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.deleteAccount(
      accessToken: token,
      id: id,
    );
    switch (result) {
      case Ok<void>():
        notifyListeners();
        return const Result.ok(null);
      case Error<void>():
        return Result.error(result.error);
    }
  }

  // ── Vehicles ───────────────────────────────────────────────────────────────

  @override
  Future<Result<List<BusinessCoach>>> getAllVehicles() async {
    return const Result.ok([]);
  }

  @override
  Future<Result<BusinessCoach>> getVehicle({required String id}) async {
    return Result.error(_notImplemented);
  }

  @override
  Future<Result<void>> createVehicle({
    required String registrationNumber,
    required String model,
    required String type,
    required int seatCount,
    required bool isAvailable,
  }) async {
    return Result.error(_notImplemented);
  }

  @override
  Future<Result<void>> updateVehicle({
    required String id,
    required String registrationNumber,
    required String model,
    required String type,
    required int seatCount,
    required bool isAvailable,
  }) async {
    return Result.error(_notImplemented);
  }

  @override
  Future<Result<void>> deleteVehicle({required String id}) async {
    return Result.error(_notImplemented);
  }

  // ── Hotels ─────────────────────────────────────────────────────────────────

  @override
  Future<Result<List<BusinessHotel>>> getAllHotels() async {
    return const Result.ok([]);
  }

  @override
  Future<Result<BusinessHotel>> getHotel({required String id}) async {
    return Result.error(_notImplemented);
  }

  @override
  Future<Result<void>> createHotel({
    required String id,
    required String name,
    required String address,
    required String cityProvince,
    required double starRating,
    required String status,
  }) async {
    return Result.error(_notImplemented);
  }

  @override
  Future<Result<void>> updateHotel({
    required String id,
    required String name,
    required String address,
    required int starRating,
    required String cityProvince,
    required String status,
  }) async {
    return Result.error(_notImplemented);
  }

  @override
  Future<Result<void>> deleteHotel({required String id}) async {
    return Result.error(_notImplemented);
  }

  // ── Rooms ──────────────────────────────────────────────────────────────────

  @override
  Future<Result<List<Room>>> getAllRooms({required String hotelId}) async {
    return const Result.ok([]);
  }

  @override
  Future<Result<Room>> getRoom({required String id}) async {
    return Result.error(_notImplemented);
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
  }) async {
    return Result.error(_notImplemented);
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
  }) async {
    return Result.error(_notImplemented);
  }

  @override
  Future<Result<void>> deleteRoom({required String id}) async {
    return Result.error(_notImplemented);
  }

  // ── Tours ──────────────────────────────────────────────────────────────────

  @override
  Future<Result<List<BusinessTour>>> getAllTours() async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.getTours(accessToken: token);
    switch (result) {
      case Ok<List<Map<String, dynamic>>>():
        final tours = result.value.asMap().entries.map((entry) {
          final i = entry.key;
          final map = entry.value;
          return BusinessTour(
            id: map['id'] as String? ?? '',
            rank: i + 1,
            tourName: map['name'] as String? ?? '',
            category: map['destinationName'] as String? ?? '',
            trend: TourTrend.stable,
            imageUrl: map['thumbnailUrl'] as String?,
          );
        }).toList();
        notifyListeners();
        return Result.ok(tours);
      case Error<List<Map<String, dynamic>>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<BusinessTour>> getTour({required String id}) async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.getTourById(
      accessToken: token,
      id: id,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        final map = result.value;
        return Result.ok(
          BusinessTour(
            id: map['id'] as String? ?? '',
            rank: 0,
            tourName: map['name'] as String? ?? '',
            category:
                (map['destination'] as Map<String, dynamic>?)?['name']
                    as String? ??
                '',
            trend: TourTrend.stable,
          ),
        );
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<TourSummary>> getTourSummaryStats() async {
    return Result.error(_notImplemented);
  }

  // ── Tour Templates ─────────────────────────────────────────────

  @override
  Future<Result<List<CoordinatorTourTemplate>>> getTourTemplates() async {
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.getTourTemplates(accessToken: token);
    switch (result) {
      case Ok<List<Map<String, dynamic>>>():
        final templates = result.value.map((map) {
          return CoordinatorTourTemplate(
            id: map['id'] as String? ?? '',
            name: map['name'] as String? ?? '',
            imageUrl: '',
            description: map['description'] as String? ?? '',
            adultPrice: (map['pricePerAdult'] ?? 0).toString(),
            childPrice: (map['pricePerChild'] ?? 0).toString(),
            startTime: '',
            endTime: '',
            minTotalPerson: 0,
            maxTotalPerson: 0,
            itineraries: [],
          );
        }).toList();
        notifyListeners();
        return Result.ok(templates);
      case Error<List<Map<String, dynamic>>>():
        return Result.error(result.error);
    }
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
    final token = await _getAccessToken();
    if (token == null) {
      return Result.error(Exception('Phiên đăng nhập hết hạn'));
    }

    final result = await _adminApiService.createTourTemplate(
      accessToken: token,
      name: name,
      description: description,
      destinationId: destinationId,
      hotelId: hotelId,
      pickupLocation: pickupLocation,
      pricePerAdult: pricePerAdult,
      pricePerChild: pricePerChild,
      refundPolicyId: refundPolicyId,
      isCustom: isCustom,
      itineraries: itineraries,
    );
    switch (result) {
      case Ok<Map<String, dynamic>>():
        notifyListeners();
        return const Result.ok(null);
      case Error<Map<String, dynamic>>():
        return Result.error(result.error);
    }
  }
}
