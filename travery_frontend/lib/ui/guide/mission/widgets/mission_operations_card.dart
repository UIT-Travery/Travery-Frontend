import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';

class MissionOperationsCard extends StatelessWidget {
  final String licensePlate;
  final String driverName;
  final String hotelName;
  final VoidCallback onCallDriver;

  const MissionOperationsCard({
    super.key,
    required this.licensePlate,
    required this.driverName,
    required this.hotelName,
    required this.onCallDriver,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF131B2E).withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'THÔNG TIN VẬN HÀNH',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 14),
          _buildOpItem(
            icon: Icons.directions_bus_outlined,
            label: 'Biển số xe',
            value: licensePlate,
          ),
          const Divider(height: 20, color: AppColors.inputBorder),
          _buildOpItem(
            icon: Icons.person_outline,
            label: 'Tài xế',
            value: driverName,
            trailing: _buildCallButton(),
          ),
          const Divider(height: 20, color: AppColors.inputBorder),
          _buildOpItem(
            icon: Icons.apartment_outlined,
            label: 'Khách sạn / Điểm đón',
            value: hotelName,
          ),
        ],
      ),
    );
  }

  Widget _buildOpItem({
    required IconData icon,
    required String label,
    required String value,
    Widget? trailing,
  }) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: const BoxDecoration(
            color: AppColors.background,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primary, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: AppTextTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
        ?trailing,
      ],
    );
  }

  Widget _buildCallButton() {
    return GestureDetector(
      onTap: onCallDriver,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: AppColors.background,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.call, color: AppColors.primary, size: 16),
      ),
    );
  }
}
