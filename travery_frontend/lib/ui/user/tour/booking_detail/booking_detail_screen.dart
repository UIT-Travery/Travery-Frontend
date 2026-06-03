import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/tour/booking_detail/view_models/booking_detail_view_model.dart';
import 'package:travery_frontend/ui/user/widgets/user_app_bar.dart';
import 'package:travery_frontend/ui/user/tour/widgets/status_banner.dart';
import 'package:travery_frontend/ui/user/tour/widgets/info_card.dart';
import 'package:travery_frontend/ui/user/widgets/section_title.dart';
import 'package:travery_frontend/ui/user/widgets/member_row.dart';

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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.loadBookingDetail(widget.bookingId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFF),
      appBar: const UserAppBar(title: 'Chi tiết đặt tour'),
      body: Consumer<BookingDetailViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.error != null || vm.bookingDetail == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.grey),
                  const SizedBox(height: 12),
                  const Text('Không thể tải chi tiết đơn đặt tour'),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => vm.loadBookingDetail(widget.bookingId),
                    child: const Text('Thử lại'),
                  ),
                ],
              ),
            );
          }

          final booking = vm.bookingDetail!;

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              StatusBanner(status: booking.status),
              const SizedBox(height: 20),
              Text(
                booking.tourName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF131B2E),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: InfoCard(
                      icon: Icons.calendar_today,
                      label: 'Ngày khởi hành',
                      value: _formatDate(booking.departureDate),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: InfoCard(
                      icon: Icons.group,
                      label: 'Số khách',
                      value: '${booking.guestCount} người',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: InfoCard(
                      icon: Icons.payments,
                      label: 'Tổng tiền',
                      value: _formatPrice(booking.totalPrice),
                      isHighlight: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: InfoCard(
                      icon: Icons.payment,
                      label: 'Thanh toán',
                      value: booking.paymentMethod ?? 'VNPay',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const SectionTitle(title: 'Danh sách khách', icon: Icons.group),
              const SizedBox(height: 12),
              ...booking.members.map<Widget>(
                (m) => MemberRow(
                  memberName: m.fullName,
                  memberType: m.memberType,
                  identity: m.identityNumber ?? '',
                ),
              ),
              const SizedBox(height: 24),
              if (booking.specialRequests != null &&
                  booking.specialRequests!.isNotEmpty) ...[
                const SectionTitle(
                  title: 'Yêu cầu đặc biệt',
                  icon: Icons.note_alt_outlined,
                ),
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
                const SizedBox(height: 24),
              ],
              const SizedBox(height: 120),
            ],
          );
        },
      ),
      bottomNavigationBar: Consumer<BookingDetailViewModel>(
        builder: (context, vm, _) {
          if (vm.bookingDetail == null) return const SizedBox.shrink();
          if (vm.bookingDetail!.status == 'CANCELLED') {
            return const SizedBox.shrink();
          }

          final canCancel = vm.bookingDetail!.canCancel;
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

  String _formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }
}
