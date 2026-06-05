import 'dart:convert';
import 'dart:io';

import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'model/notification/notification_response.dart';

class NotificationApiService {
  NotificationApiService({String? host, HttpClient Function()? clientFactory})
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

  Future<Result<NotificationResponse>> getNotifications({
    required String accessToken,
    int page = 0,
    int size = 20,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final queryParams = <String, String>{
        'page': '$page',
        'size': '$size',
      };

      final uri = Uri.https(_host, '/api/v1/notifications', queryParams);
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>;
        return Result.ok(NotificationResponse.fromJson(data));
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lỗi khi tải thông báo',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<int>> getUnreadCount({required String accessToken}) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/notifications/unread-count');
      final request = await client.getUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final count = jsonMap['data'] as int? ?? 0;
        return Result.ok(count);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lỗi khi đếm số thông báo',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<void>> markAsRead({
    required String accessToken,
    required String notificationId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/notifications/$notificationId/read');
      final request = await client.putUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        return const Result.ok(null);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lỗi khi đánh dấu đã đọc',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<void>> markAllAsRead({required String accessToken}) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/notifications/read-all');
      final request = await client.putUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200) {
        return const Result.ok(null);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lỗi khi đánh dấu tất cả đã đọc',
        );
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<void>> deleteNotification({
    required String accessToken,
    required String notificationId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/notifications/$notificationId');
      final request = await client.deleteUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();

      if (response.statusCode == 200 || response.statusCode == 204) {
        return const Result.ok(null);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lỗi khi xoá thông báo',
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
