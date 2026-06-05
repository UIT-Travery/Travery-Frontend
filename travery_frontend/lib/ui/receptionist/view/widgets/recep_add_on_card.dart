import 'package:flutter/material.dart';
import 'package:travery_frontend/domain/models/receptionist/recep_add_on/recep_add_on.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class RecepAddOnCard extends StatelessWidget {
  final String id;
  final String serviceName;
  final String category;
  final int totalPrice;
  final String scheduledTime;
  final String status;
  final Function(String id, String status)? onStatusUpdate;

  const RecepAddOnCard({
    super.key,
    required this.id,
    required this.serviceName,
    required this.category,
    required this.totalPrice,
    required this.scheduledTime,
    required this.status,
    this.onStatusUpdate,
  });

  String _getCategoryTitle(String category) {
    switch (category.toUpperCase()) {
      case 'SPA':
        return 'Spa';
      case 'LAUNDRY':
        return 'Giặt ủi';
      case 'FOOD':
        return 'Ăn uống';
      default:
        return category;
    }
  }

  IconData _getIcon(String category) {
    switch (category.toUpperCase()) {
      case 'SPA':
        return Icons.spa;
      case 'LAUNDRY':
        return Icons.local_laundry_service;
      case 'FOOD':
        return Icons.restaurant;
      default:
        return Icons.room_service;
    }
  }

  String _formatTime(String timeString) {
    try {
      final dateTime = DateTime.parse(timeString).toLocal();
      final hour = dateTime.hour.toString().padLeft(2, '0');
      final minute = dateTime.minute.toString().padLeft(2, '0');
      final day = dateTime.day.toString().padLeft(2, '0');
      final month = dateTime.month.toString().padLeft(2, '0');
      return '$hour:$minute $day/$month';
    } catch (_) {
      return timeString;
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toUpperCase()) {
      case 'PENDING':
        return Colors.orange;
      case 'DELIVERED':
        return Colors.green;
      case 'CANCELLED':
        return Colors.red;
      default:
        return AppColors.textSecondary;
    }
  }

  String _getStatusText(String status) {
    switch (status.toUpperCase()) {
      case 'PENDING':
        return 'Chờ xử lý';
      case 'DELIVERED':
        return 'Đã giao';
      case 'CANCELLED':
        return 'Đã huỷ';
      default:
        return status;
    }
  }

  void _showStatusUpdateDialog(BuildContext context) {
    if (status.toUpperCase() == 'DELIVERED' ||
        status.toUpperCase() == 'CANCELLED') {
      return; // Cannot change status if already delivered or cancelled
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cập nhật trạng thái'),
          content: const Text('Bạn muốn chuyển trạng thái đơn này thành gì?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onStatusUpdate?.call(id, 'CANCELLED');
              },
              child: const Text('Đã huỷ', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onStatusUpdate?.call(id, 'DELIVERED');
              },
              child: const Text(
                'Đã hoàn thành',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = _getCategoryTitle(category);
    final formattedTime = _formatTime(scheduledTime);
    final icon = _getIcon(category);

    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () => _showStatusUpdateDialog(context),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 115,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon Container
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.primaryLightWhiteBlue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: AppColors.primaryDarkBlackBlue),
                  ),
                  const SizedBox(width: 12),
                  // Name and Guest
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          serviceName,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  // Quantity
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _getStatusText(status),
                      style: TextStyle(
                        fontSize: 14,
                        color: _getStatusColor(status),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: AppColors.textPrimary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        formattedTime,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  // Check Button
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLightWhiteBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${totalPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}đ',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDarkBlackBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
