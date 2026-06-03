import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/api/model/tour/tour_summart_response/tour_summary_response.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour/coordinator_tour.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_hotel/coordinator_hotel.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_driver/coordinator_driver.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_vehicle/coordinator_vehicle.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour_template/coordinator_tour_template.dart';

abstract class CoordinatorRepository extends ChangeNotifier {
  /// GET /api/v1/staff/coordinator/instances
  Future<Result<List<CoordinatorTour>>> getAllTours({String filter = 'all'});

  /// GET /api/v1/staff/coordinator/instances/{id}
  Future<Result<CoordinatorTour>> getTourById(String id);

  /// POST /api/v1/staff/coordinator/instances
  Future<Result<CoordinatorTour>> createTourInstance({
    required String tourId,
    required String startDate,
    required String endDate,
  });

  /// PATCH /api/v1/staff/coordinator/instances/{id}
  Future<Result<CoordinatorTour>> updateTourInstance({
    required String id,
    String? guideId,
    String? coachId,
    String? driverId,
    String? startDate,
    String? endDate,
    String? status,
  });

  /// PATCH /api/v1/staff/coordinator/instances/{id}/status
  Future<Result<CoordinatorTour>> updateTourInstanceStatus({
    required String id,
    required String status,
  });

  /// GET /api/v1/tours/templates — list tour templates.
  Future<Result<List<CoordinatorTourTemplate>>> getTourTemplates();

  /// GET /api/v1/tours — search tours (paginated). Returns summary list.
  Future<Result<List<TourSummaryResponse>>> getTours({
    String? keyword,
    double? minPrice,
    double? maxPrice,
    String? startDate,
    String? destinationId,
    int? minRating,
    int page = 0,
    int size = 20,
  });

  /// GET /api/v1/tours/{id}/instances — get instances for a template tour.
  Future<Result<List<CoordinatorTour>>> getTourInstances(String tourId);

  /// POST /api/v1/tours/templates
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
  });

  /// PATCH /api/v1/tours/templates/{id}
  Future<Result<CoordinatorTourTemplate>> updateTemplate({
    required String id,
    required Map<String, dynamic> data,
  });

  /// DELETE /api/v1/tours/templates/{id}
  Future<Result<void>> deleteTemplate(String id);

  // ── Stubbed methods for unused bottom sheets ─────────────────────────────
  Future<Result<List<CoordinatorHotel>>> getAllHotels();
  Future<Result<List<CoordinatorDriver>>> getAllDrivers();
  Future<Result<List<CoordinatorVehicle>>> getAllVehicles();
}
