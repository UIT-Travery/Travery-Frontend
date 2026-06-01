import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class MemberRow extends StatelessWidget {
  const MemberRow({
    super.key,
    required this.memberName,
    required this.memberType,
    this.identity,
  });

  final String memberName;
  final String memberType;
  final String? identity;

  @override
  Widget build(BuildContext context) {
    final isAdult = memberType == 'ADULT';
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFF2F3FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.person, size: 20, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  memberName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF131B2E),
                  ),
                ),
                if (identity != null && identity!.isNotEmpty)
                  Text(
                    'CCCD: $identity',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF414755),
                    ),
                  ),
              ],
            ),
          ),
          if (memberType.isNotEmpty)
            Icon(
              isAdult ? Icons.person : Icons.child_care,
              size: 20,
              color: isAdult ? AppColors.primary : Colors.orange[700],
            ),
        ],
      ),
    );
  }
}
