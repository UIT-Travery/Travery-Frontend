import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:travery_frontend/config/app_config.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'model/chat/chat_session_response.dart';

class ChatApiService {
  ChatApiService({String? host, HttpClient Function()? clientFactory})
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
    request.headers.set(HttpHeaders.contentTypeHeader, 'application/json');
    return request;
  }

  Future<Result<ChatSessionResponse>> initiateChat({
    required String accessToken,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/chats/initiate');
      debugPrint("ChatApiService: POST $uri");
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();
      debugPrint("ChatApiService: Status Code ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        debugPrint("ChatApiService: Response: $stringData");
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>;
        return Result.ok(ChatSessionResponse.fromJson(data));
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lỗi khi khởi tạo chat',
        );
        debugPrint("ChatApiService: Error Response: $errorMsg");
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      debugPrint("ChatApiService: Exception: $error");
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<ChatSessionResponse>> initiateGroupChat({
    required String accessToken,
    required String tourInstanceId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/chats/initiate-group');
      debugPrint("ChatApiService: POST $uri");
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      
      final body = jsonEncode({'tourInstanceId': tourInstanceId});
      debugPrint("ChatApiService: Body: $body");
      request.add(utf8.encode(body));
      
      final response = await request.close();
      debugPrint("ChatApiService: Status Code ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        debugPrint("ChatApiService: Response: $stringData");
        final jsonMap = jsonDecode(stringData) as Map<String, dynamic>;
        final data = jsonMap['data'] as Map<String, dynamic>;
        return Result.ok(ChatSessionResponse.fromJson(data));
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lỗi khi khởi tạo nhóm chat',
        );
        debugPrint("ChatApiService: Error Response: $errorMsg");
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      debugPrint("ChatApiService: Exception: $error");
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<void>> requestCloseChat({
    required String accessToken,
    required String sessionId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/chats/$sessionId/request-close');
      debugPrint("ChatApiService: POST $uri");
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();
      debugPrint("ChatApiService: Status Code ${response.statusCode}");

      if (response.statusCode == 200) {
        return const Result.ok(null);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lỗi khi đóng phiên chat',
        );
        debugPrint("ChatApiService: Error Response: $errorMsg");
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      debugPrint("ChatApiService: Exception: $error");
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<void>> closeInstanceChat({
    required String accessToken,
    required String instanceId,
  }) async {
    final client = _clientFactory();
    client.connectionTimeout = const Duration(milliseconds: AppConfig.timeout);

    try {
      final uri = Uri.https(_host, '/api/v1/chats/instance/$instanceId/close');
      debugPrint("ChatApiService: POST $uri");
      final request = await client.postUrl(uri);
      _addAuth(request, accessToken);
      final response = await request.close();
      debugPrint("ChatApiService: Status Code ${response.statusCode}");

      if (response.statusCode == 200) {
        return const Result.ok(null);
      } else {
        final errorMsg = await _extractErrorMessage(
          response,
          'Lỗi khi đóng nhóm chat',
        );
        debugPrint("ChatApiService: Error Response: $errorMsg");
        return Result.error(HttpException(errorMsg));
      }
    } on Exception catch (error) {
      debugPrint("ChatApiService: Exception: $error");
      return Result.error(error);
    } finally {
      client.close();
    }
  }
}
