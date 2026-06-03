import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/data/services/api/model/tour/refund_policy_response/refund_policy_response.dart';

class RefundPolicyWidget extends StatelessWidget {
  const RefundPolicyWidget({super.key, required this.policy});

  final RefundPolicyResponse policy;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: policy.rules.map((rule) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Trước ${rule.timeBefore?.toInt() ?? 0} ngày khởi hành',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF414755),
                    ),
                  ),
                ),
                Text(
                  'Hoàn ${rule.refundPercentage?.toInt()}%',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF131B2E),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
