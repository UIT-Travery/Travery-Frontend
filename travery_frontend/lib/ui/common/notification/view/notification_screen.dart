import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/repositories/notification/notification_repository.dart';
import 'package:travery_frontend/ui/common/notification/view_models/notification_view_model.dart';
import 'package:intl/intl.dart';
import 'package:travery_frontend/routing/routes.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationViewModel(
        repository: context.read<NotificationRepository>(),
      ),
      child: const NotificationView(),
    );
  }
}

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  void _handleDeepLink(BuildContext context, String type, String? dataId) {
    debugPrint("NotificationView: Handling deep link - type: $type, dataId: $dataId");
    if (dataId == null || dataId.isEmpty) {
      debugPrint("NotificationView: Deep link ignored - missing dataId");
      return;
    }

    switch (type) {
      case 'BOOKING_CONFIRMED':
      case 'UPCOMING_TOUR':
        debugPrint("NotificationView: Navigating to Booking Detail: $dataId");
        context.push(Routes.bookingDetail.replaceFirst(':id', dataId));
        break;
      case 'UPCOMING_HOTEL':
        debugPrint("NotificationView: Navigating to Hotel Booking Detail: $dataId");
        context.push(Routes.hotelBookingDetail.replaceFirst(':id', dataId));
        break;
      case 'UPCOMING_COACH':
        debugPrint("NotificationView: Navigating to Trip Booking Detail: $dataId");
        context.push(Routes.tripBookingDetail.replaceFirst(':id', dataId));
        break;
      case 'POST_TOUR_REVIEW':
        debugPrint("NotificationView: Navigating to Review/Booking Detail: $dataId");
        context.push(Routes.bookingDetail.replaceFirst(':id', dataId));
        break;
      case 'SECURITY_ALERT':
        debugPrint("NotificationView: Navigating to User Settings");
        context.push(Routes.userSettings);
        break;
      case 'CUSTOM_TOUR_CHAT_ASSIGNED':
        debugPrint("NotificationView: Navigating to Custom Tour Chat: $dataId");
        context.push(Routes.chat, extra: {
          'guid': dataId,
          'title': 'Tư vấn Tour Custom',
        });
        break;
      case 'GROUP_CHAT_CREATED':
        debugPrint("NotificationView: Navigating to Group Chat: tour_instance_$dataId");
        context.push(Routes.chat, extra: {
          'guid': 'tour_instance_$dataId',
          'title': 'Nhóm Chat Đoàn',
        });
        break;
      default:
        debugPrint("NotificationView: No navigation mapping for type: $type");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NotificationViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông báo"),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all),
            tooltip: "Đánh dấu tất cả đã đọc",
            onPressed: viewModel.notifications.isEmpty
                ? null
                : () => viewModel.markAllAsRead(),
          ),
        ],
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : viewModel.errorMessage != null
              ? Center(child: Text("Lỗi: ${viewModel.errorMessage}"))
              : viewModel.notifications.isEmpty
                  ? const Center(child: Text("Không có thông báo nào."))
                  : ListView.builder(
                      itemCount: viewModel.notifications.length,
                      itemBuilder: (context, index) {
                        final notification = viewModel.notifications[index];
                        return ListTile(
                          title: Text(
                            notification.title,
                            style: TextStyle(
                              fontWeight: notification.isRead
                                  ? FontWeight.normal
                                  : FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(notification.content),
                              const SizedBox(height: 4),
                              Text(
                                DateFormat('dd/MM/yyyy HH:mm').format(
                                  notification.createdAt,
                                ),
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                          tileColor: notification.isRead
                              ? null
                              : Colors.blue.withValues(alpha: 0.05),
                          onTap: () {
                            if (!notification.isRead) {
                              viewModel.markAsRead(notification.id);
                            }
                            _handleDeepLink(context, notification.type, notification.dataId);
                          },
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () =>
                                viewModel.deleteNotification(notification.id),
                          ),
                        );
                      },
                    ),
    );
  }
}
