import 'dart:convert';
import 'dart:io';

import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/data/seed_models/incident/incident.dart';
import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class GuideMissionServiceImpl implements GuideMissionService {
  GuideMissionServiceImpl({required TokenRefreshService tokenRefreshService})
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
  Future<Result<GuideMissionDetail>> getMissionDetail(String instanceId) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/staff/guide/instances/$instanceId',
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
        if (data == null) {
          return Result.error(const HttpException('Không tìm thấy nhiệm vụ'));
        }
        return Result.ok(_parseMissionDetail(data));
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lấy chi tiết nhiệm vụ thất bại',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  GuideMissionDetail _parseMissionDetail(Map<String, dynamic> data) {
    final bookingsRaw = data['bookings'] as List<dynamic>? ?? [];
    final bookings = bookingsRaw.map((b) {
      final membersRaw = b['members'] as List<dynamic>? ?? [];
      final members = membersRaw.map((m) {
        return GuideMember(
          id: m['id'] as String? ?? '',
          fullName: m['fullName'] as String? ?? '',
          identityNumber: m['identityNumber'] as String? ?? '',
          dateOfBirth:
              DateTime.tryParse(m['dateOfBirth'] as String? ?? '') ??
              DateTime.now(),
          status: m['attendanceStatus'] as String? ?? 'NOT_CHECKED',
          memberType: m['memberType'] as String? ?? 'ADULT',
        );
      }).toList();

      return GuideBooking(
        id: b['id'] as String? ?? '',
        customerName: b['customerName'] as String? ?? '',
        customerPhone: b['customerPhone'] as String? ?? '',
        specialRequests: b['specialRequests'] as String?,
        status: b['status'] as String? ?? '',
        totalPrice: (b['totalPrice'] as num?)?.toDouble() ?? 0,
        paymentDeadline: b['paymentDeadline'] != null
            ? DateTime.tryParse(b['paymentDeadline'] as String)
            : null,
        members: members,
      );
    }).toList();

    return GuideMissionDetail(
      id: data['id'] as String? ?? '',
      tourName: data['tourName'] as String? ?? '',
      destinationName: data['destinationName'] as String? ?? '',
      pickupLocation: data['pickupLocation'] as String? ?? '',
      startDate:
          DateTime.tryParse(data['startDate'] as String? ?? '') ??
          DateTime.now(),
      endDate:
          DateTime.tryParse(data['endDate'] as String? ?? '') ?? DateTime.now(),
      status: data['status'] as String? ?? 'PLANNING',
      coachId: data['coachId'] as String?,
      coachLicensePlate: data['coachLicensePlate'] as String?,
      coachType: data['coachType'] as String?,
      driverId: data['driverId'] as String?,
      driverName: data['driverName'] as String?,
      driverPhone: data['driverPhone'] as String?,
      bookings: bookings,
      steps: const [],
    );
  }

  @override
  Future<Result<List<GuidePassenger>>> getPassengers(
    String instanceId, {
    String query = '',
  }) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(
        AppConfig.baseUrl,
        '/api/v1/staff/guide/instances/$instanceId/passengers',
        {'query': query},
      );
      final request = await client.getUrl(uri);
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

        final passengers = data.map((e) {
          final map = e as Map<String, dynamic>;
          return GuidePassenger(
            id: map['id'] as String? ?? '',
            fullName: map['fullName'] as String? ?? '',
            identityNumber: map['identityNumber'] as String? ?? '',
            dateOfBirth:
                DateTime.tryParse(map['dateOfBirth'] as String? ?? '') ??
                DateTime.now(),
            attendanceStatus:
                map['attendanceStatus'] as String? ?? 'NOT_CHECKED',
            memberType: map['memberType'] as String? ?? 'ADULT',
          );
        }).toList();

        return Result.ok(passengers);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lấy danh sách hành khách thất bại',
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
  Future<Result<void>> updateAttendance(
    String instanceId,
    List<Map<String, String>> attendances,
  ) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.patchUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/staff/guide/instances/$instanceId/attendance',
        ),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(request);
      request.write(jsonEncode({'attendances': attendances}));

      final response = await request.close();

      if (response.statusCode == 200) {
        return const Result.ok(null);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Cập nhật điểm danh thất bại',
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
  Future<Result<void>> updateProgress(String instanceId, String status) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.patchUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/staff/guide/instances/$instanceId/progress',
        ),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(request);
      request.write(jsonEncode({'status': status}));

      final response = await request.close();

      if (response.statusCode == 200) {
        return const Result.ok(null);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Cập nhật tiến độ thất bại',
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
  Future<Result<Incident>> reportIncident(
    String instanceId,
    String title,
    String description,
    String severity,
  ) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.postUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/staff/guide/instances/$instanceId/incidents',
        ),
      );
      request.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(request);
      request.write(
        jsonEncode({
          'title': title,
          'description': description,
          'severity': severity,
        }),
      );

      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>?;
        if (data == null) {
          return Result.error(const HttpException('Báo cáo sự cố thất bại'));
        }
        return Result.ok(_parseIncident(data));
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Báo cáo sự cố thất bại',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Incident _parseIncident(Map<String, dynamic> data) {
    return Incident(
      type: IncidentType.other,
      severity: IncidentSeverity.values.firstWhere(
        (s) =>
            s.name.toUpperCase() ==
            (data['severity'] as String? ?? 'LOW').toUpperCase(),
        orElse: () => IncidentSeverity.low,
      ),
      status: IncidentStatus.reported,
      description: data['description'] as String?,
      createdAt: data['createdAt'] != null
          ? DateTime.tryParse(data['createdAt'] as String)
          : null,
    );
  }

  @override
  Future<Result<List<Incident>>> getIncidents(String instanceId) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/staff/guide/instances/$instanceId/incidents',
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
        final data = jsonMap['data'] as List<dynamic>? ?? [];
        final incidents = data.map((e) {
          final map = e as Map<String, dynamic>;
          return Incident(
            type: IncidentType.other,
            severity: IncidentSeverity.low,
            status: IncidentStatus.reported,
            description: map['description'] as String?,
            createdAt: map['createdAt'] != null
                ? DateTime.tryParse(map['createdAt'] as String)
                : null,
          );
        }).toList();
        return Result.ok(incidents);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lấy danh sách sự cố thất bại',
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
