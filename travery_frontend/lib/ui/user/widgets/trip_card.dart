import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class TripCard extends StatelessWidget {
  const TripCard({
    super.key,
    required this.departureTime,
    required this.arrivalTime,
    required this.originName,
    required this.destinationName,
    required this.price,
    this.coachType,
    this.availableSeats,
    this.totalSeats,
    this.onTap,
  });

  final DateTime departureTime;
  final DateTime arrivalTime;
  final String originName;
  final String destinationName;
  final double price;
  final String? coachType;
  final int? availableSeats;
  final int? totalSeats;
  final VoidCallback? onTap;

  String _formatTime(DateTime dt) {
    return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  String _formatDuration(DateTime start, DateTime end) {
    final diff = end.difference(start);
    final hours = diff.inHours;
    final minutes = diff.inMinutes % 60;
    if (hours == 0) return '${minutes}m';
    if (minutes == 0) return '${hours}h';
    return '${hours}h ${minutes}m';
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }

  String _coachLabel(String type) {
    switch (type.toUpperCase()) {
      case 'LIMOUSINE':
        return 'Ghế - Limousine';
      case 'BED':
        return 'Giường nằm';
      case 'SEAT':
      default:
        return 'Ghế ngồi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
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
            // Row 1: Departure time → Arrival time
            Row(
              children: [
                Text(
                  _formatTime(departureTime),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF131B2E),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: Color(0xFFE2E8F0),
                              thickness: 1,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 14,
                              color: Color(0xFF717786),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: Color(0xFFE2E8F0),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        '_____________',
                        style: TextStyle(
                          color: Color(0xFFE2E8F0),
                          letterSpacing: 4,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  _formatTime(arrivalTime),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF131B2E),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            // Duration
            Align(
              alignment: Alignment.center,
              child: Text(
                _formatDuration(departureTime, arrivalTime),
                style: const TextStyle(fontSize: 10, color: Color(0xFF717786)),
              ),
            ),
            const SizedBox(height: 10),
            // Info badge row
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    _formatPrice(price),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '•',
                      style: TextStyle(color: Color(0xFFE2E8F0)),
                    ),
                  ),
                  Text(
                    _coachLabel(coachType ?? 'SEAT'),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF717786),
                    ),
                  ),
                  if (totalSeats != null) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '•',
                        style: TextStyle(color: Color(0xFFE2E8F0)),
                      ),
                    ),
                    Text(
                      '$availableSeats/$totalSeats ghế trống',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF717786),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
