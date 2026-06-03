import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class PolicySection extends StatelessWidget {
  const PolicySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.policy, size: 18, color: AppColors.primary),
              SizedBox(width: 8),
              Text(
                'Chính sách hủy',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF131B2E),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          PolicyItem(
            percentage: '100%',
            label: 'Trước 7 ngày',
            color: AppColors.primary,
          ),
          PolicyItem(
            percentage: '50%',
            label: 'Từ 3 - 6 ngày',
            color: Colors.orange,
          ),
          PolicyItem(
            percentage: '0%',
            label: 'Dưới 3 ngày',
            color: Colors.grey,
          ),
          const SizedBox(height: 12),
          Text(
            '* Yêu cầu hủy sẽ được xử lý trong vòng 5-7 ngày làm việc.',
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class PolicyItem extends StatelessWidget {
  const PolicyItem({
    super.key,
    required this.percentage,
    required this.label,
    required this.color,
  });

  final String percentage;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, color: Color(0xFF414755)),
            ),
          ),
          Text(
            'Hoàn $percentage',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
