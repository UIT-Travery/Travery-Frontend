import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/trip/booking_detail/view_models/trip_booking_detail_view_model.dart';
import 'package:travery_frontend/data/models/trip/trip_booking_data.dart';
import 'package:travery_frontend/ui/user/widgets/user_app_bar.dart';

class TripCancelScreen extends StatefulWidget {
  const TripCancelScreen({super.key, this.bookingId = '', this.booking});

  final String bookingId;
  final TripBookingData? booking;

  @override
  State<TripCancelScreen> createState() => _TripCancelScreenState();
}

class _TripCancelScreenState extends State<TripCancelScreen> {
  final _reasonController = TextEditingController();
  final _bankNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _accountHolderController = TextEditingController();
  bool _confirmed = false;
  bool _isCancelling = false;
  String? _bankNameError;
  String? _accountNumberError;
  String? _accountHolderError;

  @override
  void dispose() {
    _reasonController.dispose();
    _bankNameController.dispose();
    _accountNumberController.dispose();
    _accountHolderController.dispose();
    super.dispose();
  }

  bool _isValidBankName(String value) {
    return RegExp(r"^[\p{L}\s0-9&.-]+$", unicode: true).hasMatch(value);
  }

  bool _isValidAccountNumber(String value) {
    return RegExp(r'^[0-9]+$').hasMatch(value);
  }

  bool _isValidHolderName(String value) {
    return RegExp(r"^[\p{L}\s]+$", unicode: true).hasMatch(value);
  }

  void _validateBankFields() {
    final bankName = _bankNameController.text.trim();
    final accountNumber = _accountNumberController.text.trim();
    final holderName = _accountHolderController.text.trim();

    final newBankNameError = bankName.isNotEmpty && !_isValidBankName(bankName)
        ? 'Tên ngân hàng không hợp lệ'
        : null;
    final newAccountNumberError = accountNumber.isNotEmpty
        ? (!_isValidAccountNumber(accountNumber)
              ? 'Số tài khoản chỉ chứa chữ số'
              : (accountNumber.length < 6
                    ? 'Số tài khoản phải có ít nhất 6 chữ số'
                    : null))
        : null;
    final newHolderError =
        holderName.isNotEmpty && !_isValidHolderName(holderName)
        ? 'Tên chủ tài khoản không hợp lệ'
        : null;

    if (_bankNameError != newBankNameError ||
        _accountNumberError != newAccountNumberError ||
        _accountHolderError != newHolderError) {
      setState(() {
        _bankNameError = newBankNameError;
        _accountNumberError = newAccountNumberError;
        _accountHolderError = newHolderError;
      });
    }
  }

  void _onBankFieldChanged() {
    _validateBankFields();
  }

  @override
  Widget build(BuildContext context) {
    final booking = widget.booking;
    if (booking == null) {
      return Scaffold(
        backgroundColor: const Color(0xFFF3F4F6),
        appBar: const UserAppBar(title: 'Hủy đặt vé'),
        body: const Center(child: Text('Không tìm thấy thông tin đặt vé')),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: const UserAppBar(title: 'Hủy đặt vé'),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 120),
              children: [
                _buildWarningCard(booking),
                const SizedBox(height: 2),
                _buildTripInfo(booking),
                const SizedBox(height: 2),
                _buildCustomerInfoReadOnly(booking),
                const SizedBox(height: 2),
                _buildPaymentDetails(booking),
                const SizedBox(height: 2),
                _buildReasonSection(),
              ],
            ),
          ),
          _buildBottomBar(booking),
        ],
      ),
    );
  }

  Widget _buildWarningCard(TripBookingData booking) {
    final isPaid = booking.status == 'PAID';
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: Colors.white),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFFEF2F2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFFECACA)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.warning_amber,
                color: Colors.red,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bạn có chắc chắn muốn hủy đặt vé này?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFDC2626),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isPaid
                        ? 'Bạn đã thanh toán. Phi hủy và hoàn tiền sẽ được áp dụng theo chính sách của nhà xe.'
                        : 'Việc hủy có thể chịu phí theo chính sách hiện tại.',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF991B1B),
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
          const SizedBox(height: 24),

          // Timeline — Boarding / Alighting
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left column: icons stacked with vertical line between them
                SizedBox(
                  width: 24,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      // Dashed vertical line (full height of the two nodes)
                      Positioned.fill(
                        child: CustomPaint(
                          painter: _DashedLinePainter(
                            color: AppColors.primary,
                            strokeWidth: 1.5,
                            dashHeight: 4,
                            dashSpace: 3,
                          ),
                        ),
                      ),
                      // First icon (Lên xe)
                      Positioned(
                        top: 0,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.success,
                              width: 2,
                            ),
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.trip_origin,
                            size: 12,
                            color: AppColors.success,
                          ),
                        ),
                      ),
                      // Second icon (Xuống xe)
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.error,
                              width: 2,
                            ),
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.location_on,
                            size: 12,
                            color: AppColors.error,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // Right column: text content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStationNode(
                        icon: null,
                        iconColor: AppColors.success,
                        title: 'Lên xe: ',
                        stationName: booking.originDestination,
                        address: '',
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
                        icon: null,
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
    required IconData? icon,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon is now rendered in the Stack, so no icon here
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
          ],
        ),
        if (isBoarding && timeLabel != null && timeValue != null)
          Padding(
            padding: const EdgeInsets.only(top: 6),
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

  Widget _buildPaymentDetails(TripBookingData booking) {
    final seatCount = booking.bookedSeatNames.length;
    final basePrice = booking.basePrice;

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

  Widget _buildReasonSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Lý do hủy (tùy chọn)',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _reasonController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'VD: Thay đổi kế hoạch, không thể sắp xếp thời gian...',
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
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F3FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.account_balance,
                      size: 18,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Thông tin hoàn tiền',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF131B2E),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Nhập thông tin tài khoản để nhận hoàn tiền',
                  style: TextStyle(fontSize: 12, color: Color(0xFF414755)),
                ),
                const SizedBox(height: 16),
                _TripCancelScreenBuildField(
                  controller: _bankNameController,
                  label: 'Tên ngân hàng',
                  hint: 'VD: Vietcombank',
                  keyboardType: TextInputType.text,
                  errorText: _bankNameError,
                  onChanged: (_) => _onBankFieldChanged(),
                ),
                const SizedBox(height: 12),
                _TripCancelScreenBuildField(
                  controller: _accountNumberController,
                  label: 'Số tài khoản',
                  hint: 'Nhập số tài khoản',
                  keyboardType: TextInputType.number,
                  errorText: _accountNumberError,
                  onChanged: (_) => _onBankFieldChanged(),
                ),
                const SizedBox(height: 12),
                _TripCancelScreenBuildField(
                  controller: _accountHolderController,
                  label: 'Tên chủ tài khoản',
                  hint: 'Nhập tên chủ tài khoản',
                  keyboardType: TextInputType.text,
                  errorText: _accountHolderError,
                  onChanged: (_) => _onBankFieldChanged(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => setState(() => _confirmed = !_confirmed),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: _confirmed,
                  onChanged: (v) => setState(() => _confirmed = v ?? false),
                  activeColor: Colors.red,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Text(
                      widget.booking?.status == 'PAID'
                          ? 'Tôi hiểu rằng phí hủy sẽ được khấu trừ và số tiền hoàn (nếu có) sẽ được xử lý trong 7-14 ngày làm việc.'
                          : 'Tôi hiểu rằng việc hủy vé sẽ không được hoàn tiền theo chính sách hiện tại.',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF414755),
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(TripBookingData booking) {
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
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: !_confirmed || _isCancelling ? null : () => _onCancel(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC2626),
              foregroundColor: Colors.white,
              disabledBackgroundColor: Colors.red.shade100,
              disabledForegroundColor: Colors.red.shade300,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              elevation: 0,
            ),
            child: _isCancelling
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.warning_amber_rounded, size: 18),
                      const SizedBox(width: 8),
                      const Text(
                        'Xác nhận hủy vé',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Future<void> _onCancel() async {
    final booking = widget.booking;
    if (booking == null) return;

    final bankName = _bankNameController.text.trim();
    final accountNumber = _accountNumberController.text.trim();
    final accountHolder = _accountHolderController.text.trim();

    if (booking.status == 'PAID') {
      if (bankName.isEmpty || accountNumber.isEmpty || accountHolder.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.white,
                  size: 14,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Vui lòng nhập đầy đủ thông tin tài khoản ngân hàng để nhận hoàn tiền',
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.all(10),
          ),
        );
        return;
      }

      _validateBankFields();
      if (_bankNameError != null ||
          _accountNumberError != null ||
          _accountHolderError != null) {
        return;
      }
    }

    setState(() => _isCancelling = true);
    final vm = context.read<TripBookingDetailViewModel>();
    final reason = _reasonController.text.trim();
    final success = await vm.cancelBooking(
      booking.id,
      reason: reason.isEmpty ? null : reason,
      bankName: bankName.isEmpty ? null : bankName,
      accountNumber: accountNumber.isEmpty ? null : accountNumber,
      accountHolderName: accountHolder.isEmpty ? null : accountHolder,
    );
    if (!mounted) return;
    setState(() => _isCancelling = false);

    if (success) {
      context.pushReplacement(
        Routes.tripCancelSuccess,
        extra: {'cancelData': vm.cancelData, 'booking': widget.booking},
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.white, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  vm.error ?? 'Không thể hủy đặt vé',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xFFDC2626),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(16),
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }

  String _formatTime(DateTime dt) {
    return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  String _formatDate(DateTime dt) {
    return '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}';
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}d';
  }
}

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

class _TripCancelScreenBuildField extends StatelessWidget {
  const _TripCancelScreenBuildField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.keyboardType,
    this.errorText,
    this.onChanged,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null && errorText!.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: hasError ? Colors.red : const Color(0xFF414755),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: hasError ? Colors.red : const Color(0xFFE5E7EB),
            ),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Color(0xFF9CA3AF),
                fontSize: 13,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
            ),
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: const TextStyle(fontSize: 11, color: Colors.red),
          ),
        ],
      ],
    );
  }
}
