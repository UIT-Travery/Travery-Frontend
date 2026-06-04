import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/tour/booking_detail/view_models/booking_detail_view_model.dart';
import 'package:travery_frontend/ui/user/widgets/user_app_bar.dart';
import 'package:travery_frontend/ui/user/widgets/member_row.dart';
import 'package:travery_frontend/ui/user/widgets/write_review_screen.dart';

class BookingDetailScreen extends StatefulWidget {
  const BookingDetailScreen({
    super.key,
    required this.viewModel,
    required this.bookingId,
  });

  final BookingDetailViewModel viewModel;
  final String bookingId;

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  static const _pollInterval = Duration(seconds: 5);
  Timer? _pollingTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.loadBookingDetail(widget.bookingId);
      _startPolling();
    });
  }

  @override
  void dispose() {
    _pollingTimer?.cancel();
    super.dispose();
  }

  void _startPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(_pollInterval, (_) {
      final vm = widget.viewModel;
      if (vm.bookingDetail != null) {
        final status = vm.bookingDetail!.status.toUpperCase();
        if (status == 'PENDING' ||
            status == 'CONFIRMING' ||
            status == 'PROCESSING') {
          vm.loadBookingDetail(widget.bookingId);
        }
      }
    });
  }

  Future<void> _onRefresh() async {
    await widget.viewModel.loadBookingDetail(widget.bookingId);
    _startPolling();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const UserAppBar(title: 'Chi tiết đặt tour'),
      body: Consumer<BookingDetailViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading && vm.bookingDetail == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.error != null && vm.bookingDetail == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.grey),
                  const SizedBox(height: 12),
                  const Text('Không thể tải chi tiết đơn đặt tour'),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _onRefresh,
                    child: const Text('Thử lại'),
                  ),
                ],
              ),
            );
          }

          if (vm.bookingDetail == null) {
            return const SizedBox.shrink();
          }

          final booking = vm.bookingDetail!;
          final adultCount = booking.members
              .where((m) => m.memberType == 'ADULT')
              .length;
          final childCount = booking.members
              .where((m) => m.memberType != 'ADULT')
              .length;

          return RefreshIndicator(
            onRefresh: _onRefresh,
            color: AppColors.primary,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildStatusBadge(booking.status),
                const SizedBox(height: 20),
                Text(
                  booking.tourName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF131B2E),
                  ),
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('Thông tin tour'),
                const SizedBox(height: 12),
                _buildFormRow('Ngày khởi hành', _formatDate(booking.startDate)),
                _buildDivider(),
                _buildFormRow('Ngày kết thúc', _formatDate(booking.endDate)),
                _buildDivider(),
                _buildFormRow(
                  'Người lớn',
                  '$adultCount x ${_formatPrice(booking.pricePerAdultAtBooking ?? 0)}',
                ),
                if (childCount > 0) ...[
                  _buildDivider(),
                  _buildFormRow(
                    'Trẻ em',
                    '$childCount x ${_formatPrice(booking.pricePerChildAtBooking ?? 0)}',
                  ),
                ],
                const SizedBox(height: 24),
                _buildSectionTitle('Thanh toán'),
                const SizedBox(height: 12),
                _buildFormRow(
                  'Tổng tiền',
                  _formatPrice(booking.totalPrice),
                  valueStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                if (booking.gatewayTransactionId != null &&
                    booking.gatewayTransactionId!.isNotEmpty) ...[
                  _buildDivider(),
                  _buildFormRow(
                    'Mã giao dịch',
                    booking.gatewayTransactionId!,
                  ),
                ],
                if (booking.createdAt != null) ...[
                  _buildDivider(),
                  _buildFormRow(
                    'Ngày đặt',
                    _formatDateTime(booking.createdAt!),
                  ),
                ],
                const SizedBox(height: 24),
                _buildSectionTitle(
                  'Danh sách khách (${booking.members.length})',
                ),
                const SizedBox(height: 12),
                ...booking.members.map<Widget>(
                  (m) => MemberRow(
                    memberName: m.fullName,
                    memberType: m.memberType,
                    identity: m.identityNumber,
                    dateOfBirth: m.dateOfBirth,
                    attendanceStatus: m.attendanceStatus,
                  ),
                ),
                if (booking.specialRequests != null &&
                    booking.specialRequests!.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  _buildSectionTitle('Yêu cầu đặc biệt'),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Text(
                      booking.specialRequests!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 120),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Consumer<BookingDetailViewModel>(
        builder: (context, vm, _) {
          if (vm.bookingDetail == null) return const SizedBox.shrink();
          if (vm.bookingDetail!.status == 'CANCELLED') {
            return const SizedBox.shrink();
          }

          final booking = vm.bookingDetail!;
          final canCancel = booking.canCancel;
          final canReview = vm.canCreateReview;
          return Container(
            padding: EdgeInsets.fromLTRB(
              20,
              16,
              20,
              MediaQuery.of(context).padding.bottom + 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 20,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Row(
              children: [
                if (canCancel) ...[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () =>
                          context.push('/booking/${widget.bookingId}/cancel'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Hủy tour',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                if (canReview) ...[
                  Expanded(
                    flex: 2,
                    child: ElevatedButton.icon(
                      onPressed: () => _openReviewSheet(context, vm),
                      icon: const Icon(Icons.star_rounded, size: 18),
                      label: const Text(
                        'Viết đánh giá',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                ] else
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {},
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
                          Icon(Icons.group, size: 18),
                          SizedBox(width: 8),
                          Text(
                            'Vào group chat',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
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

  Future<void> _openReviewSheet(
    BuildContext context,
    BookingDetailViewModel vm,
  ) async {
    final booking = vm.bookingDetail;
    if (booking == null) return;

    final submitted = await pushWriteReviewScreen(
      context,
      title: 'Đánh giá tour',
      imageUrl: '',
      onSubmit: vm.createReview,
    );

    if (!context.mounted || submitted != true) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cảm ơn bạn đã gửi đánh giá'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color bgColor;
    Color textColor;
    String label;

    switch (status.toUpperCase()) {
      case 'CONFIRMED':
        bgColor = const Color(0xFFECFDF5);
        textColor = const Color(0xFF059669);
        label = 'Đã xác nhận';
        break;
      case 'PENDING':
        bgColor = const Color(0xFFFEF3C7);
        textColor = const Color(0xFFB45309);
        label = 'Chờ thanh toán';
        break;
      case 'CANCELLED':
        bgColor = const Color(0xFFFEE2E2);
        textColor = const Color(0xFFDC2626);
        label = 'Đã hủy';
        break;
      case 'PAID':
        bgColor = const Color(0xFFECFDF5);
        textColor = const Color(0xFF059669);
        label = 'Đã thanh toán';
        break;
      case 'COMPLETED':
        bgColor = const Color(0xFFDBEAFE);
        textColor = const Color(0xFF1D4ED8);
        label = 'Hoàn thành';
        break;
      default:
        bgColor = Colors.grey.shade100;
        textColor = Colors.grey.shade700;
        label = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Color(0xFF131B2E),
      ),
    );
  }

  Widget _buildFormRow(String label, String value, {TextStyle? valueStyle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Color(0xFF717786)),
          ),
          Flexible(
            child: Text(
              value,
              style:
                  valueStyle ??
                  const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF131B2E),
                  ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, color: Color(0xFFE2E8F0));
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return 'N/A';
    try {
      final date = DateTime.parse(dateStr);
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    } catch (_) {
      return dateStr;
    }
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }

  String _formatDateTime(String dateTimeStr) {
    try {
      final dateTime = DateTime.parse(dateTimeStr);
      return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    } catch (_) {
      return dateTimeStr;
    }
  }

}
