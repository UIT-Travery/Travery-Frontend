import 'dart:convert';
import 'dart:io';

import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/data/seed_models/tour_progress/tour_progress.dart';
import 'package:travery_frontend/data/seed_models/tour_progress/tour_progress_enums.dart';
import 'package:travery_frontend/data/repositories/tour_progress_repository.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class TourProgressRepositoryImpl implements TourProgressRepository {
  TourProgressRepositoryImpl({required TokenRefreshService tokenRefreshService})
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
  Future<Result<TourProgress?>> getTourProgressByMission(
    String missionId,
  ) async {
    // Get mission detail to build progress data
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

        final progress = _mapToTourProgress(data);
        return Result.ok(progress);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lấy tiến trình tour thất bại',
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
  Future<Result<TourProgressStep>> updateStepStatus({
    required String progressId,
    required String stepId,
    required TimelineStepStatus newStatus,
  }) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final requestObj = await client.patchUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/staff/guide/instances/$progressId/progress',
        ),
      );
      requestObj.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(requestObj);

      // Map TimelineStepStatus to API status
      final statusStr = switch (newStatus) {
        TimelineStepStatus.completed => 'COMPLETED',
        TimelineStepStatus.active => 'IN_PROGRESS',
        TimelineStepStatus.upcoming => 'PLANNING',
      };

      requestObj.write(jsonEncode({'status': statusStr}));

      final response = await requestObj.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>? ?? {};

        return Result.ok(
          TourProgressStep(
            id: stepId,
            title: 'Bước $stepId',
            description: data['description'] as String? ?? '',
            status: newStatus,
          ),
        );
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Cập nhật trạng thái thất bại',
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
  Future<Result<bool>> reportEmergency({
    required String missionId,
    required String description,
  }) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final requestObj = await client.postUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/staff/guide/instances/$missionId/incidents',
        ),
      );
      requestObj.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(requestObj);

      requestObj.write(
        jsonEncode({
          'title': 'Báo cáo sự cố khẩn cấp',
          'description': description,
          'severity': 'HIGH',
        }),
      );

      final response = await requestObj.close();

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Result.ok(true);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Gửi báo cáo thất bại',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  TourProgress _mapToTourProgress(Map<String, dynamic> map) {
    final statusStr = map['status'] as String? ?? 'PLANNING';

    TourProgressStatus progressStatus;
    switch (statusStr) {
      case 'IN_PROGRESS':
        progressStatus = TourProgressStatus.inProgress;
        break;
      case 'COMPLETED':
        progressStatus = TourProgressStatus.completed;
        break;
      default:
        progressStatus = TourProgressStatus.pending;
    }

    // Build default steps based on tour status
    final steps = _buildTourSteps(statusStr);

    // Count total passengers
    int totalPassengers = 0;
    final bookings = map['bookings'] as List<dynamic>? ?? [];
    for (final booking in bookings) {
      final members = booking['members'] as List<dynamic>? ?? [];
      totalPassengers += members.length;
    }

    return TourProgress(
      id: map['id'] as String? ?? '',
      missionId: map['id'] as String? ?? '',
      tourName: map['tourName'] as String? ?? '',
      tourCode:
          '#${(map['id'] as String? ?? '').substring(0, 8).toUpperCase()}',
      driverName: map['driverName'] as String? ?? '',
      vehiclePlate: map['coachLicensePlate'] as String? ?? '',
      totalPassengers: totalPassengers,
      customerName: 'Khách hàng', // API doesn't return single customer name
      status: progressStatus,
      steps: steps,
      updatedAt: DateTime.now(),
    );
  }

  List<TourProgressStep> _buildTourSteps(String statusStr) {
    final stepStatus = switch (statusStr) {
      'IN_PROGRESS' => TimelineStepStatus.active,
      'COMPLETED' => TimelineStepStatus.completed,
      _ => TimelineStepStatus.upcoming,
    };

    return [
      TourProgressStep(
        id: '1',
        title: 'Đón khách',
        description: 'Đón khách tại điểm tập trung',
        status: stepStatus,
      ),
      TourProgressStep(
        id: '2',
        title: 'Khởi hành',
        description: 'Bắt đầu chuyến đi',
        status: stepStatus,
      ),
      TourProgressStep(
        id: '3',
        title: 'Tham quan',
        description: 'Tham quan các điểm đến',
        status: stepStatus,
      ),
      TourProgressStep(
        id: '4',
        title: 'Kết thúc',
        description: 'Trả khách và kết thúc tour',
        status: stepStatus,
        isLast: true,
      ),
    ];
  }
}
