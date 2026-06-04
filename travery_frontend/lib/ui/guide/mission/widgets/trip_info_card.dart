import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class TripInfoCard extends StatelessWidget {
  const TripInfoCard({super.key, required this.mission});

  final GuideMissionDetail mission;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.info_outline,
                color: AppColors.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                'Thông tin chuyến đi',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _InfoItem(
                  icon: Icons.calendar_today_outlined,
                  label: 'Ngày khởi hành',
                  value: _formatDateRange(mission.startDate, mission.endDate),
                ),
              ),
              Expanded(
                child: _InfoItem(
                  icon: Icons.access_time,
                  label: 'Thời gian',
                  value: _calculateDuration(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _InfoItem(
                  icon: Icons.location_on_outlined,
                  label: 'Nơi khởi hành',
                  value: mission.pickupLocation.isNotEmpty
                      ? mission.pickupLocation
                      : 'Chưa có',
                ),
              ),
              Expanded(
                child: _InfoItem(
                  icon: Icons.flag_outlined,
                  label: 'Điểm đến',
                  value: mission.destinationName.isNotEmpty
                      ? mission.destinationName
                      : 'Chưa có',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDateRange(DateTime start, DateTime end) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    return '${dateFormat.format(start)} - ${dateFormat.format(end)}';
  }

  String _calculateDuration() {
    final days = endDate.difference(startDate).inDays;
    final nights = days > 0 ? days - 1 : 0;
    if (days == 0) return '1 ngày';
    return '$days ngày $nights đêm';
  }

  DateTime get startDate => mission.startDate;
  DateTime get endDate => mission.endDate;
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.primary, size: 16),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
