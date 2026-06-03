import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour/coordinator_tour.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_hotel/coordinator_hotel.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_driver/coordinator_driver.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_vehicle/coordinator_vehicle.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour_template/coordinator_tour_template.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// Development/local implementation of [CoordinatorRepository].
/// Returns empty results — use [CoordinatorRepositoryRemote] for real data.
class CoordinatorRepositoryDev extends CoordinatorRepository {
  @override
  Future<Result<List<CoordinatorTour>>> getAllTours({
    String filter = 'all',
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const Result.ok([]);
  }

  @override
  Future<Result<CoordinatorTour>> getTourById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return Result.error(Exception('Not implemented in dev mode'));
  }

  @override
  Future<Result<CoordinatorTour>> createTourInstance({
    required String tourId,
    required String startDate,
    required String endDate,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return Result.error(Exception('Not implemented in dev mode'));
  }

  @override
  Future<Result<CoordinatorTour>> updateTourInstance({
    required String id,
    String? guideId,
    String? coachId,
    String? driverId,
    String? startDate,
    String? endDate,
    String? status,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return Result.error(Exception('Not implemented in dev mode'));
  }

  @override
  Future<Result<CoordinatorTour>> updateTourInstanceStatus({
    required String id,
    required String status,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return Result.error(Exception('Not implemented in dev mode'));
  }

  // ── Stubbed methods for unused bottom sheets ─────────────────────────────
  @override
  Future<Result<List<CoordinatorHotel>>> getAllHotels() async {
    return const Result.ok([]);
  }

  @override
  Future<Result<List<CoordinatorDriver>>> getAllDrivers() async {
    return const Result.ok([]);
  }

  @override
  Future<Result<List<CoordinatorVehicle>>> getAllVehicles() async {
    return const Result.ok([]);
  }

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
    String? requestedByUserId,
    required bool isCustom,
    required List<Map<String, dynamic>> itineraries,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const Result.ok(null);
  }
}
