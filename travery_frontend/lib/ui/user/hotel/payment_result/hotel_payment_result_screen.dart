import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/models/hotel/hotel_booking_data.dart';
import 'package:travery_frontend/data/services/hotel/hotel_service.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/widgets/user_result_screen.dart';
import 'package:travery_frontend/utils/core_result.dart';

class HotelPaymentResultScreen extends StatefulWidget {
  const HotelPaymentResultScreen({super.key});

  @override
  State<HotelPaymentResultScreen> createState() =>
      _HotelPaymentResultScreenState();
}

class _HotelPaymentResultScreenState extends State<HotelPaymentResultScreen> {
  bool _isSuccess = true;
  bool _isLoading = false;
  String? _bookingId;
  String? _transactionId;
  double? _totalPrice;
  HotelBookingData? _bookingData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
      setState(() {
        _isSuccess = (extra?['status'] as String? ?? 'success') == 'success';
        _bookingId = extra?['bookingId'] as String?;
        _transactionId = extra?['transactionId'] as String?;
        _totalPrice = (extra?['totalPrice'] as num?)?.toDouble();
      });
      _fetchBookingDetails();
    });
  }

  Future<void> _fetchBookingDetails() async {
    final bookingId = _bookingId;
    if (bookingId == null || bookingId.isEmpty) return;

    setState(() => _isLoading = true);
    try {
      final result = await context.read<HotelService>().getBookingDetail(
        bookingId,
      );

      if (!mounted) return;
      if (result is Ok<HotelBookingData>) {
        setState(() => _bookingData = result.value);
      }
    } catch (_) {
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSuccess = _isSuccess;

    return UserResultScreen(
      status: isSuccess ? UserResultStatus.success : UserResultStatus.failed,
      appBarTitle: 'Kết quả thanh toán',
      title: isSuccess ? 'Thanh toán thành công' : 'Thanh toán thất bại',
      message: isSuccess
          ? 'Cảm ơn bạn đã đặt phòng. Booking của bạn đã được xác nhận.'
          : 'Đã xảy ra lỗi trong quá trình thanh toán. Vui lòng thử lại.',
      summaryTitle: isSuccess ? 'Chi tiết thanh toán' : null,
      summaryIcon: Icons.receipt_long_outlined,
      details: isSuccess ? _hotelPaymentDetails() : const [],
      isSummaryLoading: isSuccess && _isLoading && _bookingData == null,
      actions: [
        UserResultAction.primary(
          label: 'Về trang chủ',
          icon: Icons.home_outlined,
          backgroundColor: isSuccess ? AppColors.primary : AppColors.error,
          onPressed: () => context.go(Routes.home),
        ),
      ],
      onClose: () => context.go(Routes.home),
    );
  }

  List<UserResultDetail> _hotelPaymentDetails() {
    final booking = _bookingData;
    final transactionId =
        booking?.gatewayTransactionId ??
        booking?.transactionId ??
        _transactionId;
    final totalPrice = booking?.totalPrice ?? _totalPrice;
    final firstItem = booking?.items?.isNotEmpty == true
        ? booking!.items!.first
        : null;

    return [
      if (booking?.hotelName.isNotEmpty == true)
        UserResultDetail(label: 'Khách sạn', value: booking!.hotelName),
      if (firstItem != null)
        UserResultDetail(label: 'Loại phòng', value: firstItem.roomTypeName),
      if (booking?.startDate != null && booking?.endDate != null) ...[
        UserResultDetail(
          label: 'Nhận phòng',
          value: _formatDate(booking!.startDate!),
        ),
        UserResultDetail(
          label: 'Trả phòng',
          value: _formatDate(booking.endDate!),
        ),
      ],
      UserResultDetail(
        label: 'Mã giao dịch',
        value: shortUserResultCode(transactionId ?? booking?.id),
      ),
      if (totalPrice != null)
        UserResultDetail(
          label: 'Tổng thanh toán',
          value: formatUserResultPrice(totalPrice),
          highlighted: true,
        ),
      const UserResultDetail(label: 'Trạng thái', value: 'Đã thanh toán'),
    ];
  }

  String _formatDate(String value) {
    final date = DateTime.tryParse(value);
    if (date == null) return value;
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
