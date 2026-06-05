import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/api/chat_api_service.dart';
import 'package:travery_frontend/data/services/api/model/chat/chat_session_response.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatApiService _apiService;
  final TokenRefreshService _tokenRefreshService;

  ChatRepositoryImpl({
    required ChatApiService apiService,
    required TokenRefreshService tokenRefreshService,
  })  : _apiService = apiService,
        _tokenRefreshService = tokenRefreshService;

  @override
  Future<Result<ChatSessionResponse>> initiateChat() async {
    debugPrint("ChatRepository: initiateChat called");
    final tokenResult = await _tokenRefreshService.getValidAccessToken();
    switch (tokenResult) {
      case Ok<String>():
        debugPrint("ChatRepository: Token acquired. Calling ChatApiService...");
        return _apiService.initiateChat(accessToken: tokenResult.value);
      case Error<String>():
        debugPrint("ChatRepository: Failed to get access token: ${tokenResult.error}");
        return Result.error(tokenResult.error);
    }
  }

  @override
  Future<Result<ChatSessionResponse>> initiateGroupChat(String tourInstanceId) async {
    debugPrint("ChatRepository: initiateGroupChat called for instance: $tourInstanceId");
    final tokenResult = await _tokenRefreshService.getValidAccessToken();
    switch (tokenResult) {
      case Ok<String>():
        debugPrint("ChatRepository: Token acquired. Calling ChatApiService...");
        return _apiService.initiateGroupChat(
          accessToken: tokenResult.value,
          tourInstanceId: tourInstanceId,
        );
      case Error<String>():
        debugPrint("ChatRepository: Failed to get access token: ${tokenResult.error}");
        return Result.error(tokenResult.error);
    }
  }

  @override
  Future<Result<void>> requestCloseChat(String sessionId) async {
    final tokenResult = await _tokenRefreshService.getValidAccessToken();
    switch (tokenResult) {
      case Ok<String>():
        return _apiService.requestCloseChat(
          accessToken: tokenResult.value,
          sessionId: sessionId,
        );
      case Error<String>():
        return Result.error(tokenResult.error);
    }
  }

  @override
  Future<Result<void>> closeInstanceChat(String instanceId) async {
    final tokenResult = await _tokenRefreshService.getValidAccessToken();
    switch (tokenResult) {
      case Ok<String>():
        return _apiService.closeInstanceChat(
          accessToken: tokenResult.value,
          instanceId: instanceId,
        );
      case Error<String>():
        return Result.error(tokenResult.error);
    }
  }
}
