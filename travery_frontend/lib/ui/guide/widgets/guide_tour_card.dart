import 'package:flutter/material.dart';
import 'package:travery_frontend/data/seed_models/guide_tour/guide_tour.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class GuideTourCard extends StatelessWidget {
  final GuideTour tour;
  final VoidCallback onTap;

  const GuideTourCard({super.key, required this.tour, required this.onTap});

  String get _statusLabel {
    switch (tour.status) {
      case GuideTourStatus.ongoing:
        return 'Đang diễn ra';
      case GuideTourStatus.completed:
        return 'Đã hoàn thành';
      case GuideTourStatus.upcoming:
        return 'Sắp tới';
    }
  }

  Color get _statusColor {
    switch (tour.status) {
      case GuideTourStatus.ongoing:
        return const Color(0xFFD97706); // amber
      case GuideTourStatus.completed:
        return const Color(0xFFE11D48); // rose
      case GuideTourStatus.upcoming:
        return const Color(0xFF10B981); // emerald
    }
  }

  Color get _statusBgColor {
    switch (tour.status) {
      case GuideTourStatus.ongoing:
        return const Color(0xFFFEF3C7);
      case GuideTourStatus.completed:
        return const Color(0xFFFEE2E2);
      case GuideTourStatus.upcoming:
        return const Color(0xFFD1FAE5);
    }
  }

  String get _buttonLabel {
    switch (tour.status) {
      case GuideTourStatus.ongoing:
        return 'Tiếp tục điều hành';
      case GuideTourStatus.completed:
        return 'Xem lại';
      case GuideTourStatus.upcoming:
        return 'Xem nhiệm vụ';
    }
  }

  String get _idSuffix {
    final id = tour.id ?? tour.tourInstanceId;
    if (id.isEmpty) return 'N/A';
    final len = id.length;
    return id.substring(len.clamp(0, len)).toUpperCase();
  }

  String get _formattedDate {
    return '${tour.startDate.day}/${tour.startDate.month}/${tour.startDate.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#$_idSuffix',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        letterSpacing: 1,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _statusBgColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _statusLabel,
                        style: TextStyle(
                          color: _statusColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  tour.tourName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.textPrimary,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 14,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      _formattedDate,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.groups_outlined,
                      size: 14,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${tour.groupSize} khách',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _buttonLabel,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.arrow_forward, size: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
