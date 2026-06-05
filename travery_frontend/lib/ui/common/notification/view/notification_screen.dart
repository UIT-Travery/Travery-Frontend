import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/repositories/notification/notification_repository.dart';
import 'package:travery_frontend/ui/common/notification/view_models/notification_view_model.dart';
import 'package:intl/intl.dart';
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
                          onTap: notification.isRead
                              ? null
                              : () => viewModel.markAsRead(notification.id),
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
