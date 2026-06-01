import 'dart:convert';
import 'dart:io';

import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/data/seed_models/guide_tour/guide_tour.dart';
import 'package:travery_frontend/data/services/guide/guide_service.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class GuideServiceImpl implements GuideService {
  GuideServiceImpl({required TokenRefreshService tokenRefreshService})
    : _tokenRefreshService = tokenRefreshService;

  final TokenRefreshService _tokenRefreshService;

  Future<void> _setBearerAuth(HttpClientRequest request) async {
    final result = await _tokenRefreshService.getValidAccessToken();
    if (result is Ok) {
      final token = (result as Ok<String>).value;
      request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $token');
    }
  }

  Future<String> _extractErrorMessage(
    HttpClientResponse response,
    String defaultMessage,
  ) async {
    try {
      final stringData = await response.transform(utf8.decoder).join();
      final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
      return jsonMap['message'] as String? ?? defaultMessage;
    } catch (_) {
      return defaultMessage;
    }
  }

  @override
  Future<Result<List<GuideTour>>> getGuideTours() async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/staff/guide/instances'),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(request);

      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as List<dynamic>? ?? [];

        final tours = data.map((e) {
          final map = e as Map<String, dynamic>;
          return _mapToGuideTour(map);
        }).toList();

        return Result.ok(tours);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lấy danh sách tour thất bại',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  @override
  Future<Result<GuideTour?>> getGuideTourById(String id) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/staff/guide/instances/$id'),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(request);

      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>?;

        if (data == null) return Result.ok(null);
        return Result.ok(_mapToGuideTour(data));
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lấy chi tiết tour thất bại',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  @override
  Future<Result<List<GuideTour>>> getGuideToursByStatus(
    GuideTourStatus status,
  ) async {
    final result = await getGuideTours();
    switch (result) {
      case Ok(value: final tours):
        final filtered = tours.where((t) => t.status == status).toList();
        return Result.ok(filtered);
      case Error(error: final e):
        return Result.error(e);
    }
  }

  GuideTour _mapToGuideTour(Map<String, dynamic> map) {
    // Map API response to GuideTour model
    // API returns: id, tourName, destinationName, pickupLocation,
    // startDate, endDate, status, coachId, coachLicensePlate, coachType,
    // driverId, driverName, driverPhone, bookings[]

    final startDateStr = map['startDate'] as String?;
    final endDateStr = map['endDate'] as String?;
    final statusStr = map['status'] as String? ?? 'PLANNING';

    // Determine GuideTourStatus based on instance status
    GuideTourStatus guideStatus;
    switch (statusStr) {
      case 'IN_PROGRESS':
        guideStatus = GuideTourStatus.ongoing;
        break;
      case 'COMPLETED':
        guideStatus = GuideTourStatus.completed;
        break;
      case 'PLANNING':
      case 'OPEN':
      case 'FULL':
      default:
        guideStatus = GuideTourStatus.upcoming;
        break;
    }

    // Count total passengers from bookings
    int groupSize = 0;
    final bookings = map['bookings'] as List<dynamic>? ?? [];
    for (final booking in bookings) {
      final members = booking['members'] as List<dynamic>? ?? [];
      groupSize += members.length;
    }

    return GuideTour(
      id: map['id'] as String?,
      tourInstanceId: map['id'] as String? ?? '',
      tourId: map['tourId'] as String? ?? '',
      tourName: map['tourName'] as String? ?? '',
      startDate: startDateStr != null
          ? DateTime.tryParse(startDateStr) ?? DateTime.now()
          : DateTime.now(),
      endDate: endDateStr != null
          ? DateTime.tryParse(endDateStr) ?? DateTime.now()
          : DateTime.now(),
      groupSize: groupSize,
      groupDescription:
          'Tour ${map['tourName'] ?? ''} - ${map['destinationName'] ?? ''}',
      status: guideStatus,
      vehiclePlate: map['coachLicensePlate'] as String?,
      driverName: map['driverName'] as String?,
    );
  }
}
