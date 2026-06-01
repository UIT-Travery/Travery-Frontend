import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/trip/booking_review/view_models/trip_booking_review_view_model.dart';
import 'package:travery_frontend/data/models/trip/trip_search_item.dart';
import 'package:travery_frontend/data/models/trip/trip_seat_data.dart';
import 'package:travery_frontend/data/models/trip/destination_data.dart';

class TripBookingReviewScreen extends StatefulWidget {
  const TripBookingReviewScreen({super.key});

  @override
  State<TripBookingReviewScreen> createState() =>
      _TripBookingReviewScreenState();
}

class _TripBookingReviewScreenState extends State<TripBookingReviewScreen> {
  String? _lastLoadedExtraKey;

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
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    if (extra == null) return;

    final trip = extra['trip'] as TripSearchItem?;
    final seats = extra['seats'] as List<SeatItem>?;
    if (trip == null || seats == null) return;

    final key = '${trip.id}_${seats.map((s) => s.seatLayoutItemId).join(',')}';
    if (key == _lastLoadedExtraKey) return;
    _lastLoadedExtraKey = key;

    final vm = context.read<TripBookingReviewViewModel>();
    vm.setBookingData(
      trip: trip,
      seats: seats,
      contactName: extra['contactName'] as String? ?? '',
      contactPhone: extra['contactPhone'] as String? ?? '',
      originStation: extra['originStation'] as StationData?,
      destinationStation: extra['destinationStation'] as StationData?,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Xác nhận thông tin',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Consumer<TripBookingReviewViewModel>(
        builder: (context, vm, _) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 120),
                  children: [
                    _buildTripInfo(vm),
                    const SizedBox(height: 2),
                    _buildCustomerInfoReadOnly(vm),
                    const SizedBox(height: 2),
                    _buildPaymentDetails(vm),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Consumer<TripBookingReviewViewModel>(
        builder: (context, vm, _) {
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
              child: ElevatedButton(
                onPressed: vm.isLoading ? null : () => _onSubmit(context, vm),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF10B981),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                ),
                child: vm.isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Xác nhận đặt vé',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, size: 20),
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ─── THÔNG TIN CHUYẾN ĐI ───────────────────────────────────────────────
  Widget _buildTripInfo(TripBookingReviewViewModel vm) {
    final trip = vm.trip;
    if (trip == null) return const SizedBox.shrink();

    final departureDt = trip.departureTime;
    final seatCount = vm.selectedSeats.length;
    final originName = vm.originStation?.name ?? trip.originDestination.name;
    final destinationName =
        vm.destinationStation?.name ?? trip.destinationDestination.name;
    final originAddress =
        vm.originStation?.address ??
        (trip.originDestination.stations.isNotEmpty
            ? trip.originDestination.stations.first.address
            : '');
    final destinationAddress =
        vm.destinationStation?.address ??
        (trip.destinationDestination.stations.isNotEmpty
            ? trip.destinationDestination.stations.first.address
            : '');

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
                '$originName → $destinationName',
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
                vm.selectedSeats.map((s) => s.seatName).join(', '),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
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
                        stationName: originName,
                        address: originAddress,
                        timeLabel: 'Giờ có mặt tại bến',
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
                                'Quý khách vui lòng có mặt tại $originName trước ${_formatTime(departureDt.subtract(const Duration(minutes: 15)))} ${_formatDate(departureDt)} để làm thủ tục lên xe!',
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
                        stationName: destinationName,
                        address: destinationAddress,
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

  // ─── THÔNG TIN KHÁCH HÀNG (READ-ONLY) ───────────────────────────────
  Widget _buildCustomerInfoReadOnly(TripBookingReviewViewModel vm) {
    return Container(
      width: double.infinity,
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
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.lock_outline,
                      size: 12,
                      color: Color(0xFF9CA3AF),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _buildReadOnlyField(
            label: 'Họ và tên',
            value: vm.contactName,
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 12),
          _buildReadOnlyField(
            label: 'Số điện thoại',
            value: vm.contactPhone,
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

  // ─── CHI TIẾT THANH TOÁN ───────────────────────────────────────────
  Widget _buildPaymentDetails(TripBookingReviewViewModel vm) {
    final trip = vm.trip;
    if (trip == null) return const SizedBox.shrink();

    final seatCount = vm.selectedSeats.length;
    final basePrice = trip.basePrice;

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
                    Text(
                      'Giá vé',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF4B5563),
                      ),
                    ),
                    Text(
                      '${_formatPrice(basePrice)} x$seatCount',
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
                      _formatPrice(vm.totalPrice),
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

  Future<void> _onSubmit(
    BuildContext context,
    TripBookingReviewViewModel vm,
  ) async {
    final booking = await vm.createBooking();
    if (!mounted) return;

    if (booking == null) {
      if (vm.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(vm.error!), backgroundColor: Colors.red),
        );
      }
      return;
    }

    final paymentData = await vm.createPayment();
    if (!mounted) return;

    if (paymentData == null) {
      if (vm.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(vm.error!), backgroundColor: Colors.red),
        );
      }
      return;
    }

    context.push(
      Routes.tripPayment,
      extra: {
        'bookingId': booking.id,
        'paymentUrl': paymentData.paymentUrl,
        'transactionId': paymentData.transactionId,
        'amount': paymentData.amount,
        'tripName':
            '${vm.trip?.originDestination.name ?? ''} → ${vm.trip?.destinationDestination.name ?? ''}',
        'expiresAt': paymentData.expiresAt?.toIso8601String(),
      },
    );
  }

  String _formatTime(DateTime dt) {
    return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  String _formatDate(DateTime dt) {
    return '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
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
