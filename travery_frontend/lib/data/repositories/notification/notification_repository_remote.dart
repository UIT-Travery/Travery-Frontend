import 'package:travery_frontend/data/services/api/notification_api_service.dart';
import 'package:travery_frontend/data/services/api/model/notification/notification_response.dart';
import 'package:travery_frontend/data/services/token_refresh_service.dart';
import 'package:travery_frontend/utils/core_result.dart';

import 'notification_repository.dart';

class NotificationRepositoryRemote extends NotificationRepository {
  final NotificationApiService _apiService;
  final TokenRefreshService _tokenRefreshService;

  NotificationRepositoryRemote({
    required NotificationApiService apiService,
    required TokenRefreshService tokenRefreshService,
  })  : _apiService = apiService,
        _tokenRefreshService = tokenRefreshService;

  @override
  Future<Result<NotificationResponse>> getNotifications({int page = 0, int size = 20}) async {
    final tokenResult = await _tokenRefreshService.getValidAccessToken();
    switch (tokenResult) {
      case Ok<String>():
        return _apiService.getNotifications(
          accessToken: tokenResult.value,
          page: page,
          size: size,
        );
      case Error<String>():
        return Result.error(tokenResult.error);
    }
  }

  @override
  Future<Result<int>> getUnreadCount() async {
    final tokenResult = await _tokenRefreshService.getValidAccessToken();
    switch (tokenResult) {
      case Ok<String>():
        return _apiService.getUnreadCount(accessToken: tokenResult.value);
      case Error<String>():
        return Result.error(tokenResult.error);
    }
  }

  @override
  Future<Result<void>> markAsRead(String notificationId) async {
    final tokenResult = await _tokenRefreshService.getValidAccessToken();
    switch (tokenResult) {
      case Ok<String>():
        return _apiService.markAsRead(
          accessToken: tokenResult.value,
          notificationId: notificationId,
        );
      case Error<String>():
        return Result.error(tokenResult.error);
    }
  }

  @override
  Future<Result<void>> markAllAsRead() async {
    final tokenResult = await _tokenRefreshService.getValidAccessToken();
    switch (tokenResult) {
      case Ok<String>():
        return _apiService.markAllAsRead(accessToken: tokenResult.value);
      case Error<String>():
        return Result.error(tokenResult.error);
    }
  }

  @override
  Future<Result<void>> deleteNotification(String notificationId) async {
    final tokenResult = await _tokenRefreshService.getValidAccessToken();
    switch (tokenResult) {
      case Ok<String>():
        return _apiService.deleteNotification(
          accessToken: tokenResult.value,
          notificationId: notificationId,
        );
      case Error<String>():
        return Result.error(tokenResult.error);
    }
  }
}
