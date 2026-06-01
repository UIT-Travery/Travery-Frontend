import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
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
        return const Color(0xFFD97706);
      case GuideTourStatus.completed:
        return const Color(0xFFE11D48);
      case GuideTourStatus.upcoming:
        return const Color(0xFF10B981);
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
    return id.substring(0, id.length.clamp(0, 8)).toUpperCase();
  }

  String get _passengerCountText {
    final count = tour.passengerCount ?? tour.groupSize;
    if (count == 0) return 'Chưa có dữ liệu khách';
    return '$count khách';
  }

  String get _formattedDate {
    return '${tour.startDate.day}/${tour.startDate.month}/${tour.startDate.year}';
  }

  Future<void> _callDriver(BuildContext context) async {
    final phone = tour.driverPhone ?? tour.vehiclePlate;
    if (phone == null || phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Số điện thoại tài xế chưa có'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }
    final uri = Uri(scheme: 'tel', path: phone);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        await Clipboard.setData(ClipboardData(text: phone));
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Đã sao chép số: $phone'),
              backgroundColor: AppColors.primary,
            ),
          );
        }
      }
    } catch (_) {
      await Clipboard.setData(ClipboardData(text: phone));
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Đã sao chép số: $phone'),
            backgroundColor: AppColors.primary,
          ),
        );
      }
    }
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        tour.tourName.isNotEmpty
                            ? tour.tourName
                            : 'Tour không tên (${_idSuffix})',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: AppColors.textPrimary,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 8),
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
                if (tour.pickupLocation != null &&
                    tour.pickupLocation!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          tour.pickupLocation!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
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
                      _passengerCountText,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                if (tour.driverName != null && tour.driverName!.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.person_outline,
                        size: 14,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          'TX: ${tour.driverName}${tour.coachType != null && tour.coachType!.isNotEmpty ? ' • ${tour.coachType}' : ''}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (tour.driverPhone != null &&
                          tour.driverPhone!.isNotEmpty)
                        GestureDetector(
                          onTap: () => _callDriver(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8F0FE),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.phone,
                                  size: 12,
                                  color: AppColors.primary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  tour.driverPhone!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
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
