import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class TripBookingCard extends StatelessWidget {
  const TripBookingCard({
    super.key,
    required this.departureTime,
    required this.arrivalTime,
    required this.originDestination,
    required this.destinationDestination,
    required this.bookedSeatNames,
    required this.basePrice,
    required this.totalPrice,
    required this.status,
    required this.statusLabel,
    required this.onTap,
    this.coachLicensePlate,
    this.paymentDeadline,
    this.paymentMethod,
    this.paymentStatus,
  });

  final DateTime departureTime;
  final DateTime? arrivalTime;
  final String originDestination;
  final String destinationDestination;
  final List<String> bookedSeatNames;
  final double basePrice;
  final double totalPrice;
  final String status;
  final String statusLabel;
  final VoidCallback onTap;
  final String? coachLicensePlate;
  final DateTime? paymentDeadline;
  final String? paymentMethod;
  final String? paymentStatus;

  Color _statusColor(String s) {
    switch (s.toUpperCase()) {
      case 'PAID':
        return Colors.green;
      case 'CANCELLED':
        return Colors.red;
      case 'CHECKED_IN':
        return Colors.blue;
      case 'NO_SHOW':
        return Colors.red.shade300;
      case 'CHECKED_OUT':
        return Colors.teal;
      case 'PENDING':
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sc = _statusColor(status);
    final duration = arrivalTime != null
        ? _formatDuration(departureTime, arrivalTime!)
        : null;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === Header: route + status ===
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: sc.withValues(alpha: 0.06),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.directions_bus,
                          color: AppColors.primary,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              originDestination,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF131B2E),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              destinationDestination,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF131B2E),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: sc.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          statusLabel,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: sc,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // === Body ===
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date + Time row
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        _formatDate(departureTime),
                        style: TextStyle(
                          fontSize: 11,
                          color: sc,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (arrivalTime != null)
                        Text(
                          '${_formatTime(departureTime)} → ${_formatTime(arrivalTime!)}',
                          style: TextStyle(
                            fontSize: 11,
                            color: sc,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      if (duration != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 1,
                          ),
                          decoration: BoxDecoration(
                            color: sc.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            duration,
                            style: TextStyle(
                              fontSize: 10,
                              color: sc,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Seats
                  if (bookedSeatNames.isNotEmpty) ...[
                    _InfoRow(
                      icon: Icons.event_seat_outlined,
                      text: 'Ghế: ${bookedSeatNames.join(", ")}',
                    ),
                    const SizedBox(height: 6),
                  ],

                  // Coach plate
                  if (coachLicensePlate != null &&
                      coachLicensePlate!.isNotEmpty) ...[
                    _InfoRow(
                      icon: Icons.directions_car_outlined,
                      text: coachLicensePlate!,
                    ),
                    const SizedBox(height: 6),
                  ],

                  // Payment method
                  if (paymentMethod != null && paymentMethod!.isNotEmpty) ...[
                    _InfoRow(
                      icon: Icons.payment_outlined,
                      text: paymentMethod!,
                    ),
                    const SizedBox(height: 6),
                  ],

                  const SizedBox(height: 6),
                  const Divider(height: 1, color: Color(0xFFF0F0F5)),
                  const SizedBox(height: 10),

                  // Price + Xem them
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (bookedSeatNames.length > 1)
                            Text(
                              '${bookedSeatNames.length} × ${_formatPrice(basePrice)}',
                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFF717786),
                              ),
                            ),
                          Text(
                            _formatPrice(totalPrice),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: onTap,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Xem thêm',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                              SizedBox(width: 2),
                              Icon(
                                Icons.chevron_right,
                                size: 14,
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // === Footer: payment deadline for PENDING ===
            if (status == 'PENDING' && paymentDeadline != null)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFF8E6),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      size: 14,
                      color: Colors.orange.shade700,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        'Hạn thanh toán: ${_formatDate(paymentDeadline!)} lúc ${_formatTime(paymentDeadline!)}',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.orange.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime dt) =>
      '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';

  String _formatDate(DateTime dt) {
    const weekdays = ['T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'CN'];
    return '${weekdays[dt.weekday - 1]}, ${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';
  }

  String _formatDuration(DateTime start, DateTime end) {
    final diff = end.difference(start);
    return '${diff.inHours}h${diff.inMinutes % 60 > 0 ? ' ${diff.inMinutes % 60}p' : ''}';
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
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
        Icon(icon, size: 13, color: const Color(0xFF717786)),
        const SizedBox(width: 5),
        Flexible(
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, color: Color(0xFF414755)),
          ),
        ),
      ],
    );
  }
}
