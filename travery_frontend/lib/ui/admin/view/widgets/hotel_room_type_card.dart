import 'package:flutter/material.dart';
import '../../../../domain/models/admin/business_room_type/business_room_type.dart';
import 'package:intl/intl.dart';

class HotelRoomTypeCard extends StatelessWidget {
  final BusinessRoomType roomType;
  final VoidCallback onTap;

  const HotelRoomTypeCard({
    super.key,
    required this.roomType,
    required this.onTap,
  });

  String _getBedTypeName(BedType type) {
    switch (type) {
      case BedType.single:
        return 'Single';
      case BedType.double:
        return 'Double';
      case BedType.twin:
        return 'Twin';
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F4FB),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              roomType.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.bed_outlined, size: 18, color: Color(0xFF475569)),
                const SizedBox(width: 4),
                Text(
                  _getBedTypeName(roomType.bedType),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF475569),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.person_outline, size: 18, color: Color(0xFF475569)),
                const SizedBox(width: 4),
                Text(
                  '${roomType.aldultCapacity + roomType.childCapacity}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF475569),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                formatCurrency.format(roomType.pricePerNight),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0055C3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
