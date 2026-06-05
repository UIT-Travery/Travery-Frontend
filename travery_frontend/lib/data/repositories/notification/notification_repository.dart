import 'package:flutter/foundation.dart';
import 'package:travery_frontend/data/services/api/model/notification/notification_response.dart';
import 'package:travery_frontend/utils/core_result.dart';

abstract class NotificationRepository extends ChangeNotifier {
  Future<Result<NotificationResponse>> getNotifications({int page = 0, int size = 20});
  Future<Result<int>> getUnreadCount();
  Future<Result<void>> markAsRead(String notificationId);
  Future<Result<void>> markAllAsRead();
  Future<Result<void>> deleteNotification(String notificationId);
}
