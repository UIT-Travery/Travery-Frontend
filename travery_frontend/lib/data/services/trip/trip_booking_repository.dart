import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/data/models/trip/trip_booking_data.dart';
import 'package:travery_frontend/data/services/security_storage_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class TripBookingRepository {
  TripBookingRepository({
    required SecurityStorageService securityStorageService,
  }) : _securityStorageService = securityStorageService;

  final SecurityStorageService _securityStorageService;

  Future<void> _setBearerAuth(HttpClientRequest request) async {
    final token = await _securityStorageService.getAccessToken();
    if (token != null) {
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

  Future<Result<List<TripBookingData>>> getMyBookings({
    String? status,
    int page = 0,
    int size = 20,
  }) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final queryParams = <String, String>{
        'page': page.toString(),
        'size': size.toString(),
      };
      if (status != null && status.isNotEmpty) {
        queryParams['status'] = status;
      }

      final request = await client.getUrl(
        Uri.https(AppConfig.baseUrl, '/api/v1/coach-bookings', queryParams),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(request);

      final response = await request.close();

      if (response.statusCode == 200) {
        try {
          final stringData = await response.transform(utf8.decoder).join();
          final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
          final content =
              jsonMap['data']?['content'] as List<dynamic>? ??
              jsonMap['data'] as List<dynamic>? ??
              [];
          final bookings = content
              .map((e) => TripBookingData.fromJson(e as Map<String, dynamic>))
              .toList();
          return Result.ok(bookings);
        } on Exception catch (error) {
          return Result.error(error);
        }
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lấy danh sách booking thất bại',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }
}
