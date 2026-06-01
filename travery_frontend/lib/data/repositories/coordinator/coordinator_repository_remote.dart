import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/data/services/api/coordinator_api_service.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';
import 'package:travery_frontend/data/services/api/model/coordinator/tour_instance_detail_response/tour_instance_detail_response.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour/coordinator_tour.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_hotel/coordinator_hotel.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_driver/coordinator_driver.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_vehicle/coordinator_vehicle.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour_template/coordinator_tour_template.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CoordinatorRepositoryRemote extends CoordinatorRepository {
  final CoordinatorApiService _apiService;
  final TokenRefreshService _tokenRefreshService;

  CoordinatorRepositoryRemote({
    required CoordinatorApiService apiService,
    required TokenRefreshService tokenRefreshService,
  }) : _apiService = apiService,
       _tokenRefreshService = tokenRefreshService;

  // ── Helpers ────────────────────────────────────────────────────────────────

  Future<String?> _getToken() async {
    final result = await _tokenRefreshService.getValidAccessToken();
    return result is Ok ? (result as Ok<String>).value : null;
  }

  CoordinatorTour _fromDetail(TourInstanceDetailResponse r) {
    return CoordinatorTour(
      id: r.id,
      tourName: r.tourName,
      destinationName: r.destinationName,
      pickupLocation: r.pickupLocation,
      startDate: r.startDate,
      endDate: r.endDate,
      minParticipants: r.minParticipants,
      maxParticipants: r.maxParticipants,
      currentParticipants: r.currentParticipants,
      status: r.status,
      guideId: r.guideId,
      guideName: r.guideName,
      guidePhone: r.guidePhone,
      coachId: r.coachId,
      coachLicensePlate: r.coachLicensePlate,
      coachType: r.coachType,
      driverId: r.driverId,
      driverName: r.driverName,
      driverPhone: r.driverPhone,
    );
  }

  // ── Repository Methods ────────────────────────────────────────────────────

  @override
  Future<Result<List<CoordinatorTour>>> getAllTours({
    String filter = 'all',
  }) async {
    try {
      final token = await _getToken();
      if (token == null) return Result.error(Exception('Not authenticated'));

      final result = await _apiService.getCoordinatorInstances(
        accessToken: token,
        filter: filter,
      );

      switch (result) {
        case Ok():
          // The list endpoint returns TourInstanceResponse (summary), so we
          // need to map to CoordinatorTour using the available summary fields.
          final tours = result.value.map((r) {
            return CoordinatorTour(
              id: r.id,
              tourName: '',
              destinationName: '',
              pickupLocation: '',
              startDate: r.startDate,
              endDate: r.endDate,
              minParticipants: 0,
              maxParticipants: r.availableSlots,
              currentParticipants: 0,
              status: r.status,
            );
          }).toList();
          notifyListeners();
          return Result.ok(tours);
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<CoordinatorTour>> getTourById(String id) async {
    try {
      final token = await _getToken();
      if (token == null) return Result.error(Exception('Not authenticated'));

      final result = await _apiService.getCoordinatorInstanceById(
        accessToken: token,
        id: id,
      );

      switch (result) {
        case Ok():
          notifyListeners();
          return Result.ok(_fromDetail(result.value));
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<CoordinatorTour>> createTourInstance({
    required String tourId,
    required String startDate,
    required String endDate,
  }) async {
    try {
      final token = await _getToken();
      if (token == null) return Result.error(Exception('Not authenticated'));

      final result = await _apiService.createCoordinatorInstance(
        accessToken: token,
        tourId: tourId,
        startDate: startDate,
        endDate: endDate,
      );

      switch (result) {
        case Ok():
          notifyListeners();
          return Result.ok(_fromDetail(result.value));
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
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
    try {
      final token = await _getToken();
      if (token == null) return Result.error(Exception('Not authenticated'));

      final result = await _apiService.updateCoordinatorInstance(
        accessToken: token,
        id: id,
        guideId: guideId,
        coachId: coachId,
        driverId: driverId,
        startDate: startDate,
        endDate: endDate,
        status: status,
      );

      switch (result) {
        case Ok():
          notifyListeners();
          return Result.ok(_fromDetail(result.value));
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<CoordinatorTour>> updateTourInstanceStatus({
    required String id,
    required String status,
  }) async {
    try {
      final token = await _getToken();
      if (token == null) return Result.error(Exception('Not authenticated'));

      final result = await _apiService.updateCoordinatorInstanceStatus(
        accessToken: token,
        id: id,
        status: status,
      );

      switch (result) {
        case Ok():
          notifyListeners();
          return Result.ok(_fromDetail(result.value));
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<CoordinatorTourTemplate>>> getTourTemplates() async {
    try {
      final token = await _getToken();
      if (token == null) return Result.error(Exception('Not authenticated'));

      final result = await _apiService.getTourTemplates(accessToken: token);

      switch (result) {
        case Ok():
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
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
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
    String? requestedByUserId,
    required bool isCustom,
    required List<Map<String, dynamic>> itineraries,
  }) async {
    try {
      final token = await _getToken();
      if (token == null) return Result.error(Exception('Not authenticated'));

      final result = await _apiService.createTourTemplate(
        accessToken: token,
        name: name,
        description: description,
        destinationId: destinationId,
        hotelId: hotelId,
        pickupLocation: pickupLocation,
        pricePerAdult: pricePerAdult,
        pricePerChild: pricePerChild,
        refundPolicyId: refundPolicyId,
        requestedByUserId: requestedByUserId,
        isCustom: isCustom,
        itineraries: itineraries,
      );

      switch (result) {
        case Ok():
          return const Result.ok(null);
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
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
}
