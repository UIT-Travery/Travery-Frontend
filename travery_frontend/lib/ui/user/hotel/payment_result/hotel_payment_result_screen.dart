import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/models/hotel/hotel_booking_data.dart';
import 'package:travery_frontend/data/services/hotel/hotel_service.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/utils/core_result.dart';

class HotelPaymentResultScreen extends StatefulWidget {
  const HotelPaymentResultScreen({super.key});

  @override
  State<HotelPaymentResultScreen> createState() =>
      _HotelPaymentResultScreenState();
}

class _HotelPaymentResultScreenState extends State<HotelPaymentResultScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  bool _isSuccess = true;
  String? _bookingId;
  HotelBookingData? _bookingData;

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
      final status = extra?['status'] as String? ?? 'success';
      _bookingId = extra?['bookingId'] as String?;
      setState(() {
        _isSuccess = status == 'success';
      });
      _fetchBookingDetails();
    });
  }

  Future<void> _fetchBookingDetails() async {
    if (_bookingId == null) return;

    try {
      final hotelService = context.read<HotelService>();
      final result = await hotelService.getBookingDetail(_bookingId!);

      if (result is Ok && mounted) {
        final booking = (result as Ok).value;
        setState(() {
          _bookingData = booking;
        });
      }
    } catch (e) {
      debugPrint('Error fetching booking details: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _shortCode(String? id) {
    if (id == null || id.isEmpty) return 'N/A';
    if (id.length <= 8) return id;
    return id.substring(0, 8);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF0F7FF), AppColors.background],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 32),
                          ScaleTransition(
                            scale: _scaleAnimation,
                            child: _buildSuccessBadge(),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            _isSuccess
                                ? 'Đặt phòng thành công!'
                                : 'Thanh toán thất bại',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _isSuccess
                                ? 'Cảm ơn bạn đã tin tưởng Travery. Hành trình của bạn đã sẵn sàng bắt đầu.'
                                : 'Đã xảy ra lỗi trong quá trình thanh toán. Vui lòng thử lại.',
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          _buildBookingCard(),
                        ],
                      ),
                    ),
                  ),
                ),
                _buildBottomButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessBadge() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: (_isSuccess ? AppColors.success : AppColors.error)
                .withValues(alpha: 0.15),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: (_isSuccess ? AppColors.success : AppColors.error)
                    .withValues(alpha: 0.3),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: _isSuccess ? AppColors.success : AppColors.error,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _isSuccess ? Icons.check : Icons.close,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ),
        if (_isSuccess)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.2),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(Icons.star, color: AppColors.warning, size: 16),
            ),
          ),
      ],
    );
  }

  Widget _buildBookingCard() {
    final booking = _bookingData;
    final transactionId =
        booking?.gatewayTransactionId ?? booking?.transactionId;
    final totalPrice = booking?.totalPrice ?? 0.0;
    final hotelName = booking?.hotelName ?? 'N/A';
    final hotelAddress = booking?.hotelAddress ?? '';
    final firstItem = booking?.items?.isNotEmpty == true
        ? booking!.items!.first
        : null;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hotel info
          if (_bookingData != null) ...[
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.hotel,
                    color: AppColors.primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotelName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      if (hotelAddress.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          hotelAddress,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: AppColors.inputBackground),
            const SizedBox(height: 16),
          ],

          // Room type
          if (firstItem != null) ...[
            _buildRow('Loại phòng', firstItem.roomTypeName),
            const SizedBox(height: 12),
            _buildRow('Số phòng', '${firstItem.quantity} phòng'),
            const SizedBox(height: 12),
            _buildRow('Giá phòng', _formatPrice(firstItem.priceAtNight)),
            const SizedBox(height: 12),
          ],

          // Check-in / Check-out
          if (booking?.startDate != null && booking?.endDate != null) ...[
            _buildRow('Nhận phòng', _formatDate(booking!.startDate!)),
            const SizedBox(height: 12),
            _buildRow('Trả phòng', _formatDate(booking.endDate!)),
            const SizedBox(height: 12),
          ],

          const Divider(color: AppColors.inputBackground),
          const SizedBox(height: 12),

          // Transaction ID
          _buildRow('Mã giao dịch', _shortCode(transactionId), isPrimary: true),
          const SizedBox(height: 12),

          // Total price
          _buildRow('Tổng thanh toán', _formatPrice(totalPrice), isBold: true),

          if (_bookingData == null) ...[
            const SizedBox(height: 16),
            const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      final months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      return '${date.day} ${months[date.month - 1]}, ${date.year}';
    } catch (e) {
      return dateStr;
    }
  }

  Widget _buildRow(
    String label,
    String value, {
    bool isPrimary = false,
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: AppTextTheme.bodyMedium,
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold
                ? AppTextTheme.headlineSmall
                : AppTextTheme.bodyMedium,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            color: isPrimary ? AppColors.primary : AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomButton() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        24,
        12,
        24,
        MediaQuery.of(context).padding.bottom + 12,
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).go(Routes.home);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _isSuccess ? AppColors.primary : AppColors.error,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Về trang chủ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
