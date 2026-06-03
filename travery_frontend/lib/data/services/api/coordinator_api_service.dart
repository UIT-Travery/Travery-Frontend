import 'dart:convert';
import 'dart:io';

import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/data/services/api/model/coordinator/tour_incident_response/tour_incident_response.dart';
import 'package:travery_frontend/data/services/api/model/coordinator/tour_instance_detail_response/tour_instance_detail_response.dart';
import 'package:travery_frontend/data/services/api/model/tour/tour_instance_response/tour_instance_response.dart';
import 'package:travery_frontend/utils/core_result.dart';

/// Service for coordinator staff GET APIs.
class CoordinatorApiService {
  CoordinatorApiService({String? host, HttpClient Function()? clientFactory})
    : _host = host ?? AppConfig.baseUrl,
      _clientFactory = clientFactory ?? HttpClient.new;

  final String _host;
  final HttpClient Function() _clientFactory;

  // ── Helpers ────────────────────────────────────────────────────────────────

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

  HttpClientRequest _addAuth(HttpClientRequest request, String accessToken) {
    request.headers.set(HttpHeaders.authorizationHeader, 'Bearer $accessToken');
    return request;
  }

  // ── Coordinator Instance APIs ───────────────────────────────────────────────

  /// GET /api/v1/staff/coordinator/instances — list coordinator's tour instances.
  ///
  /// [filter] can be 'all', 'upcoming', 'past', etc.
  Future<Result<List<TourInstanceResponse>>> getCoordinatorInstances({
    required String accessToken,
    String filter = 'all',
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/staff/coordinator/instances', {
        'filter': filter,
      });
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final rawData = jsonMap['data'] as List<dynamic>? ?? [];
        final instances = rawData
            .map(
              (e) => TourInstanceResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        return Result.ok(instances);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Get Coordinator Instances Error',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// GET /api/v1/staff/coordinator/instances/{id} — get full detail of one coordinator instance.
  Future<Result<TourInstanceDetailResponse>> getCoordinatorInstanceById({
    required String accessToken,
    required String id,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/staff/coordinator/instances/$id');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>;
        return Result.ok(TourInstanceDetailResponse.fromJson(data));
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Get Coordinator Instance Error',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// GET /api/v1/staff/coordinator/instances/{id}/incidents — list incidents for a coordinator instance.
  Future<Result<List<TourIncidentResponse>>> getCoordinatorInstanceIncidents({
    required String accessToken,
    required String id,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(
        _host,
        '/api/v1/staff/coordinator/instances/$id/incidents',
      );
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final rawData = jsonMap['data'] as List<dynamic>? ?? [];
        final incidents = rawData
            .map(
              (e) => TourIncidentResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        return Result.ok(incidents);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Get Coordinator Incidents Error',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// POST /api/v1/staff/coordinator/instances — create a new coordinator tour instance.
  Future<Result<TourInstanceDetailResponse>> createCoordinatorInstance({
    required String accessToken,
    required String tourId,
    required String startDate,
    required String endDate,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/staff/coordinator/instances');
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;
      final body = jsonEncode({
        'tourId': tourId,
        'startDate': startDate,
        'endDate': endDate,
      });
      request.contentLength = utf8.encode(body).length;
      request.write(body);
      final response = await request.close();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>;
        return Result.ok(TourInstanceDetailResponse.fromJson(data));
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Create Coordinator Instance Error',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// PATCH /api/v1/staff/coordinator/instances/{id} — update a coordinator tour instance.
  Future<Result<TourInstanceDetailResponse>> updateCoordinatorInstance({
    required String accessToken,
    required String id,
    String? guideId,
    String? coachId,
    String? driverId,
    String? startDate,
    String? endDate,
    String? status,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/staff/coordinator/instances/$id');
      final request = await client.patchUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;
      final bodyMap = <String, dynamic>{};
      if (guideId != null) bodyMap['guideId'] = guideId;
      if (coachId != null) bodyMap['coachId'] = coachId;
      if (driverId != null) bodyMap['driverId'] = driverId;
      if (startDate != null) bodyMap['startDate'] = startDate;
      if (endDate != null) bodyMap['endDate'] = endDate;
      if (status != null) bodyMap['status'] = status;
      final body = jsonEncode(bodyMap);
      request.contentLength = utf8.encode(body).length;
      request.write(body);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>;
        return Result.ok(TourInstanceDetailResponse.fromJson(data));
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Update Coordinator Instance Error',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// PATCH /api/v1/staff/coordinator/instances/{id}/status — update instance status.
  Future<Result<TourInstanceDetailResponse>> updateCoordinatorInstanceStatus({
    required String accessToken,
    required String id,
    required String status,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(
        _host,
        '/api/v1/staff/coordinator/instances/$id/status',
      );
      final request = await client.patchUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;
      final body = jsonEncode({'status': status});
      request.contentLength = utf8.encode(body).length;
      request.write(body);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>;
        return Result.ok(TourInstanceDetailResponse.fromJson(data));
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Update Coordinator Instance Status Error',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// GET /api/v1/tours/templates — list tour templates (paginated).
  Future<Result<List<Map<String, dynamic>>>> getTourTemplates({
    required String accessToken,
    int page = 0,
    int size = 20,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/tours/templates', {
        'page': '$page',
        'size': '$size',
      });
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final rawData = jsonMap['data'] as List<dynamic>? ?? [];
        return Result.ok(
          rawData.map((e) => e as Map<String, dynamic>).toList(),
        );
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Get Tour Templates Error',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// POST /api/v1/tours/templates — create a tour template.
  Future<Result<Map<String, dynamic>>> createTourTemplate({
    required String accessToken,
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
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/tours/templates');
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;

      final bodyMap = <String, dynamic>{
        'name': name,
        'description': description,
        'destinationId': destinationId,
        'pickupLocation': pickupLocation,
        'pricePerAdult': pricePerAdult,
        'pricePerChild': pricePerChild,
        'isCustom': isCustom,
        'itineraries': itineraries,
      };
      if (hotelId != null) bodyMap['hotelId'] = hotelId;
      if (refundPolicyId != null) bodyMap['refundPolicyId'] = refundPolicyId;
      if (requestedByUserId != null) bodyMap['requestedByUserId'] = requestedByUserId;

      final body = jsonEncode(bodyMap);
      request.contentLength = utf8.encode(body).length;
      request.write(body);
      final response = await request.close();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>? ?? {};
        return Result.ok(data);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Create Tour Template Error',
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
