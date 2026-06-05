import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../domain/models/admin/business_room_type/business_room_type.dart';
import 'widgets/large_button.dart';

class RoomtypeManagementScreen extends StatefulWidget {
  final BusinessRoomType? roomType;

  const RoomtypeManagementScreen({super.key, this.roomType});

  @override
  State<RoomtypeManagementScreen> createState() =>
      _RoomtypeManagementScreenState();
}

class _RoomtypeManagementScreenState extends State<RoomtypeManagementScreen> {
  String _getBedTypeName(BedType type) {
    switch (type) {
      case BedType.single:
        return '1 Giường Single';
      case BedType.double:
        return '1 Giường Double';
      case BedType.twin:
        return '1 Giường Twin';
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

    // Use a default for preview if roomType is null
    final type =
        widget.roomType ??
        BusinessRoomType(
          name: 'Suite',
          pricePerNight: 3500000,
          aldultCapacity: 2,
          childCapacity: 1,
          bedType: BedType.single, // Or any default
        );

    return Scaffold(
      backgroundColor: const Color(
        0xFFF8FAFC,
      ), // slightly off-white background as seen in design
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Thông tin Loại phòng',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Xem thông tin của loại phòng đã chọn',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),

            // First Card: Room Name and Price
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      decoration: const BoxDecoration(
                        color: Color(0xFF0055C3),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'LOẠI PHÒNG',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF64748B),
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              type.name,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1E293B),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1F5F9),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'GIÁ MỖI ĐÊM',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF64748B),
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Text(
                                    formatCurrency.format(type.pricePerNight),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0055C3),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Second Card: Capacity
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDBEAFE),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.people, color: Color(0xFF0055C3)),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'SỨC CHỨA',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF64748B),
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${type.aldultCapacity} Người lớn, ${type.childCapacity} Trẻ em',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Third Card: Bed Type
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDBEAFE),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.bed, color: Color(0xFF0055C3)),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'LOẠI GIƯỜNG',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF64748B),
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _getBedTypeName(type.bedType),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Buttons
            LargeButton(
              text: 'Chỉnh sửa',
              color: const Color(0xFF0055C3),
              onTap: () {
                context.push(
                  '/admin_update_room_type_screen.dart',
                  extra: type,
                );
              },
            ),
            const SizedBox(height: 12),
            LargeButton(
              text: 'Xóa',
              color: const Color(0xFFC80000), // Red color
              onTap: () {
                // Handle delete
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
