import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/widgets/info_row.dart';

class BookingSuccessScreen extends StatelessWidget {
  const BookingSuccessScreen({
    super.key,
    required this.bookingId,
    required this.tourName,
    required this.startDate,
    required this.totalPrice,
    required this.adultCount,
    required this.childCount,
  });

  final String bookingId;
  final String tourName;
  final String startDate;
  final double totalPrice;
  final int adultCount;
  final int childCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // Success Icon
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF10B981), Color(0xFF059669)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF10B981).withValues(alpha: 0.3),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.check_circle,
                  size: 56,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 32),

              const Text(
                'Đặt tour thành công!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF131B2E),
                ),
              ),

              const SizedBox(height: 12),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Cảm ơn bạn đã đặt tour. Vui lòng thanh toán để xác nhận booking.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF414755),
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Booking Info Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Booking Code
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'MÃ ĐẶT CHỖ',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF414755),
                            letterSpacing: 0.5,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            '#${_shortCode}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: AppColors.primary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    const Divider(height: 32),

                    // Tour Name
                    InfoRow(
                      icon: Icons.map,
                      label: 'Chuyến đi',
                      value: tourName,
                    ),

                    const SizedBox(height: 16),

                    // Date
                    InfoRow(
                      icon: Icons.calendar_today,
                      label: 'Ngày khởi hành',
                      value: startDate.isNotEmpty
                          ? startDate
                          : 'Đang chờ xác nhận',
                    ),

                    const SizedBox(height: 16),

                    // Guest Count
                    InfoRow(
                      icon: Icons.group,
                      label: 'Số lượng khách',
                      value: _formatGuestCount(),
                    ),

                    const Divider(height: 32),

                    // Total Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Tổng thanh toán',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF131B2E),
                          ),
                        ),
                        Text(
                          _formatPrice(totalPrice),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Pending Status
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.schedule, size: 16, color: Colors.orange),
                          SizedBox(width: 6),
                          Text(
                            'Đang chờ thanh toán',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Actions
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.push(
                    Routes.bookingDetail.replaceFirst(':id', bookingId),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Xem chi tiết đặt tour',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => context.go(Routes.home),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: const Text(
                    'Về trang chủ',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }

  String _formatGuestCount() {
    final parts = <String>[];
    if (adultCount > 0) parts.add('$adultCount Người lớn');
    if (childCount > 0) parts.add('$childCount Trẻ em');
    return parts.isEmpty ? '0 khách' : parts.join(', ');
  }

  String get _shortCode {
    final clean = bookingId.replaceAll('-', '');
    return clean.length >= 8
        ? clean.substring(0, 8).toUpperCase()
        : clean.toUpperCase();
  }
}
