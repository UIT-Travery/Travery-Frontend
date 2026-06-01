import 'package:flutter/material.dart';
import 'package:travery_frontend/domain/models/receptionist/recep_room/recep_room.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_large_button.dart';

class RecepCheckInOutCard extends StatelessWidget {
  final String guestName;
  final int roomCount;
  final int guestCount;
  final String roomType;
  final RecepBedType bedType;
  final int bedCount;
  final bool isCheckIn;
  final String date;
  final VoidCallback? onTapAction;

  const RecepCheckInOutCard({
    super.key,
    required this.guestName,
    required this.roomCount,
    required this.guestCount,
    required this.roomType,
    required this.bedType,
    required this.bedCount,
    required this.isCheckIn,
    required this.date,
    this.onTapAction,
  });

  @override
  Widget build(BuildContext context) {
    // Con số x3 được tính bằng số người chia (số giường nhân loại giường) làm tròn lên
    final int bedCapacity = bedType == RecepBedType.single ? 1 : 2;
    final int quantity = (guestCount / (bedCount * bedCapacity)).ceil();

    final String bedTypeName = bedType == RecepBedType.single ? 'Giường đơn' : 'Giường đôi';

    return Container(
      height: 235,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  guestName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '$roomCount Phòng - $guestCount Người',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(
                Icons.access_time,
                size: 16,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                '12:00 $date',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        roomType,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$bedCount $bedTypeName',
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'x$quantity',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          RecepLargeButton(
            label: isCheckIn ? 'Check-in Toàn bộ' : 'Check-out Toàn bộ',
            onTap: onTapAction,
          ),
        ],
      ),
    );
  }
}
