import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/services/payment_session_storage.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/widgets/user_app_bar.dart';
import '../../../../routing/routes.dart';
import 'view_models/booking_review_view_model.dart';

class BookingReviewScreen extends StatefulWidget {
  const BookingReviewScreen({
    super.key,
    required this.viewModel,
    required this.tourId,
    required this.instanceId,
    required this.tourName,
    this.destinationName,
    // this.startLocation,
    required this.tourImageUrl,
    required this.members,
    required this.adultCount,
    required this.childCount,
    required this.pricePerAdult,
    required this.pricePerChild,
    required this.specialRequests,
    required this.startDate,
    required this.endDate,
  });

  final BookingReviewViewModel viewModel;
  final String tourId;
  final String instanceId;
  final String tourName;
  final String? destinationName;
  // final String? startLocation;
  final String? tourImageUrl;
  final List<Map<String, dynamic>> members;
  final int adultCount;
  final int childCount;
  final double pricePerAdult;
  final double pricePerChild;
  final String specialRequests;
  final String startDate;
  final String endDate;

  @override
  State<BookingReviewScreen> createState() => _BookingReviewScreenState();
}

class _BookingReviewScreenState extends State<BookingReviewScreen> {
  bool _termsAccepted = false;

  double get _totalPrice =>
      (widget.adultCount * widget.pricePerAdult) +
      (widget.childCount * widget.pricePerChild);

  @override
  Widget build(BuildContext context) {
    final vm = widget.viewModel;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: UserAppBar(
        title: 'Xác nhận thông tin',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF131B2E)),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Contact Info ──
          _buildContactSection(vm),

          // ── Section 1: Tour Info & Members ──
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.tourName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Be Vietnam Pro',
                    color: Color(0xFF1E293B),
                    height: 1.3,
                  ),
                ),
                if (widget.destinationName != null &&
                    widget.destinationName!.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  _buildInfoRow(
                    icon: Icons.location_on_outlined,
                    label: 'Điểm đến',
                    text: widget.destinationName!,
                  ),
                ],
                // if (widget.startLocation != null &&
                //     widget.startLocation!.isNotEmpty) ...[
                //   const SizedBox(height: 6),
                //   _buildInfoRow(
                //     icon: Icons.flight_takeoff_outlined,
                //     label: 'Điểm xuất phát',
                //     text: widget.startLocation!,
                //   ),
                // ],
                const SizedBox(height: 16),
                if (widget.startDate.isNotEmpty) ...[
                  _buildInfoRow(
                    icon: Icons.calendar_today_outlined,
                    text: '${widget.startDate} - ${widget.endDate}',
                  ),
                  const SizedBox(height: 12),
                ],
                if (widget.tourImageUrl != null) ...[
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      widget.tourImageUrl!,
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                Container(height: 1, color: const Color(0xFFE2E8F0)),
                const SizedBox(height: 16),
                const Text(
                  'DANH SÁCH KHÁCH',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Be Vietnam Pro',
                    color: Color(0xFF64748B),
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 16),
                ...widget.members.map((m) {
                  final isAdult = m['memberType'] == 'ADULT';
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            isAdult ? Icons.person : Icons.child_care,
                            size: 20,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                m['fullName'] ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'CCCD: ${m['identityNumber'] ?? ''}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF64748B),
                                ),
                              ),
                              if (m['dateOfBirth'] != null &&
                                  (m['dateOfBirth'] as String).isNotEmpty) ...[
                                const SizedBox(height: 2),
                                Text(
                                  'Ngày sinh: ${m['dateOfBirth']}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ── Section 2: Special Requests ──
          if (widget.specialRequests.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE2E8F0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.edit_note, color: AppColors.primary, size: 20),
                      const SizedBox(width: 8),
                      const Text(
                        'Ghi chú đặc biệt',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Be Vietnam Pro',
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Text(
                      '"${widget.specialRequests}"',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF64748B),
                        fontStyle: FontStyle.italic,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],

          // ── Section 3: Terms Checkbox ──
          GestureDetector(
            onTap: () => setState(() => _termsAccepted = !_termsAccepted),
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: _termsAccepted,
                      onChanged: (v) =>
                          setState(() => _termsAccepted = v ?? false),
                      activeColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      side: BorderSide(
                        color: _termsAccepted
                            ? AppColors.primary
                            : const Color(0xFFCBD5E1),
                        width: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF64748B),
                            height: 1.5,
                          ),
                          children: const [
                            TextSpan(text: 'Tôi đã đọc và đồng ý với các '),
                            TextSpan(
                              text: 'Điều khoản sử dụng',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            TextSpan(text: ' và '),
                            TextSpan(
                              text: 'Chính sách hoàn hủy',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            TextSpan(text: ' của Travery.'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 100),
        ],
      ),
      bottomNavigationBar: Consumer<BookingReviewViewModel>(
        builder: (context, vm, _) {
          return Container(
            padding: EdgeInsets.fromLTRB(
              24,
              16,
              24,
              MediaQuery.of(context).padding.bottom + 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 20,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'TỔNG THANH TOÁN',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF64748B),
                          letterSpacing: 0.6,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _formatPrice(_totalPrice),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Be Vietnam Pro',
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 160,
                  child: GestureDetector(
                    onTap: !_termsAccepted || vm.isCreatingBooking
                        ? null
                        : () => _onConfirm(context),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 48,
                      decoration: BoxDecoration(
                        color: _termsAccepted && !vm.isCreatingBooking
                            ? AppColors.primary
                            : const Color(0xFFE2E8F0),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: _termsAccepted && !vm.isCreatingBooking
                            ? [
                                BoxShadow(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.25,
                                  ),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ]
                            : null,
                      ),
                      child: Center(
                        child: vm.isCreatingBooking
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                            : const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tiếp tục',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Be Vietnam Pro',
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildContactSection(BookingReviewViewModel vm) {
    final name = vm.userName?.isNotEmpty == true
        ? vm.userName!
        : 'Chưa cập nhật';
    final phone = vm.userPhone?.isNotEmpty == true
        ? vm.userPhone!
        : 'Chưa cập nhật';
    final email = vm.userEmail?.isNotEmpty == true
        ? vm.userEmail!
        : 'Chưa cập nhật';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'THÔNG TIN LIÊN LẠC',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            fontFamily: 'Be Vietnam Pro',
            color: Color(0xFF64748B),
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              _buildInfoRow(icon: Icons.person_outline, text: name),
              const SizedBox(height: 10),
              _buildInfoRow(icon: Icons.phone_outlined, text: phone),
              const SizedBox(height: 10),
              _buildInfoRow(icon: Icons.email_outlined, text: email),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String text,
    String? label,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.primary),
        const SizedBox(width: 8),
        if (label != null) ...[
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF64748B),
            ),
          ),
        ],
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF64748B),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _onConfirm(BuildContext context) async {
    final vm = widget.viewModel;
    final success = await vm.createBooking(
      instanceId: widget.instanceId,
      members: widget.members,
      specialRequests: widget.specialRequests,
    );

    if (!mounted) return;

    if (!success) {
      _showErrorDialog(context, vm.error ?? 'Error');
      return;
    }

    final booking = vm.bookingData;
    if (booking == null) return;

    if (booking.payment != null && booking.payment!.transactionId.isNotEmpty) {
      await PaymentSessionStorage.save(
        booking.payment!.transactionId,
        booking.id,
      );
    }

    if (booking.payment != null && booking.payment!.paymentUrl.isNotEmpty) {
      context.pushReplacement(
        Routes.vnpayPayment,
        extra: {
          'bookingId': booking.id,
          'paymentUrl': booking.payment!.paymentUrl,
          'transactionId': booking.payment!.transactionId,
          'amount': booking.payment!.amount,
          'expiresAt': booking.payment!.expiresAt,
          'tourName': widget.tourName,
        },
      );
    } else {
      context.pushReplacement(
        Routes.paymentResult,
        extra: {
          'bookingId': booking.id,
          'txnRef': booking.payment?.transactionId,
          'deeplinkStatus': null,
          'responseCode': null,
        },
      );
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline,
                size: 30,
                color: Colors.red.shade400,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Không thể đặt tour',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Color(0xFF131B2E),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Người lớn phải từ 12 tuổi trở lên, trẻ em phải từ 11 tuổi trở xuống',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF414755),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(ctx),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Đã hiểu',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }
}
