import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/trip/payment/view_models/trip_payment_view_model.dart';
import 'package:travery_frontend/ui/user/trip/booking_detail/view_models/trip_booking_detail_view_model.dart';
import 'package:travery_frontend/data/models/trip/trip_booking_data.dart';

class TripBookingDetailScreen extends StatefulWidget {
  const TripBookingDetailScreen({super.key, this.bookingId = ''});

  final String bookingId;

  @override
  State<TripBookingDetailScreen> createState() =>
      _TripBookingDetailScreenState();
}

class _TripBookingDetailScreenState extends State<TripBookingDetailScreen> {
  String? _lastLoadedBookingId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadBookingFromRoute();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadBookingFromRoute();
    });
  }

  void _loadBookingFromRoute() {
    if (!mounted) return;
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final booking = extra?['booking'] as TripBookingData?;
    if (booking != null && booking.id != _lastLoadedBookingId) {
      _lastLoadedBookingId = booking.id;
      context.read<TripBookingDetailViewModel>().loadBooking(booking.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
          _lastLoadedBookingId = null;
          final vm = context.read<TripBookingDetailViewModel>();
          final booking = vm.bookingData;
          if (booking != null) vm.loadBooking(booking.id);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F4F6),
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pushReplacement(Routes.tripMyBookings),
          ),
          title: const Text(
            'Chi tiết đặt vé',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        body: Consumer<TripBookingDetailViewModel>(
          builder: (context, vm, _) {
            if (vm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (vm.error != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 48,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 12),
                    Text(vm.error ?? 'Loi'),
                    ElevatedButton(
                      onPressed: () {
                        final booking = vm.bookingData;
                        if (booking != null) vm.loadBooking(booking.id);
                      },
                      child: const Text('Thử lại'),
                    ),
                  ],
                ),
              );
            }
            final booking = vm.bookingData;
            if (booking == null) {
              return const Center(
                child: Text('Không tìm thấy thông tin đặt xe'),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 120),
                    children: [
                      _buildStatusCard(booking),
                      const SizedBox(height: 2),
                      _buildTripInfo(booking),
                      const SizedBox(height: 2),
                      _buildCustomerInfoReadOnly(booking),
                      const SizedBox(height: 2),
                      _buildPaymentDetails(booking),
                    ],
                  ),
                ),
                _buildBottomBar(context, booking, vm),
              ],
            );
          },
        ),
      ),
    );
  }

  // ─── STATUS CARD ───────────────────────────────────────────────────
  Widget _buildStatusCard(TripBookingData booking) {
    final isPaid = booking.status == 'PAID';
    final isCancelled = booking.status == 'CANCELLED';
    final isCheckedIn = booking.status == 'CHECKED_IN';

    Color statusColor;
    IconData statusIcon;
    String statusLabel;
    String statusDesc;

    if (isPaid) {
      statusColor = const Color(0xFF10B981);
      statusIcon = Icons.check_circle;
      statusLabel = 'Đã thanh toán';
      statusDesc =
          'Xe của bạn đã được xác nhận. Vui lòng có mặt tại bên trước giờ khởi hành 15 phút.';
    } else if (isCancelled) {
      statusColor = Colors.red;
      statusIcon = Icons.cancel;
      statusLabel = 'Đã hủy';
      statusDesc = 'Xe đã bị hủy. Nếu cần hoàn tiền, vui lòng liên hệ hỗ trợ.';
    } else if (isCheckedIn) {
      statusColor = AppColors.primary;
      statusIcon = Icons.person;
      statusLabel = 'Đã check-in';
      statusDesc = 'Bạn đã check-in thành công. Chúc bạn có chuyến đi vui vẻ!';
    } else {
      statusColor = Colors.orange;
      statusIcon = Icons.hourglass_empty;
      statusLabel = 'Chờ thanh toán';
      statusDesc = booking.paymentDeadline != null
          ? 'Hạn thanh toán: ${_formatDateTime(booking.paymentDeadline!)}'
          : 'Vui lòng thanh toán để xác nhận xe.';
    }

    return Container(
      color: Colors.white,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: statusColor.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: statusColor.withValues(alpha: 0.25)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(statusIcon, color: statusColor, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    statusLabel,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: statusColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    statusDesc,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF414755),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── THONG TIN CHUYEN DI ───────────────────────────────────────────────
  Widget _buildTripInfo(TripBookingData booking) {
    final departureDt = booking.departureTime;
    final seatCount = booking.bookedSeatNames.length;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'THÔNG TIN CHUYẾN ĐI',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Color(0xFF6B7280),
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Chuyến xe',
                style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
              ),
              Text(
                '${booking.originDestination} → ${booking.destinationDestination}',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF111827),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Giờ khởi hành',
                style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
              ),
              Text(
                '${_formatTime(departureDt)} ${_formatDate(departureDt)}',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Số lượng vé',
                style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
              ),
              Text(
                '$seatCount vé',
                style: const TextStyle(fontSize: 13, color: Color(0xFF111827)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Vị trí ghế',
                style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
              ),
              Text(
                booking.bookedSeatNames.join(', '),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          if (booking.coachLicensePlate != null) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Biển số xe',
                  style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
                ),
                Text(
                  booking.coachLicensePlate!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF111827),
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 24),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 24,
                  child: CustomPaint(
                    size: const Size(24, double.infinity),
                    painter: _DashedLinePainter(
                      color: AppColors.primary,
                      strokeWidth: 1.5,
                      dashHeight: 4,
                      dashSpace: 3,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStationNode(
                        icon: Icons.trip_origin,
                        iconColor: AppColors.success,
                        title: 'Lên xe: ',
                        stationName: booking.originDestination,
                        address: '',
                        timeLabel: 'Giờ có mặt tại bên',
                        timeValue:
                            '${_formatTime(departureDt.subtract(const Duration(minutes: 15)))} ${_formatDate(departureDt)}',
                        isBoarding: true,
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEF2F2),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFFECACA)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.info_outline,
                              size: 14,
                              color: Color(0xFFDC2626),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Quý khách vui lòng có mặt tại ${booking.originDestination} trước ${_formatTime(departureDt.subtract(const Duration(minutes: 15)))} ${_formatDate(departureDt)} để làm thủ tục lên xe!',
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFFDC2626),
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildStationNode(
                        icon: Icons.location_on,
                        iconColor: AppColors.error,
                        title: 'Xuống xe: ',
                        stationName: booking.destinationDestination,
                        address: '',
                        timeLabel: null,
                        timeValue: null,
                        isBoarding: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStationNode({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String stationName,
    required String address,
    required String? timeLabel,
    required String? timeValue,
    required bool isBoarding,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: iconColor, width: 2),
                color: Colors.white,
              ),
              child: Icon(icon, size: 12, color: iconColor),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 13),
                      children: [
                        TextSpan(
                          text: title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF111827),
                          ),
                        ),
                        TextSpan(
                          text: stationName,
                          style: const TextStyle(color: Color(0xFF111827)),
                        ),
                      ],
                    ),
                  ),
                  if (address.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        address,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF6B7280),
                          height: 1.4,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.copy_outlined,
                size: 16,
                color: Color(0xFF6B7280),
              ),
            ),
          ],
        ),
        if (isBoarding && timeLabel != null && timeValue != null)
          Padding(
            padding: const EdgeInsets.only(left: 34, top: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  timeLabel,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF6B7280),
                  ),
                ),
                Text(
                  timeValue,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  // ─── THONG TIN KHACH HANG (READ-ONLY) ───────────────────────────────
  Widget _buildCustomerInfoReadOnly(TripBookingData booking) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Thông tin khách hàng',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF111827),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: const Icon(
                  Icons.lock_outline,
                  size: 12,
                  color: Color(0xFF9CA3AF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _buildReadOnlyField(
            label: 'Họ và tên',
            value: booking.contactName,
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 12),
          _buildReadOnlyField(
            label: 'Số điện thoại',
            value: booking.contactPhone,
            icon: Icons.phone_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildReadOnlyField({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Color(0xFF374151),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFE),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Row(
            children: [
              Icon(icon, size: 18, color: const Color(0xFF9CA3AF)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF111827),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ─── CHI TIET THANH TOAN ───────────────────────────────────────────
  Widget _buildPaymentDetails(TripBookingData booking) {
    final seatCount = booking.bookedSeatNames.length;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Chi tiết thanh toán',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Mã giao dịch',
                      style: TextStyle(fontSize: 13, color: Color(0xFF4B5563)),
                    ),
                    Text(
                      '#${_shortCode(booking.gatewayTransactionId ?? booking.transactionId ?? booking.id)}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF111827),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Giá vé',
                      style: TextStyle(fontSize: 13, color: Color(0xFF4B5563)),
                    ),
                    Text(
                      '${_formatPrice(booking.basePrice)} x$seatCount',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF111827),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(height: 1, color: const Color(0xFFE5E7EB)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tổng cộng',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    ),
                    Text(
                      _formatPrice(booking.totalPrice),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── BOTTOM BAR ────────────────────────────────────────────────────
  Widget _buildBottomBar(
    BuildContext context,
    TripBookingData booking,
    TripBookingDetailViewModel vm,
  ) {
    final isPending = booking.status == 'PENDING';
    final isPaid = booking.status == 'PAID';
    if (!isPending && !isPaid) return const SizedBox.shrink();

    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        12,
        16,
        MediaQuery.of(context).padding.bottom + 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: isPending
            ? ElevatedButton(
                onPressed: () => _onPayPressed(context, booking, vm),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Thanh toán ngay',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 20),
                  ],
                ),
              )
            : Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => context.push(
                        Routes.tripCancelConfirmation,
                        extra: {'booking': booking},
                      ),
                      icon: const Icon(Icons.cancel_outlined, size: 18),
                      label: const Text('Hủy vé'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: BorderSide(color: Colors.red.shade300),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.phone, size: 18),
                      label: const Text('Liên hệ'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> _onPayPressed(
    BuildContext context,
    TripBookingData booking,
    TripBookingDetailViewModel vm,
  ) async {
    final payVm = context.read<TripPaymentViewModel>();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Đang tạo thanh toán...'),
              ],
            ),
          ),
        ),
      ),
    );
    final paymentData = await payVm.createPayment(booking.id);
    if (!context.mounted) return;
    Navigator.pop(context);
    if (paymentData != null && paymentData.paymentUrl.isNotEmpty) {
      context.push(
        Routes.tripPayment,
        extra: {
          'bookingId': booking.id,
          'paymentUrl': paymentData.paymentUrl,
          'transactionId': paymentData.transactionId,
          'amount': paymentData.amount,
          'tripName':
              '${booking.originDestination} → ${booking.destinationDestination}',
          'expiresAt': paymentData.expiresAt?.toIso8601String(),
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi: ${payVm.error ?? 'Không thể tạo thanh toán'}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // ─── HELPERS ───────────────────────────────────────────────────────
  String _shortCode(String id) {
    final clean = id.replaceAll('-', '');
    return clean.length >= 8
        ? clean.substring(0, 8).toUpperCase()
        : clean.toUpperCase();
  }

  String _formatDate(DateTime dt) =>
      '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';
  String _formatTime(DateTime dt) =>
      '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  String _formatDateTime(DateTime dt) =>
      '${_formatDate(dt)} ${_formatTime(dt)}';

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}d';
  }
}

// ─── Dashed line painter ────────────────────────────────────────────────────
class _DashedLinePainter extends CustomPainter {
  _DashedLinePainter({
    required this.color,
    required this.strokeWidth,
    required this.dashHeight,
    required this.dashSpace,
  });
  final Color color;
  final double strokeWidth;
  final double dashHeight;
  final double dashSpace;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    double startY = dashHeight / 2;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, (startY + dashHeight).clamp(0, size.height)),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
