import 'package:flutter/material.dart';
import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class CheckInPassengerCard extends StatelessWidget {
  final GuidePassenger passenger;
  final VoidCallback onToggle;
  final VoidCallback onNoShow;

  const CheckInPassengerCard({
    super.key,
    required this.passenger,
    required this.onToggle,
    required this.onNoShow,
  });

  @override
  Widget build(BuildContext context) {
    final isArrived = passenger.isArrived;
    final isNoShow = passenger.isNoShow;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isArrived
            ? AppColors.surface
            : (isNoShow ? const Color(0xFFF9FAFB) : AppColors.surface),
        borderRadius: BorderRadius.circular(20),
        border: Border(
          left: BorderSide(
            color: isArrived
                ? AppColors.primary
                : (isNoShow ? Colors.transparent : Colors.transparent),
            width: 4,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _buildStatusIndicator(isArrived, isNoShow),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        passenger.fullName.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      _buildStatusBadge(isArrived, isNoShow),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.badge_outlined,
                        size: 14,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        passenger.identityNumber,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      if (!passenger.isAdult) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF3C7),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'TRẺ EM',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD97706),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            if (!isArrived && !isNoShow) ...[
              const SizedBox(width: 8),
              _buildNoShowButton(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(bool isArrived, bool isNoShow) {
    if (isArrived) {
      return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.check, color: Colors.white, size: 16),
      );
    }
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.outline, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _buildStatusBadge(bool isArrived, bool isNoShow) {
    if (isArrived) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: const Color(0xFFE0F2FE),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'ĐÃ ĐẾN',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      );
    }
    if (isNoShow) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: const Color(0xFFFEE2E2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'NO-SHOW',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Color(0xFFDC2626),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildNoShowButton() {
    return GestureDetector(
      onTap: onNoShow,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: const Color(0xFFFEE2E2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.close, color: Color(0xFFDC2626), size: 18),
      ),
    );
  }
}
