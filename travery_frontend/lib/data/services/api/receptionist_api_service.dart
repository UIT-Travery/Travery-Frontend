import 'dart:convert';
import 'dart:io';

import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_dashboard_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/available_room_response.dart';

class ReceptionistApiService {
  ReceptionistApiService({String? host, HttpClient Function()? clientFactory})
    : _host = host ?? AppConfig.baseUrl,
      _clientFactory = clientFactory ?? HttpClient.new;

  final String _host;
  final HttpClient Function() _clientFactory;

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

  Future<Result<RecepDashboardResponse>> getDashboard({required String accessToken}) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/staff/receptionist/dashboard');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        
        final data = jsonMap['data'] as Map<String, dynamic>;
        final dashboardData = RecepDashboardResponse.fromJson(data);
        return Result.ok(dashboardData);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải dữ liệu bảng điều khiển',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<List<AvailableRoomResponse>>> getAvailableRooms({
    required String accessToken,
    required String roomTypeId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/staff/receptionist/rooms/available', {
        'roomTypeId': roomTypeId,
      });
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        
        final dataList = jsonMap['data'] as List<dynamic>;
        final rooms = dataList
            .map((e) => AvailableRoomResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return Result.ok(rooms);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải danh sách phòng trống',
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
