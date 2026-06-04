import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travery_frontend/data/seed_models/guide_tour/guide_tour.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class GuideTourCard extends StatelessWidget {
  const GuideTourCard({super.key, required this.tour, required this.onTap});

  final GuideTour tour;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border(left: BorderSide(color: _statusColor, width: 4)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tour name
              Text(
                tour.tourName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              // Status badge
              _StatusBadge(status: tour.status),
              const SizedBox(height: 16),
              // Date and passengers info
              _InfoRow(
                icon: Icons.calendar_today_outlined,
                text: _formatDateRange(tour.startDate, tour.endDate),
              ),
              const SizedBox(height: 8),
              _InfoRow(
                icon: Icons.people_outline,
                text: '${tour.passengerCount ?? tour.groupSize} khách',
              ),
              const SizedBox(height: 16),
              // Action button
              SizedBox(
                width: double.infinity,
                child: _ActionButton(status: tour.status),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDateRange(DateTime start, DateTime end) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    return '${dateFormat.format(start)} - ${dateFormat.format(end)}';
  }

  Color get _statusColor {
    switch (tour.status) {
      case GuideTourStatus.ongoing:
        return AppColors.success;
      case GuideTourStatus.completed:
        return Colors.grey;
      case GuideTourStatus.upcoming:
        return AppColors.primary;
    }
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final GuideTourStatus status;

  @override
  Widget build(BuildContext context) {
    final (bgColor, textColor, label) = _getStatusStyle();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: textColor, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: textColor,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  (Color, Color, String) _getStatusStyle() {
    switch (status) {
      case GuideTourStatus.ongoing:
        return (
          const Color(0xFFeffaf3),
          const Color(0xFF22c55e),
          'ĐANG DIỄN RA',
        );
      case GuideTourStatus.completed:
        return (const Color(0xFFf3f4f6), const Color(0xFF6b7280), 'HOÀN THÀNH');
      case GuideTourStatus.upcoming:
        return (const Color(0xFFeef2ff), const Color(0xFF3b82f6), 'ĐANG MỞ');
    }
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.primary),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.status});

  final GuideTourStatus status;

  @override
  Widget build(BuildContext context) {
    final (bgColor, textColor, label) = _getButtonStyle();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: bgColor == Colors.transparent
            ? Border.all(color: AppColors.primary)
            : null,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }

  (Color, Color, String) _getButtonStyle() {
    switch (status) {
      case GuideTourStatus.ongoing:
        return (AppColors.primary, Colors.white, 'Quản lý chuyến đi');
      case GuideTourStatus.completed:
        return (Colors.grey.shade200, Colors.grey.shade600, 'Xem lại');
      case GuideTourStatus.upcoming:
        return (Colors.transparent, AppColors.primary, 'Xem chi tiết');
    }
  }
}
