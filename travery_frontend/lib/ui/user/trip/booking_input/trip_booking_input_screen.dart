import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/trip/booking_input/view_models/trip_booking_input_view_model.dart';
import 'package:travery_frontend/data/models/trip/trip_search_item.dart';
import 'package:travery_frontend/data/models/trip/trip_seat_data.dart';
import 'package:travery_frontend/data/models/trip/destination_data.dart';

class TripBookingInputScreen extends StatefulWidget {
  const TripBookingInputScreen({super.key});

  @override
  State<TripBookingInputScreen> createState() => _TripBookingInputScreenState();
}

class _TripBookingInputScreenState extends State<TripBookingInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadExtraData());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadExtraData();
  }

  void _loadExtraData() {
    if (!mounted) return;
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    if (extra != null) {
      final trip = extra['trip'] as TripSearchItem;
      final seats = extra['seats'] as List<SeatItem>;
      final originStation = extra['originStation'] as StationData?;
      final destinationStation = extra['destinationStation'] as StationData?;
      final vm = context.read<TripBookingInputViewModel>();
      vm.setTripAndSeats(
        trip: trip,
        seats: seats,
        originStation: originStation,
        destinationStation: destinationStation,
      );
      if (seats.isNotEmpty) {
        _nameController.clear();
        _phoneController.clear();
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
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
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer<TripBookingInputViewModel>(
        builder: (context, vm, _) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 120),
                    children: [
                      _buildTripInfo(vm),
                      const SizedBox(height: 2),
                      _buildCustomerInfo(vm),
                      const SizedBox(height: 2),
                      _buildPaymentDetails(vm),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Consumer<TripBookingInputViewModel>(
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
                onPressed: () => _onSubmit(context, vm),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tiếp tục',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward, size: 20),
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
  Widget _buildTripInfo(TripBookingInputViewModel vm) {
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
          // Section label
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

          // Route summary row
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

          // Timeline — Boarding / Alighting
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dashed vertical line
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
                      // Boarding point
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

                      // Warning
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

                      // Alighting point
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

  // ─── THÔNG TIN KHÁCH HÀNG ───────────────────────────────────────────
  Widget _buildCustomerInfo(TripBookingInputViewModel vm) {
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
          const Text(
            'Thông tin khách hàng',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 14),
          _buildTextField(
            controller: _nameController,
            label: 'Họ và tên',
            hint: 'Nhập họ và tên',
            onChanged: vm.setContactName,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Vui lòng nhập họ tên';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          _buildTextField(
            controller: _phoneController,
            label: 'Số điện thoại',
            hint: 'Nhập số điện thoại',
            onChanged: vm.setContactPhone,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Vui lòng nhập số điện thoại';
              }
              if (value.trim().length < 10) {
                return 'Số điện thoại không hợp lệ';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  // ─── CHI TIẾT THANH TOÁN ───────────────────────────────────────────
  Widget _buildPaymentDetails(TripBookingInputViewModel vm) {
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required ValueChanged<String> onChanged,
    String? Function(String?)? validator,
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
        TextFormField(
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
            filled: true,
            fillColor: const Color(0xFFF9FAFE),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFDC2626)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _onSubmit(
    BuildContext context,
    TripBookingInputViewModel vm,
  ) async {
    if (!_formKey.currentState!.validate()) return;

    final trip = vm.trip;
    final seats = vm.selectedSeats;
    if (trip == null || seats.isEmpty) return;

    context.push(
      Routes.tripBookingReview,
      extra: {
        'trip': trip,
        'seats': seats,
        'contactName': vm.contactName,
        'contactPhone': vm.contactPhone,
        'originStation': vm.originStation,
        'destinationStation': vm.destinationStation,
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
