import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class CancelSuccessScreen extends StatelessWidget {
  const CancelSuccessScreen({
    super.key,
    required this.bookingId,
    required this.tourName,
    required this.refundAmount,
    required this.refundPercentage,
  });

  final String bookingId;
  final String tourName;
  final double refundAmount;
  final double refundPercentage;

  String get _shortCode {
    final clean = bookingId.replaceAll('-', '');
    return clean.length >= 8
        ? clean.substring(0, 8).toUpperCase()
        : clean.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFF),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxHeight < 600;
            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(24, 24, 24, isSmall ? 16 : 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - (isSmall ? 16 : 24),
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const Spacer(flex: 1),

                      // Success Icon
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check_circle,
                          size: 48,
                          color: AppColors.primary,
                        ),
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        'Hủy tour thành công!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF131B2E),
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Yêu cầu hủy tour của bạn đã được xác nhận.\nChúng tôi rất tiếc khi không thể đồng hành cùng bạn trong chuyến đi này.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF414755),
                            height: 1.5,
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Refund Info Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 20,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.account_balance_wallet,
                                  color: AppColors.primary,
                                  size: 22,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Thông tin hoàn tiền',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF131B2E),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            _RefundInfoRow(
                              label: 'Số tiền hoàn lại',
                              valueWidget: Text(
                                _formatPrice(refundAmount),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),

                            const Divider(height: 20),

                            _RefundInfoRow(
                              label: 'Thời gian xử lý',
                              valueWidget: const Text(
                                '3-5 ngày làm việc',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF131B2E),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Note Card
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F3FF),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info,
                              size: 18,
                              color: AppColors.primary,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Tiền sẽ được hoàn về đúng phương thức thanh toán bạn đã sử dụng.',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF414755),
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(flex: 2),

                      // Action Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => context.go(Routes.home),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.home, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Về trang chủ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
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
            );
          },
        ),
      ),
    );
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }
}

class _RefundInfoRow extends StatelessWidget {
  const _RefundInfoRow({required this.label, this.value, this.valueWidget});

  final String label;
  final String? value;
  final Widget? valueWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Color(0xFF414755)),
        ),
        Flexible(child: valueWidget ?? Text(value ?? '')),
      ],
    );
  }
}
