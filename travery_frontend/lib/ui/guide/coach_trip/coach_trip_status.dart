import 'package:flutter/material.dart';

class CoachTripStatusStyle {
  const CoachTripStatusStyle({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
  });

  final String label;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;
}

CoachTripStatusStyle coachTripStatusStyle(String status) {
  switch (status.toUpperCase()) {
    case 'OPEN':
    case 'FULL':
      return const CoachTripStatusStyle(
        label: 'Sẵn sàng',
        backgroundColor: Color(0xFFEFFAF3),
        textColor: Color(0xFF16A34A),
        icon: Icons.play_circle_outline,
      );
    case 'IN_PROGRESS':
      return const CoachTripStatusStyle(
        label: 'Đang chạy',
        backgroundColor: Color(0xFFEFF6FF),
        textColor: Color(0xFF1A73E8),
        icon: Icons.directions_bus_filled_outlined,
      );
    case 'COMPLETED':
      return const CoachTripStatusStyle(
        label: 'Đã xong',
        backgroundColor: Color(0xFFF3F4F6),
        textColor: Color(0xFF6B7280),
        icon: Icons.check_circle_outline,
      );
    case 'CANCELLED':
      return const CoachTripStatusStyle(
        label: 'Đã hủy',
        backgroundColor: Color(0xFFFEF2F2),
        textColor: Color(0xFFEF4444),
        icon: Icons.cancel_outlined,
      );
    default:
      return CoachTripStatusStyle(
        label: status,
        backgroundColor: const Color(0xFFFEF3C7),
        textColor: const Color(0xFFD97706),
        icon: Icons.info_outline,
      );
  }
}
