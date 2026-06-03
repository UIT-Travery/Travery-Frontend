import 'package:flutter/material.dart';
import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class PassengerList extends StatefulWidget {
  const PassengerList({super.key, required this.bookings});

  final List<GuideBooking> bookings;

  @override
  State<PassengerList> createState() => _PassengerListState();
}

class _PassengerListState extends State<PassengerList> {
  final Set<String> _expandedBookings = {};

  @override
  Widget build(BuildContext context) {
    final totalPassengers = widget.bookings.fold<int>(
      0,
      (sum, b) => sum + b.members.length,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.people_outline,
              color: AppColors.primary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Danh sách hành khách ($totalPassengers)',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (widget.bookings.isEmpty)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                'Chưa có hành khách nào',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ),
          )
        else
          ...widget.bookings.map((booking) => _buildBookingCard(booking)),
      ],
    );
  }

  Widget _buildBookingCard(GuideBooking booking) {
    final isExpanded = _expandedBookings.contains(booking.id);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // Booking header
            InkWell(
              onTap: () {
                setState(() {
                  if (isExpanded) {
                    _expandedBookings.remove(booking.id);
                  } else {
                    _expandedBookings.add(booking.id);
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            booking.customerName,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${booking.members.length} thành viên',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildPaymentStatus(booking.status),
                    const SizedBox(width: 8),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColors.icon,
                    ),
                  ],
                ),
              ),
            ),
            // Expanded members list
            if (isExpanded) ...[
              const Divider(height: 1, color: AppColors.surfaceGray),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: booking.members.map((member) {
                    return _MemberTile(member: member);
                  }).toList(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentStatus(String status) {
    final (bgColor, textColor, label) = _getPaymentStatusStyle(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }

  (Color, Color, String) _getPaymentStatusStyle(String status) {
    switch (status.toUpperCase()) {
      case 'PAID':
      case 'COMPLETED':
      case 'CONFIRMED':
        return (
          const Color(0xFFeffaf3),
          const Color(0xFF22c55e),
          'Đã thanh toán',
        );
      case 'PENDING':
      case 'WAITING':
        return (
          const Color(0xFFfef3c7),
          const Color(0xFFd97706),
          'Chờ thanh toán',
        );
      case 'CANCELLED':
        return (const Color(0xFFfef2f2), const Color(0xFFef4444), 'Đã hủy');
      default:
        return (const Color(0xFFf3f4f6), const Color(0xFF6b7280), status);
    }
  }
}

class _MemberTile extends StatelessWidget {
  const _MemberTile({required this.member});

  final GuideMember member;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, color: AppColors.primary, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.fullName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  member.identityNumber,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          _buildMemberTypeBadge(member.memberType),
          const SizedBox(width: 8),
          _buildAttendanceStatus(member.status),
        ],
      ),
    );
  }

  Widget _buildMemberTypeBadge(String memberType) {
    final isAdult = memberType == 'ADULT';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: isAdult ? AppColors.surfaceGray : const Color(0xFFe0f2fe),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        isAdult ? 'Người lớn' : 'Trẻ em',
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: isAdult ? AppColors.textSecondary : const Color(0xFF0369a1),
        ),
      ),
    );
  }

  Widget _buildAttendanceStatus(String status) {
    final (color, iconData) = _getAttendanceStyle(status);
    return Icon(iconData, color: color, size: 18);
  }

  (Color, IconData) _getAttendanceStyle(String status) {
    switch (status) {
      case 'CHECKED_IN':
        return (const Color(0xFF22c55e), Icons.check_circle);
      case 'NO_SHOW':
        return (const Color(0xFFef4444), Icons.cancel);
      default:
        return (AppColors.icon, Icons.radio_button_unchecked);
    }
  }
}
