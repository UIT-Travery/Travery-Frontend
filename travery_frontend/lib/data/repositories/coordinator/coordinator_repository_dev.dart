import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/data/services/api/model/coordinator/coach_trip_detail_response/coach_trip_detail_response.dart';
import 'package:travery_frontend/data/services/api/model/tour/tour_summart_response/tour_summary_response.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_guide/coordinator_guide.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour/coordinator_tour.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_hotel/coordinator_hotel.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_driver/coordinator_driver.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_vehicle/coordinator_vehicle.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour_template/coordinator_tour_template.dart';
import 'package:travery_frontend/data/services/api/model/coordinator/coach_trip_response/coach_trip_response.dart';
import 'package:travery_frontend/data/services/api/model/coordinator/coach_route_response/coach_route_response.dart';
import 'package:travery_frontend/data/services/api/model/coordinator/refund_response/refund_response.dart';
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

  @override
  Future<Result<List<TourSummaryResponse>>> getTours({
    String? keyword,
    double? minPrice,
    double? maxPrice,
    String? startDate,
    String? destinationId,
    int? minRating,
    int page = 0,
    int size = 20,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const Result.ok([]);
  }

  @override
  Future<Result<List<CoordinatorTour>>> getTourInstances(String tourId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const Result.ok([]);
  }

  @override
  Future<Result<CoordinatorTourTemplate>> updateTemplate({
    required String id,
    required Map<String, dynamic> data,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return Result.error(Exception('Not implemented in dev mode'));
  }

  @override
  Future<Result<void>> deleteTemplate(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const Result.ok(null);
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

  // @override
  // Future<Result<void>> createTourTemplate({
  //   required String name,
  //   required String description,
  //   required String destinationId,
  //   String? hotelId,
  //   required String pickupLocation,
  //   required double pricePerAdult,
  //   required double pricePerChild,
  //   String? refundPolicyId,
  //   String? requestedByUserId,
  //   required bool isCustom,
  //   required List<Map<String, dynamic>> itineraries,
  // }) async {
  //   await Future.delayed(const Duration(milliseconds: 300));
  //   return const Result.ok(null);
  // }

  @override
  Future<Result<CoordinatorTourTemplate>> getTourTemplateById(String id) {
    // TODO: implement getTourTemplateById
    throw UnimplementedError();
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
    List<dynamic>? tourImageBytes,
    List<String>? tourImageNames,
    List<dynamic>? itineraryImageBytes,
    List<String>? itineraryImageNames,
  }) {
    // TODO: implement createTourTemplate
    throw UnimplementedError();
  }

  @override
  Future<Result<List<CoachTripResponse>>> getCoachTrips({
    String? status,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const Result.ok([]);
  }

  @override
  Future<Result<CoachTripDetailResponse>> getCoachTripDetail(String id) {
    // TODO: implement getCoachTripDetail
    throw UnimplementedError();
  }

  @override
  Future<Result<List<CoachRouteResponse>>> getRoutes() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const Result.ok([]);
  }

  @override
  Future<Result<CoachRouteResponse>> createRoute({
    required String originDestinationId,
    required String destinationDestinationId,
    required double distanceKm,
    required int estimatedHours,
    required double basePrice,
    String? refundPolicyId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return Result.error(Exception('Not implemented in dev mode'));
  }

  @override
  Future<Result<CoachTripDetailResponse>> createCoachTrip({
    required String routeId,
    required String coachId,
    required String driverId,
    required String guideId,
    required String departureTime,
  }) {
    // TODO: implement createCoachTrip
    throw UnimplementedError();
  }

  @override
  Future<Result<List<CoordinatorGuide>>> getAllGuides() {
    // TODO: implement getAllGuides
    throw UnimplementedError();
  }

  @override
  Future<Result<Map<String, dynamic>>> getRefunds({
    String? status,
    String? type,
    int page = 0,
    int size = 10,
    String? sort,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const Result.ok({'content': [], 'page': {}});
  }

  @override
  Future<Result<RefundResponse>> processRefund({
    required String refundId,
    required double actualRefunded,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Result<RefundResponse>> rejectRefund({
    required String refundId,
    required String reason,
  }) {
    throw UnimplementedError();
  }
}
