import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({super.key, required this.remainingTime});

  final Duration remainingTime;

  bool get _isUrgent => remainingTime.inMinutes < 5;

  String get _countdownText {
    final minutes = remainingTime.inMinutes
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    final seconds = remainingTime.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: _isUrgent
            ? Colors.red.withValues(alpha: 0.1)
            : const Color(0xFFF2F3FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.schedule,
            size: 18,
            color: _isUrgent ? Colors.red : AppColors.primary,
          ),
          const SizedBox(width: 8),
          Text(
            'Giữ chỗ trong $_countdownText',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: _isUrgent ? Colors.red : const Color(0xFF0058BC),
            ),
          ),
        ],
      ),
    );
  }
}
