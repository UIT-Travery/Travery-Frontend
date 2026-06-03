import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';

class HotelPaymentResultScreen extends StatefulWidget {
  const HotelPaymentResultScreen({super.key});

  @override
  State<HotelPaymentResultScreen> createState() =>
      _HotelPaymentResultScreenState();
}

class _HotelPaymentResultScreenState extends State<HotelPaymentResultScreen> {
  bool _isSuccess = true;

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
      final status = extra?['status'] as String? ?? 'success';
      setState(() => _isSuccess = status == 'success');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F5FF),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSuccessBadge(),
                      const SizedBox(height: 32),
                      Text(
                        _isSuccess
                            ? 'Đặt phòng thành công!'
                            : 'Thanh toán thất bại',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _isSuccess
                            ? 'Cảm ơn bạn đã tin tưởng Travery. Hành trình của bạn đã sẵn sàng bắt đầu.'
                            : 'Đã xảy ra lỗi trong quá trình thanh toán. Vui lòng thử lại.',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      _buildBookingCard(),
                    ],
                  ),
                ),
              ),
            ),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessBadge() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            color: const Color(0xFF00B289),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00B289).withValues(alpha: 0.3),
                blurRadius: 20,
                spreadRadius: 4,
              ),
            ],
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 48),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFC2D7FF),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Icon(Icons.star, color: Color(0xFF0066FF), size: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildBookingCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            spreadRadius: -4,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildRow('Mã đặt phòng', 'TRV-8829-4410', isBlue: true),
          const SizedBox(height: 12),
          _buildRow('Mã phòng', '101'),
          const SizedBox(height: 12),
          _buildRow('Loại phòng', 'VIP'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: DashedDivider(),
          ),
          _buildRow('Tổng thanh toán', _formatPrice(2450000), isBold: true),
        ],
      ),
    );
  }

  Widget _buildRow(
    String label,
    String value, {
    bool isBlue = false,
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 18 : 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            color: isBlue ? const Color(0xFF0066FF) : const Color(0xFF1F2937),
          ),
        ),
      ],
    );
  }

  Widget _buildButtons() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.go(Routes.hotelMyBookings);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0066FF),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Xem booking',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                context.go(Routes.hotelHome);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF0066FF),
                side: const BorderSide(color: Color(0xFF0066FF)),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Về trang chủ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashedDivider extends StatelessWidget {
  const DashedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dashWidth = 5.0;
        final dashSpace = 3.0;
        final count = (constraints.maxWidth / (dashWidth + dashSpace)).floor();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(count, (_) {
            return Container(
              width: dashWidth,
              height: 1,
              color: const Color(0xFFE5E7EB),
            );
          }),
        );
      },
    );
  }
}
