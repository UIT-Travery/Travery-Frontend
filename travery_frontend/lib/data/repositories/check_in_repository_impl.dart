import 'dart:convert';
import 'dart:io';

import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/data/seed_models/check_in/check_in_passenger.dart';
import 'package:travery_frontend/data/repositories/check_in_repository.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CheckInRepositoryImpl implements CheckInRepository {
  CheckInRepositoryImpl({required TokenRefreshService tokenRefreshService})
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
  Future<Result<CheckInPassengerList>> getPassengersByMission(
    String missionId,
  ) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/staff/guide/instances/$missionId/passengers',
          {'query': ''},
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

        final passengers = data.map((e) {
          final map = e as Map<String, dynamic>;
          return _mapToCheckInPassenger(map, missionId);
        }).toList();

        final arrivedCount = passengers
            .where((p) => p.status == CheckInStatus.arrived)
            .length;

        return Result.ok(
          CheckInPassengerList(
            passengers: passengers,
            totalCount: passengers.length,
            arrivedCount: arrivedCount,
          ),
        );
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
  Future<Result<CheckInPassengerList>> searchPassengers({
    required String missionId,
    required String query,
  }) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final request = await client.getUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/staff/guide/instances/$missionId/passengers',
          {'query': query},
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

        final passengers = data.map((e) {
          final map = e as Map<String, dynamic>;
          return _mapToCheckInPassenger(map, missionId);
        }).toList();

        final arrivedCount = passengers
            .where((p) => p.status == CheckInStatus.arrived)
            .length;

        return Result.ok(
          CheckInPassengerList(
            passengers: passengers,
            totalCount: passengers.length,
            arrivedCount: arrivedCount,
          ),
        );
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Tìm kiếm hành khách thất bại',
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
  Future<Result<CheckInPassenger>> updatePassengerStatus({
    required String missionId,
    required String passengerId,
    required CheckInStatus status,
  }) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final requestObj = await client.patchUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/staff/guide/instances/$missionId/attendance',
        ),
      );
      requestObj.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(requestObj);

      final apiStatus = switch (status) {
        CheckInStatus.arrived => 'CHECKED_IN',
        CheckInStatus.pending => 'NOT_CHECKED',
        CheckInStatus.noShow => 'NO_SHOW',
      };

      requestObj.write(
        jsonEncode({
          'attendances': [
            {'memberId': passengerId, 'status': apiStatus},
          ],
        }),
      );

      final response = await requestObj.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>?;

        if (data != null) {
          final updatedPassenger = _findPassengerFromResponse(
            data,
            passengerId,
          );
          if (updatedPassenger != null) {
            return Result.ok(updatedPassenger);
          }
        }

        return Result.ok(
          CheckInPassenger(
            id: passengerId,
            name: '',
            idNumber: '',
            email: '',
            type: PassengerType.adult,
            status: status,
            bookingId: '',
            missionId: missionId,
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
  Future<Result<bool>> completeCheckIn({
    required String missionId,
    required List<MemberAttendance> attendances,
  }) async {
    final client = HttpClient();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final requestObj = await client.patchUrl(
        Uri.https(
          AppConfig.baseUrl,
          '/api/v1/staff/guide/instances/$missionId/attendance',
        ),
      );
      requestObj.headers.set(
        HttpHeaders.contentTypeHeader,
        ContentType.json.value,
      );
      await _setBearerAuth(requestObj);

      requestObj.write(
        jsonEncode({
          'attendances': attendances.map((a) => a.toJson()).toList(),
        }),
      );

      final response = await requestObj.close();

      if (response.statusCode == 200) {
        return Result.ok(true);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Hoàn tất điểm danh thất bại',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  CheckInPassenger? _findPassengerFromResponse(
    Map<String, dynamic> data,
    String passengerId,
  ) {
    final bookings = data['bookings'] as List<dynamic>? ?? [];
    for (final booking in bookings) {
      final members = booking['members'] as List<dynamic>? ?? [];
      for (final member in members) {
        if (member['id'] == passengerId) {
          return _mapToCheckInPassenger(
            member as Map<String, dynamic>,
            data['id'] as String? ?? '',
          );
        }
      }
    }
    return null;
  }

  CheckInPassenger _mapToCheckInPassenger(
    Map<String, dynamic> map,
    String missionId,
  ) {
    final memberType = map['memberType'] as String? ?? 'ADULT';
    final attendanceStatus =
        map['attendanceStatus'] as String? ?? 'NOT_CHECKED';

    CheckInStatus status;
    switch (attendanceStatus) {
      case 'CHECKED_IN':
        status = CheckInStatus.arrived;
        break;
      case 'NO_SHOW':
        status = CheckInStatus.noShow;
        break;
      default:
        status = CheckInStatus.pending;
    }

    PassengerType type;
    switch (memberType) {
      case 'CHILD':
        type = PassengerType.child;
        break;
      default:
        type = PassengerType.adult;
    }

    return CheckInPassenger(
      id: map['id'] as String? ?? '',
      name: map['fullName'] as String? ?? '',
      idNumber: map['identityNumber'] as String? ?? '',
      email: '', // API doesn't return email
      type: type,
      status: status,
      bookingId: '', // API doesn't return bookingId directly
      missionId: missionId,
    );
  }
}
