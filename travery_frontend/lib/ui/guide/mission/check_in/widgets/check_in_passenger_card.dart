import 'package:flutter/material.dart';
import 'package:travery_frontend/data/seed_models/check_in/check_in_passenger.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class CheckInPassengerCard extends StatelessWidget {
  final CheckInPassenger passenger;
  final VoidCallback onToggleStatus;
  final bool isLocked;

  const CheckInPassengerCard({
    super.key,
    required this.passenger,
    required this.onToggleStatus,
    this.isLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    final isArrived = passenger.isArrived;
    final isChild = passenger.isChild;

    return GestureDetector(
      onTap: isLocked ? null : onToggleStatus,
      child: Container(
        decoration: BoxDecoration(
          color: isArrived
              ? AppColors.surface
              : AppColors.surface.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(10),
          border: Border(
            left: BorderSide(
              color: isArrived ? AppColors.primary : AppColors.inputBorder,
              width: 3,
            ),
          ),
          boxShadow: isArrived
              ? [
                  BoxShadow(
                    color: const Color(0xFF131B2E).withValues(alpha: 0.04),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatusIcon(isArrived),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              passenger.name.toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: AppColors.textPrimary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                _buildTypeBadge(isChild, passenger.typeLabel),
                                const SizedBox(width: 6),
                                Flexible(
                                  child: Text(
                                    '#${_extractShortId(passenger.id)}',
                                    style: const TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: 10,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      _buildStatusBadge(isArrived),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(Icons.badge_outlined, passenger.idNumber),
                  if (passenger.email.isNotEmpty) ...[
                    const SizedBox(height: 3),
                    _buildInfoRow(Icons.mail_outline, passenger.email),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIcon(bool isArrived) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: isArrived ? AppColors.primary : Colors.transparent,
        border: isArrived
            ? null
            : Border.all(color: AppColors.inputBorder, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: isArrived
          ? const Icon(Icons.done, color: Colors.white, size: 14)
          : null,
    );
  }

  Widget _buildTypeBadge(bool isChild, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: isChild ? Colors.orange[50] : Colors.blue[50],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.bold,
          color: isChild ? Colors.orange[700] : Colors.blue[700],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(bool isArrived) {
    if (isArrived) {
      return const Text(
        'ĐÃ ĐẾN',
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 9,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        'NO-SHOW',
        style: TextStyle(
          color: AppColors.error,
          fontSize: 8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 12, color: AppColors.textSecondary),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  String _extractShortId(String id) {
    if (id.length <= 8) return id;
    return id.substring(id.length - 8);
  }
}
