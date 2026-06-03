import 'package:flutter/material.dart';

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
