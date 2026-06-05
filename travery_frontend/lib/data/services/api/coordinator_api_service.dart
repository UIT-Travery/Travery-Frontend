import 'dart:convert';
import 'dart:io';

import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/data/services/api/model/coordinator/tour_incident_response/tour_incident_response.dart';
import 'package:travery_frontend/data/services/api/model/coordinator/tour_instance_detail_response/tour_instance_detail_response.dart';
import 'package:travery_frontend/data/services/api/model/tour/tour_detail_response/tour_detail_response.dart';
import 'package:travery_frontend/data/services/api/model/tour/tour_instance_response/tour_instance_response.dart';
import 'package:travery_frontend/data/services/api/model/tour/tour_response/tour_response.dart';
import 'package:travery_frontend/data/services/api/model/tour/tour_summart_response/tour_summary_response.dart';
import 'package:travery_frontend/data/services/api/model/coordinator/coach_trip_response/coach_trip_response.dart';
import 'package:travery_frontend/data/services/api/model/coordinator/coach_trip_detail_response/coach_trip_detail_response.dart';
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
        print('DEBUG getCoordinatorInstances stringData: $stringData');
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
    } catch (error) {
      return Result.error(Exception(error.toString()));
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

  /// GET /api/v1/tours — search tour templates (paginated).
  Future<Result<List<TourSummaryResponse>>> getTours({
    required String accessToken,
    String? keyword,
    double? minPrice,
    double? maxPrice,
    String? startDate,
    String? destinationId,
    int? minRating,
    int page = 0,
    int size = 20,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final queryParams = <String, String>{'page': '$page', 'size': '$size'};
      if (keyword != null && keyword.isNotEmpty)
        queryParams['keyword'] = keyword;
      if (minPrice != null) queryParams['minPrice'] = '$minPrice';
      if (maxPrice != null) queryParams['maxPrice'] = '$maxPrice';
      if (startDate != null) queryParams['startDate'] = startDate;
      if (destinationId != null) queryParams['destinationId'] = destinationId;
      if (minRating != null) queryParams['minRating'] = '$minRating';

      final uri = Uri.https(_host, '/api/v1/tours', queryParams);
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final pageData = jsonMap['data'] as Map<String, dynamic>? ?? {};
        final rawContent = pageData['content'] as List<dynamic>? ?? [];
        final tours = rawContent
            .map((e) => TourSummaryResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return Result.ok(tours);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Get Tours Error',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// GET /api/v1/tours/{id} — get full tour detail.
  Future<Result<TourDetailResponse>> getTourDetail({
    required String accessToken,
    required String id,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/tours/$id');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>;
        return Result.ok(TourDetailResponse.fromJson(data));
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Get Tour Detail Error',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// GET /api/v1/tours/{id}/instances — get list of instances for a tour template.
  Future<Result<List<TourInstanceResponse>>> getTourInstances({
    required String accessToken,
    required String id,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/tours/$id/instances');
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
          'Get Tour Instances Error',
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
  Future<Result<List<TourResponse>>> getTourTemplates({
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
          rawData
              .map((e) => TourResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
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

  /// PATCH /api/v1/tours/templates/{id} — update a tour template.
  Future<Result<TourResponse>> updateTourTemplate({
    required String accessToken,
    required String id,
    required Map<String, dynamic> data,
    List<List<int>>? tourImageBytes,
    List<String>? tourImageNames,
    List<List<int>>? itineraryImageBytes,
    List<String>? itineraryImageNames,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/tours/templates/$id');
      final request = await client.patchUrl(uri);
      _addAuth(request, accessToken);

      final boundary = 'boundary${DateTime.now().millisecondsSinceEpoch}';
      request.headers.contentType = ContentType(
        'multipart',
        'form-data',
        parameters: {'boundary': boundary},
      );

      final bodyBytes = _buildMultipartBody(
        boundary: boundary,
        data: data,
        tourImageBytes: tourImageBytes,
        tourImageNames: tourImageNames,
        itineraryImageBytes: itineraryImageBytes,
        itineraryImageNames: itineraryImageNames,
      );
      request.contentLength = bodyBytes.length;
      request.add(bodyBytes);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final dataMap = jsonMap['data'] as Map<String, dynamic>;
        return Result.ok(TourResponse.fromJson(dataMap));
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Update Tour Template Error',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// DELETE /api/v1/tours/templates/{id} — delete a tour template.
  Future<Result<void>> deleteTourTemplate({
    required String accessToken,
    required String id,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/tours/templates/$id');
      final request = await client.deleteUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Result.ok(null);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Delete Tour Template Error',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  // ── Helper for multipart body ──────────────────────────────────────────────

  List<int> _buildMultipartBody({
    required String boundary,
    required Map<String, dynamic> data,
    List<List<int>>? tourImageBytes,
    List<String>? tourImageNames,
    List<List<int>>? itineraryImageBytes,
    List<String>? itineraryImageNames,
  }) {
    final parts = <int>[];
    void writeString(String s) => parts.addAll(utf8.encode(s));

    // JSON data part
    writeString('--$boundary\r\n');
    writeString('Content-Disposition: form-data; name="data"\r\n');
    writeString('Content-Type: application/json\r\n\r\n');
    writeString(jsonEncode(data));
    writeString('\r\n');

    // Tour images
    if (tourImageBytes != null) {
      for (int i = 0; i < tourImageBytes.length; i++) {
        final name = tourImageNames != null && i < tourImageNames.length
            ? tourImageNames[i]
            : 'image_$i.jpg';
        writeString('--$boundary\r\n');
        writeString(
          'Content-Disposition: form-data; name="tourImages"; filename="$name"\r\n',
        );
        writeString('Content-Type: image/jpeg\r\n\r\n');
        parts.addAll(tourImageBytes[i]);
        writeString('\r\n');
      }
    }

    // Itinerary images
    if (itineraryImageBytes != null) {
      for (int i = 0; i < itineraryImageBytes.length; i++) {
        final name =
            itineraryImageNames != null && i < itineraryImageNames.length
            ? itineraryImageNames[i]
            : 'itinerary_$i.jpg';
        writeString('--$boundary\r\n');
        writeString(
          'Content-Disposition: form-data; name="itineraryImages"; filename="$name"\r\n',
        );
        writeString('Content-Type: image/jpeg\r\n\r\n');
        parts.addAll(itineraryImageBytes[i]);
        writeString('\r\n');
      }
    }

    writeString('--$boundary--\r\n');
    return parts;
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
    List<List<int>>? tourImageBytes,
    List<String>? tourImageNames,
    List<List<int>>? itineraryImageBytes,
    List<String>? itineraryImageNames,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/tours/templates');
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      
      final boundary = 'boundary${DateTime.now().millisecondsSinceEpoch}';
      request.headers.contentType = ContentType(
        'multipart',
        'form-data',
        parameters: {'boundary': boundary},
      );

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
      if (requestedByUserId != null)
        bodyMap['requestedByUserId'] = requestedByUserId;

      final bodyBytes = _buildMultipartBody(
        boundary: boundary,
        data: bodyMap,
        tourImageBytes: tourImageBytes,
        tourImageNames: tourImageNames,
        itineraryImageBytes: itineraryImageBytes,
        itineraryImageNames: itineraryImageNames,
      );
      request.contentLength = bodyBytes.length;
      request.add(bodyBytes);
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

  /// GET /api/v1/coordinator/coach-trips
  Future<Result<List<CoachTripResponse>>> getCoordinatorCoachTrips({
    required String accessToken,
    String? status,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final queryParams = <String, String>{};
      if (status != null && status.isNotEmpty) queryParams['status'] = status;

      final uri = Uri.https(_host, '/api/v1/coordinator/coach-trips', queryParams.isEmpty ? null : queryParams);
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final pageData = jsonMap['data'] as Map<String, dynamic>? ?? {};
        final rawContent = pageData['content'] as List<dynamic>? ?? [];
        final trips = rawContent
            .map((e) => CoachTripResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return Result.ok(trips);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Get Coordinator Coach Trips Error',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  /// GET /api/v1/coordinator/coach-trips/{id}
  Future<Result<CoachTripDetailResponse>> getCoordinatorCoachTripDetail({
    required String accessToken,
    required String id,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/coordinator/coach-trips/$id');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>? ?? {};
        return Result.ok(CoachTripDetailResponse.fromJson(data));
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Get Coordinator Coach Trip Detail Error',
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
