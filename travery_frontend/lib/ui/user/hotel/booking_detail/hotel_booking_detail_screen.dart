import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/models/hotel/hotel_booking_data.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/user/hotel/booking_detail/view_models/hotel_booking_detail_view_model.dart';
import 'package:travery_frontend/ui/user/hotel/widgets/hotel_app_bar.dart';

class HotelBookingDetailScreen extends StatefulWidget {
  const HotelBookingDetailScreen({super.key});

  @override
  State<HotelBookingDetailScreen> createState() =>
      _HotelBookingDetailScreenState();
}

class _HotelBookingDetailScreenState extends State<HotelBookingDetailScreen> {
  String? _lastLoadedBookingId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadFromRoute());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadFromRoute());
  }

  void _loadFromRoute() {
    if (!mounted) return;

    // Try to get booking from route extra (if passed from list)
    final extra =
        GoRouterState.of(context).extra as Map<String, HotelBookingData>?;
    final booking = extra?['booking'];

    // Get bookingId: from passed booking, or from URL path parameter
    final bookingId =
        booking?.id ?? GoRouterState.of(context).pathParameters['id'] ?? '';

    debugPrint(
      '[_loadFromRoute] bookingId=$bookingId, booking=${booking != null}, extra keys=${extra?.keys.toList()}',
    );

    if (bookingId.isEmpty) {
      debugPrint('[_loadFromRoute] bookingId is empty, skipping');
      return;
    }
    if (bookingId == _lastLoadedBookingId) {
      debugPrint(
        '[_loadFromRoute] already loaded bookingId=$_lastLoadedBookingId, skipping',
      );
      return;
    }
    _lastLoadedBookingId = bookingId;

    debugPrint('[_loadFromRoute] calling loadBooking with id=$bookingId');
    context.read<HotelBookingDetailViewModel>().loadBooking(
      bookingId,
      bookingData: booking,
    );
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    } catch (e) {
      return dateStr;
    }
  }

  String _getStatusLabel(String status) {
    switch (status) {
      case 'PAID':
        return 'Đã thanh toán';
      case 'PENDING':
        return 'Chờ thanh toán';
      case 'CHECKED_IN':
        return 'Đã check-in';
      case 'CHECKED_OUT':
        return 'Đã trả phòng';
      case 'CANCELLED':
        return 'Đã hủy';
      default:
        return status;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'PAID':
        return const Color(0xFF22C55E);
      case 'PENDING':
        return const Color(0xFFF59E0B);
      case 'CHECKED_IN':
        return const Color(0xFF007AFF);
      case 'CHECKED_OUT':
        return const Color(0xFF6B7280);
      case 'CANCELLED':
        return const Color(0xFFEF4444);
      default:
        return const Color(0xFF6B7280);
    }
  }

  String _getMemberTypeLabel(String type) {
    switch (type) {
      case 'ADULT':
        return 'Người lớn';
      case 'CHILD':
        return 'Trẻ em';
      case 'INFANT':
        return 'Em bé';
      default:
        return type;
    }
  }

  String _getAttendanceStatusLabel(String status) {
    switch (status) {
      case 'NOT_CHECKED':
        return 'Chưa check-in';
      case 'CHECKED_IN':
        return 'Đã check-in';
      case 'CHECKED_OUT':
        return 'Đã check-out';
      default:
        return status;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: const HotelAppBar(title: 'Chi tiết đặt phòng'),
      body: Consumer<HotelBookingDetailViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading && vm.booking == null) {
            return const Center(child: CircularProgressIndicator());
          }
          final booking = vm.booking;
          if (booking == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Không tìm thấy thông tin đặt phòng'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () =>
                        vm.loadBookings(_lastLoadedBookingId ?? ''),
                    child: const Text('Thử lại'),
                  ),
                ],
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    final id = _lastLoadedBookingId ?? booking.id;
                    await vm.loadBooking(id);
                  },
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildStatusSection(booking),
                      const SizedBox(height: 16),
                      _buildInfoSection(booking),
                      const SizedBox(height: 16),
                      _buildMemberSection(booking),
                      const SizedBox(height: 16),
                      _buildRoomSection(booking),
                      const SizedBox(height: 16),
                      _buildAddOnSection(vm),
                      const SizedBox(height: 16),
                      _buildPaymentSection(booking),
                    ],
                  ),
                ),
              ),
              _buildBottomActions(context, booking),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStatusSection(HotelBookingData booking) {
    final status = booking.status;
    final statusColor = _getStatusColor(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: statusColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            status == 'PAID' ||
                    status == 'CHECKED_IN' ||
                    status == 'CHECKED_OUT'
                ? Icons.check_circle
                : status == 'CANCELLED'
                ? Icons.cancel
                : Icons.access_time,
            color: statusColor,
            size: 24,
          ),
          const SizedBox(width: 12),
          Text(
            _getStatusLabel(booking.status),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: statusColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(HotelBookingData booking) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('Khách sạn', booking.hotelName),
          if (booking.hotelAddress.isNotEmpty)
            _buildInfoRow('Địa chỉ', booking.hotelAddress),
          _buildInfoRow('Nhận phòng', _formatDate(booking.startDate ?? '')),
          _buildInfoRow('Trả phòng', _formatDate(booking.endDate ?? '')),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          if (booking.transactionId != null &&
              booking.transactionId!.isNotEmpty)
            _buildInfoRow('Mã đặt phòng', booking.transactionId!, wrap: true),
          if (booking.gatewayTransactionId != null &&
              booking.gatewayTransactionId!.isNotEmpty)
            _buildInfoRow(
              'Mã giao dịch',
              booking.gatewayTransactionId!,
              wrap: true,
            ),
        ],
      ),
    );
  }

  Widget _buildMemberSection(HotelBookingData booking) {
    final members = booking.members ?? [];
    if (members.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Khách lưu trú',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 12),
          ...members.asMap().entries.map((entry) {
            final index = entry.key;
            final member = entry.value;
            return Container(
              padding: const EdgeInsets.all(12),
              margin: EdgeInsets.only(top: index > 0 ? 12 : 0),
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        member.fullName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3B82F6).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          _getMemberTypeLabel(member.memberType),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3B82F6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'CCCD: ${member.identityNumber}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Ngày sinh: ${_formatDate(member.dateOfBirth)}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Trạng thái: ${_getAttendanceStatusLabel(member.attendanceStatus ?? '')}',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: member.attendanceStatus == 'CHECKED_IN'
                          ? const Color(0xFF22C55E)
                          : const Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildRoomSection(HotelBookingData booking) {
    final items = booking.items ?? [];
    if (items.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Phòng đặt',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 12),
          ...items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return Container(
              padding: const EdgeInsets.all(12),
              margin: EdgeInsets.only(top: index > 0 ? 12 : 0),
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.bed, size: 20, color: Color(0xFF6B7280)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          item.roomTypeName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                      ),
                      Text(
                        _formatPrice(item.priceAtNight),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Text(
                      'x${item.quantity} phòng',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ),
                  if (item.amenities != null && item.amenities!.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: SizedBox(
                        height: 32,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: item.amenities!.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 8),
                          itemBuilder: (context, idx) {
                            final amenity = item.amenities![idx];
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F4F6),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: const Color(0xFFE5E7EB),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    _getAmenityIcon(amenity.name),
                                    size: 14,
                                    color: const Color(0xFF007AFF),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    amenity.name,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF4B5563),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  IconData _getAmenityIcon(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('wifi') || lower.contains('wi-fi')) {
      return Icons.wifi;
    } else if (lower.contains('ac') ||
        lower.contains('điều hòa') ||
        lower.contains('air')) {
      return Icons.ac_unit;
    } else if (lower.contains('tv') || lower.contains('television')) {
      return Icons.tv;
    } else if (lower.contains('bath') ||
        lower.contains('bồn') ||
        lower.contains('hot')) {
      return Icons.bathtub;
    } else if (lower.contains('pool') ||
        lower.contains('bể') ||
        lower.contains('swim')) {
      return Icons.pool;
    } else if (lower.contains('parking') ||
        lower.contains('đỗ') ||
        lower.contains('garage')) {
      return Icons.local_parking;
    } else if (lower.contains('restaurant') ||
        lower.contains('eat') ||
        lower.contains('buffet')) {
      return Icons.restaurant;
    } else if (lower.contains('gym') ||
        lower.contains('fitness') ||
        lower.contains('sport')) {
      return Icons.fitness_center;
    } else if (lower.contains('spa') || lower.contains('massage')) {
      return Icons.spa;
    } else if (lower.contains('breakfast') ||
        lower.contains('sáng') ||
        lower.contains('buffet')) {
      return Icons.free_breakfast;
    } else if (lower.contains('laundry') ||
        lower.contains('giặt') ||
        lower.contains('iron')) {
      return Icons.local_laundry_service;
    } else if (lower.contains('shuttle') ||
        lower.contains('đưa') ||
        lower.contains('đón')) {
      return Icons.airport_shuttle;
    } else if (lower.contains('pet') || lower.contains('thú')) {
      return Icons.pets;
    } else if (lower.contains('balcony') || lower.contains('ban công')) {
      return Icons.balcony;
    }
    return Icons.check_circle_outline;
  }

  Widget _buildAddOnSection(HotelBookingDetailViewModel vm) {
    final addOnBill = vm.addOnBill;
    if (addOnBill == null && !vm.isLoadingAddOnBill) {
      return const SizedBox.shrink();
    }

    if (vm.isLoadingAddOnBill) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      );
    }

    final orders = addOnBill?.addOnOrders ?? [];
    if (orders.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.room_service_outlined,
                size: 20,
                color: Color(0xFF6B7280),
              ),
              const SizedBox(width: 8),
              const Text(
                'Dịch vụ đã đặt',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              const Spacer(),
              Text(
                '${orders.length} dịch vụ',
                style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...orders.asMap().entries.map((entry) {
            final index = entry.key;
            final order = entry.value;
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.only(top: index > 0 ? 8 : 0),
              decoration: BoxDecoration(
                border: index < orders.length - 1
                    ? const Border(bottom: BorderSide(color: Color(0xFFF3F4F6)))
                    : null,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.serviceName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${order.quantity}x',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _formatPrice(order.totalPrice),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF007AFF),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _formatPrice(order.unitPrice) + '/dịch vụ',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tổng dịch vụ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F2937),
                ),
              ),
              Text(
                _formatPrice(addOnBill?.totalAddOnCharges ?? 0),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF007AFF),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentSection(HotelBookingData booking) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.payments_outlined,
            size: 20,
            color: Color(0xFF6B7280),
          ),
          const SizedBox(width: 12),
          const Text(
            'Tổng tiền',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1F2937),
            ),
          ),
          const Spacer(),
          Text(
            _formatPrice(booking.totalPrice),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF007AFF),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    String label,
    String value, {
    bool valueBold = false,
    Color? valueColor,
    bool wrap = false,
  }) {
    if (wrap) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 13, color: Color(0xFF9CA3AF)),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 13,
                fontWeight: valueBold ? FontWeight.bold : FontWeight.w500,
                color: valueColor ?? const Color(0xFF1F2937),
              ),
            ),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: const TextStyle(fontSize: 13, color: Color(0xFF9CA3AF)),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 13,
                fontWeight: valueBold ? FontWeight.bold : FontWeight.w500,
                color: valueColor ?? const Color(0xFF1F2937),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isBeforeCheckIn(HotelBookingData booking) {
    try {
      String? startDateStr = booking.startDate;
      if (startDateStr == null) {
        final checkIn = booking.checkInDate;
        startDateStr =
            '${checkIn.year}-${checkIn.month.toString().padLeft(2, '0')}-${checkIn.day.toString().padLeft(2, '0')}';
      }
      final startDate = DateTime.parse(startDateStr);
      final now = DateTime.now();
      final todayStart = DateTime(now.year, now.month, now.day);
      final checkInDay = DateTime(
        startDate.year,
        startDate.month,
        startDate.day,
      );
      return !todayStart.isAfter(checkInDay);
    } catch (_) {
      return true;
    }
  }

  Widget _buildBottomActions(BuildContext context, HotelBookingData booking) {
    final status = booking.status;
    final canCancel = status == 'PAID' && _isBeforeCheckIn(booking);
    final isCheckedIn = status == 'CHECKED_IN';

    final hasCancel = canCancel;
    final hasAddon = isCheckedIn;

    if (!hasCancel && !hasAddon) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        12,
        16,
        MediaQuery.of(context).padding.bottom + 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(top: BorderSide(color: Color(0xFFF3F4F6))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            if (hasCancel)
              Expanded(
                child: OutlinedButton(
                  onPressed: () => context.push(
                    Routes.hotelCancel.replaceFirst(':id', booking.id),
                    extra: {'booking': booking},
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFEF4444),
                    side: const BorderSide(color: Color(0xFFEF4444)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Hủy đặt phòng',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            if (hasCancel && hasAddon) const SizedBox(width: 12),
            if (hasAddon)
              Expanded(
                child: OutlinedButton(
                  onPressed: () => context.push(
                    Routes.hotelCheckout.replaceFirst(':id', booking.id),
                    extra: {'booking': booking, 'bookingId': booking.id},
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF007AFF),
                    side: const BorderSide(color: Color(0xFF007AFF)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Đặt dịch vụ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
