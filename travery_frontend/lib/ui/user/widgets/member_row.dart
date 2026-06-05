import 'package:flutter/material.dart';

class MemberRow extends StatelessWidget {
  const MemberRow({
    super.key,
    required this.memberName,
    required this.memberType,
    this.identity,
    this.dateOfBirth,
    this.attendanceStatus,
  });

  final String memberName;
  final String memberType;
  final String? identity;
  final String? dateOfBirth;
  final String? attendanceStatus;

  @override
  Widget build(BuildContext context) {
    final isAdult = memberType == 'ADULT';

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    memberName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF131B2E),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      isAdult ? Icons.person : Icons.child_care,
                      size: 14,
                      color: const Color(0xFF717786),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      isAdult ? 'Người lớn' : 'Trẻ em',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF717786),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFE2E8F0)),

          if (identity != null && identity!.isNotEmpty) ...[
            _buildFieldRow('CCCD', identity!),
            const Divider(height: 1, color: Color(0xFFE2E8F0)),
          ],

          if (dateOfBirth != null && dateOfBirth!.isNotEmpty) ...[
            _buildFieldRow('Ngày sinh', _formatDate(dateOfBirth!)),
            const Divider(height: 1, color: Color(0xFFE2E8F0)),
          ],

          if (attendanceStatus != null && attendanceStatus!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Điểm danh',
                    style: TextStyle(fontSize: 13, color: Color(0xFF717786)),
                  ),
                  _buildAttendanceBadge(attendanceStatus!),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFieldRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 13, color: Color(0xFF717786)),
          ),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF131B2E),
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceBadge(String status) {
    Color bgColor;
    Color textColor;
    String label;

    switch (status.toUpperCase()) {
      case 'PRESENT':
        bgColor = const Color(0xFFECFDF5);
        textColor = const Color(0xFF059669);
        label = 'Có mặt';
        break;
      case 'ABSENT':
        bgColor = const Color(0xFFFEE2E2);
        textColor = const Color(0xFFDC2626);
        label = 'Vắng';
        break;
      default:
        bgColor = const Color(0xFFF1F5F9);
        textColor = const Color(0xFF64748B);
        label = 'Chưa điểm danh';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    } catch (_) {
      return dateStr;
    }
  }
}
