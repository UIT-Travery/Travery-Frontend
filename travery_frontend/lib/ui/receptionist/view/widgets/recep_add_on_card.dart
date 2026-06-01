import 'package:flutter/material.dart';
import 'package:travery_frontend/domain/models/receptionist/recep_add_on/recep_add_on.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class RecepAddOnCard extends StatelessWidget {
  final RecepAddonType type;
  final String guestName;
  final int guestCount;
  final String? customTime;
  final VoidCallback? onCheckTap;

  const RecepAddOnCard({
    super.key,
    required this.type,
    required this.guestName,
    required this.guestCount,
    this.customTime,
    this.onCheckTap,
  });

  String _getTitle(RecepAddonType type) {
    switch (type) {
      case RecepAddonType.spa:
        return 'Spa';
      case RecepAddonType.laundry:
        return 'Giặt ủi';
      case RecepAddonType.breakfast:
        return 'Bữa sáng';
      case RecepAddonType.lunch:
        return 'Bữa trưa';
      case RecepAddonType.dinner:
        return 'Bữa tối';
    }
  }

  String _getDefaultTime(RecepAddonType type) {
    switch (type) {
      case RecepAddonType.spa:
        return '16:00';
      case RecepAddonType.laundry:
        return '16:00';
      case RecepAddonType.breakfast:
        return '06:00';
      case RecepAddonType.lunch:
        return '11:00';
      case RecepAddonType.dinner:
        return '18:00';
    }
  }

  IconData _getIcon(RecepAddonType type) {
    switch (type) {
      case RecepAddonType.spa:
        return Icons.spa;
      case RecepAddonType.laundry:
        return Icons.local_laundry_service;
      case RecepAddonType.breakfast:
      case RecepAddonType.lunch:
      case RecepAddonType.dinner:
        return Icons.restaurant;
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = _getTitle(type);
    final timeString = customTime ?? _getDefaultTime(type);
    final icon = _getIcon(type);

    return Container(
      height: 115,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
      ),
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
                child: Icon(
                  icon,
                  color: AppColors.primaryDarkBlackBlue,
                ),
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
                      guestName,
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
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$guestCount Khách',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textPrimary,
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
                    timeString,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              // Check Button
              GestureDetector(
                onTap: onCheckTap,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLightWhiteBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 18,
                    color: AppColors.primaryDarkBlackBlue,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
