import 'package:flutter/material.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_theme.dart';

class VehicleCard extends StatelessWidget {
  const VehicleCard({
    super.key,
    required this.plateNumber,
    required this.vehicleType,
    required this.seatCount,
    this.onTap,
  });

  /// Licence plate displayed on the right, e.g. "51B - 882.41"
  final String plateNumber;

  /// Vehicle type label, e.g. "VIP Sleeper"
  final String vehicleType;

  /// Number of seats
  final int seatCount;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.inputBorder, width: 1),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Material(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Row 1: Plate number ────────────
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Plate number
                    Text(
                      plateNumber,
                      style: TextStyle(
                        fontSize: AppTextTheme.bodyLarge,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // ── Row 2: Vehicle type / seats ── Driver name ───────────────
                Row(
                  children: [
                    // Category icon + vehicle type + seat count
                    Icon(
                      Icons.category,
                      size: 15,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      vehicleType,
                      style: TextStyle(
                        fontSize: AppTextTheme.bodySmall,
                        color: AppColors.textSecondary,
                      ),
                    ),

                    const Spacer(),

                    // Person icon + seatcount
                    Icon(
                      Icons.event_seat_rounded,
                      size: 15,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Số chỗ ngồi: $seatCount',
                      style: TextStyle(
                        fontSize: AppTextTheme.bodySmall,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
