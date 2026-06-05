import 'dart:convert';
import 'dart:io';

import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_dashboard_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/available_room_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_room_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_add_on_order_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/check_in_request.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/check_out_preview_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_booking_list_response.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/recep_booking_detail_response.dart';

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

  Future<Result<List<RecepRoomResponse>>> getRooms({
    required String accessToken,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/staff/receptionist/rooms');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        
        final dataList = jsonMap['data'] as List<dynamic>;
        final rooms = dataList
            .map((e) => RecepRoomResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return Result.ok(rooms);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải danh sách phòng',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<void>> updateRoomStatus({
    required String accessToken,
    required String roomId,
    required String status,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/staff/receptionist/rooms/$roomId/status', {
        'status': status,
      });
      final request = await client.patchUrl(uri);
      _addAuth(request, accessToken);
      
      final response = await request.close();

      if (response.statusCode == 200) {
        return const Result.ok(null);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể cập nhật trạng thái phòng',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<List<RecepAddOnOrderResponse>>> getAddOnOrders({
    required String accessToken,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/staff/receptionist/add-on-orders');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        
        final dataList = jsonMap['data'] as List<dynamic>;
        final orders = dataList
            .map((e) => RecepAddOnOrderResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return Result.ok(orders);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải danh sách tiện ích',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<void>> updateAddOnOrderStatus({
    required String accessToken,
    required String orderId,
    required String status,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/staff/receptionist/add-on-orders/$orderId/status', {
        'status': status,
      });
      final request = await client.patchUrl(uri);
      _addAuth(request, accessToken);
      
      final response = await request.close();

      if (response.statusCode == 200) {
        return const Result.ok(null);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể cập nhật trạng thái tiện ích',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<void>> checkIn({
    required String accessToken,
    required String bookingId,
    required CheckInRequest requestBody,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/staff/receptionist/bookings/$bookingId/check-in');
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(requestBody.toJson()));
      
      final response = await request.close();

      if (response.statusCode == 200) {
        return const Result.ok(null);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể thực hiện nhận phòng',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<CheckOutPreviewResponse>> checkOutPreview({
    required String accessToken,
    required String bookingId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/staff/receptionist/bookings/$bookingId/check-out');
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        
        final data = jsonMap['data'] as Map<String, dynamic>;
        final previewData = CheckOutPreviewResponse.fromJson(data);
        return Result.ok(previewData);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tạo hóa đơn tạm tính',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<void>> confirmCheckOut({
    required String accessToken,
    required String bookingId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/staff/receptionist/bookings/$bookingId/confirm-check-out');
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      
      final response = await request.close();

      if (response.statusCode == 200) {
        return const Result.ok(null);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể hoàn tất trả phòng',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<List<RecepBookingListResponse>>> getBookings({
    required String accessToken,
    String? status,
    String? guestName,
    String? date,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final queryParams = <String, dynamic>{};
      if (status != null && status.isNotEmpty) queryParams['status'] = status;
      if (guestName != null && guestName.isNotEmpty) queryParams['guestName'] = guestName;
      if (date != null && date.isNotEmpty) queryParams['date'] = date;

      final uri = Uri.https(_host, '/api/v1/staff/receptionist/bookings', queryParams);
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        
        final pageData = jsonMap['data'] as Map<String, dynamic>;
        final dataList = pageData['content'] as List<dynamic>;
        final bookings = dataList
            .map((e) => RecepBookingListResponse.fromJson(e as Map<String, dynamic>))
            .toList();
        return Result.ok(bookings);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải danh sách đặt phòng',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<RecepBookingDetailResponse>> getBookingDetail({
    required String accessToken,
    required String bookingId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/staff/receptionist/bookings/$bookingId');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        
        final data = jsonMap['data'] as Map<String, dynamic>;
        final detail = RecepBookingDetailResponse.fromJson(data);
        return Result.ok(detail);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Không thể tải chi tiết đặt phòng',
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
