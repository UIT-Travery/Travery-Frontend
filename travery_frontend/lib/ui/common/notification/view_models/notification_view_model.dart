import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:travery_frontend/data/repositories/notification/notification_repository.dart';
import 'package:travery_frontend/data/services/api/model/notification/notification_model.dart';
import 'package:travery_frontend/utils/core_result.dart';

class NotificationViewModel extends ChangeNotifier {
  final NotificationRepository _repository;
  StreamSubscription<RemoteMessage>? _messagingSubscription;

  NotificationViewModel({required NotificationRepository repository})
      : _repository = repository {
    _init();
    
    // Listen to Firebase foreground messages for real-time updates
    _messagingSubscription = FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      fetchNotifications();
    });
  }

  @override
  void dispose() {
    _messagingSubscription?.cancel();
    super.dispose();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<NotificationModel> _notifications = [];
  List<NotificationModel> get notifications => _notifications;

  int _unreadCount = 0;
  int get unreadCount => _unreadCount;



  Future<void> _init() async {
    await fetchNotifications();
  }

  Future<void> fetchNotifications({int page = 0, int size = 20}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    // Fetch notifications
    final result = await _repository.getNotifications(page: page, size: size);
    switch (result) {
      case Ok():
        _notifications = result.value.notifications.content.toList();
        _unreadCount = result.value.unreadCount;
        break;
      case Error():
        _errorMessage = result.error.toString();
        break;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> markAsRead(String notificationId) async {
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1 && !_notifications[index].isRead) {
      _notifications[index] = _notifications[index].copyWith(isRead: true);
      if (_unreadCount > 0) _unreadCount--;
      notifyListeners();
    }
    await _repository.markAsRead(notificationId);
  }

  Future<void> markAllAsRead() async {
    final result = await _repository.markAllAsRead();
    if (result is Ok) {
      _notifications = _notifications.map((n) => n.copyWith(isRead: true)).toList();
      _unreadCount = 0;
      notifyListeners();
    }
  }

  Future<void> deleteNotification(String notificationId) async {
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      final notification = _notifications[index];
      _notifications.removeAt(index);
      if (!notification.isRead && _unreadCount > 0) _unreadCount--;
      notifyListeners();
    }
    await _repository.deleteNotification(notificationId);
  }
}
