import 'dart:convert';
import 'dart:io';

import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/data/seed_models/tour_completed/tour_completed.dart';
import 'package:travery_frontend/data/repositories/tour_completed_repository.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class TourCompletedRepositoryImpl implements TourCompletedRepository {
  TourCompletedRepositoryImpl({
    required TokenRefreshService tokenRefreshService,
  }) : _tokenRefreshService = tokenRefreshService;

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
  Future<Result<TourCompletedDetail?>> getTourCompletedDetail({
    required String missionId,
    String? tourId,
    String? tourInstanceId,
  }) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/staff/guide/instances/$missionId',
        ),
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

        final detail = _mapToTourCompletedDetail(data);
        return Result.ok(detail);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lấy chi tiết tour đã hoàn thành thất bại',
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
  Future<Result<List<TourCompletedSummary>>> getCompletedTours() async {
    // Get all guide instances and filter for completed ones
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

        final completedTours = data
            .where((e) {
              final map = e as Map<String, dynamic>;
              return map['status'] == 'COMPLETED';
            })
            .map((e) {
              final map = e as Map<String, dynamic>;
              return _mapToTourCompletedSummary(map);
            })
            .toList();

        return Result.ok(completedTours);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lấy danh sách tour đã hoàn thành thất bại',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  TourCompletedDetail _mapToTourCompletedDetail(Map<String, dynamic> map) {
    final startDateStr = map['startDate'] as String?;

    int totalPassengers = 0;
    int totalAdults = 0;
    int totalChildren = 0;

    final bookings = map['bookings'] as List<dynamic>? ?? [];
    for (final booking in bookings) {
      final members = booking['members'] as List<dynamic>? ?? [];
      for (final member in members) {
        totalPassengers++;
        if (member['memberType'] == 'CHILD') {
          totalChildren++;
        } else {
          totalAdults++;
        }
      }
    }

    return TourCompletedDetail(
      id: map['id'] as String? ?? '',
      missionId: map['id'] as String? ?? '',
      tripCode: (map['id'] as String? ?? '').length >= 8
          ? (map['id'] as String).substring(0, 8).toUpperCase()
          : '',
      title: '${map['tourName'] ?? ''} - ${map['destinationName'] ?? ''}',
      date: startDateStr != null
          ? DateTime.tryParse(startDateStr) ?? DateTime.now()
          : DateTime.now(),
      status: TourCompletedStatus.completed,
      totalPassengers: totalPassengers,
      presentPassengers: totalAdults + totalChildren,
      absentPassengers: 0,
      completedSteps: [],
      incidents: [],
    );
  }

  TourCompletedSummary _mapToTourCompletedSummary(Map<String, dynamic> map) {
    final startDateStr = map['startDate'] as String?;

    return TourCompletedSummary(
      id: map['id'] as String? ?? '',
      missionId: map['id'] as String? ?? '',
      tripCode: (map['id'] as String? ?? '').length >= 8
          ? (map['id'] as String).substring(0, 8).toUpperCase()
          : '',
      title: '${map['tourName'] ?? ''} - ${map['destinationName'] ?? ''}',
      date: startDateStr != null
          ? DateTime.tryParse(startDateStr) ?? DateTime.now()
          : DateTime.now(),
      status: TourCompletedStatus.completed,
      totalPassengers: 0,
      presentPassengers: 0,
      absentPassengers: 0,
    );
  }
}
