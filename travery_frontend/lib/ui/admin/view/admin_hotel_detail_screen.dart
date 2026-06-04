import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/domain/models/admin/business_hotel/business_hotel.dart';
import 'package:travery_frontend/routing/routes.dart';

class AdminHotelDetailScreen extends StatelessWidget {
  final BusinessHotel hotel;

  const AdminHotelDetailScreen({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => context.pop(),
        ),
        title: Text(
          hotel.name,
          style: const TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hotel info card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'THÔNG TIN KHÁCH SẠN',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF64748B),
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    hotel.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Color(0xFF64748B),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${hotel.address}, ${hotel.cityProvince}',
                          style: const TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Quản lý',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),
            _ManagementTile(
              icon: Icons.meeting_room_outlined,
              iconColor: const Color(0xFF10B981),
              bgColor: const Color(0xFFD1FAE5),
              title: 'Danh sách phòng',
              subtitle: 'Quản lý các phòng của khách sạn',
              onTap: () {
                context.push(Routes.adminViewHotelRoomList(hotel.id));
              },
            ),
            const SizedBox(height: 12),
            _ManagementTile(
              icon: Icons.bed_outlined,
              iconColor: const Color(0xFF0055C3),
              bgColor: const Color(0xFFDBEAFE),
              title: 'Loại phòng',
              subtitle: 'Quản lý các loại phòng của khách sạn',
              onTap: () {
                context.push(
                  Routes.adminViewRoomtypeList,
                  extra: {'hotelId': hotel.id},
                );
              },
            ),
            const SizedBox(height: 12),
            _ManagementTile(
              icon: Icons.room_service_outlined,
              iconColor: const Color(0xFF059669),
              bgColor: const Color(0xFFD1FAE5),
              title: 'Dịch vụ khách sạn',
              subtitle: 'Quản lý các dịch vụ của khách sạn',
              onTap: () {
                context.push(
                  Routes.adminHotelServiceList,
                  extra: {'hotelId': hotel.id},
                );
              },
            ),
            const SizedBox(height: 12),
            _ManagementTile(
              icon: Icons.edit_outlined,
              iconColor: const Color(0xFFF59E0B),
              bgColor: const Color(0xFFFEF3C7),
              title: 'Chỉnh sửa thông tin',
              subtitle: 'Cập nhật thông tin khách sạn',
              onTap: () {
                context.push(Routes.adminUpdateHotelWithId(hotel.id));
              },
            ),
            const SizedBox(height: 12),
            _ManagementTile(
              icon: Icons.photo_library_outlined,
              iconColor: const Color(0xFF7C3AED),
              bgColor: const Color(0xFFEDE9FE),
              title: 'Hình ảnh',
              subtitle: 'Quản lý hình ảnh của khách sạn',
              onTap: () {
                context.push(
                  Routes.adminImageManagement,
                  extra: {'hotelId': hotel.id},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ManagementTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ManagementTile({
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Color(0xFF94A3B8),
            ),
          ],
        ),
      ),
    );
  }
}
