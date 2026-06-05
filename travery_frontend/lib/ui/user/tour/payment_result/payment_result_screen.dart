import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/services/api/model/booking/create_tour_booking_response/create_tour_booking_response.dart';
import 'package:travery_frontend/data/services/deep_link_service.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/tour/payment_result/view_models/payment_result_view_model.dart';
import 'package:travery_frontend/ui/user/widgets/user_result_screen.dart';

class PaymentResultScreen extends StatefulWidget {
  const PaymentResultScreen({
    super.key,
    required this.viewModel,
    this.txnRef,
    this.deeplinkStatus,
    this.responseCode,
    this.bookingId,
  });

  final PaymentResultViewModel viewModel;
  final String? txnRef;
  final String? deeplinkStatus;
  final String? responseCode;
  final String? bookingId;

  @override
  State<PaymentResultScreen> createState() => _PaymentResultScreenState();
}

class _PaymentResultScreenState extends State<PaymentResultScreen> {
  StreamSubscription<Uri>? _deeplinkSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initFromExtra();
      _subscribeToDeepLinks();
    });
  }

  void _initFromExtra() {
    widget.viewModel.initState(
      txnRef: widget.txnRef,
      deeplinkStatus: widget.deeplinkStatus,
      responseCode: widget.responseCode,
      bookingId: widget.bookingId,
    );
  }

  void _subscribeToDeepLinks() {
    _deeplinkSubscription = DeepLinkService.instance.uriStream.listen((uri) {
      if (uri.scheme == 'travery' && uri.host == 'payment-result') {
        widget.viewModel.initState(
          txnRef: uri.queryParameters['txnRef'],
          deeplinkStatus: uri.queryParameters['status'],
          responseCode: uri.queryParameters['responseCode'],
          bookingId: null,
        );
      }
    });
  }

  @override
  void dispose() {
    _deeplinkSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentResultViewModel>(
      builder: (context, vm, _) {
        return switch (vm.state) {
          PaymentConfirmState.waitingDeeplink => UserResultScreen(
            status: UserResultStatus.waiting,
            appBarTitle: 'Kết quả thanh toán',
            title: 'Chờ thanh toán',
            message:
                'Vui lòng hoàn tất thanh toán trên VNPay. Kết quả sẽ tự động cập nhật khi bạn quay lại ứng dụng.',
            actions: [
              UserResultAction.primary(
                label: 'Đã thanh toán - kiểm tra',
                icon: Icons.refresh,
                onPressed: vm.checkManually,
              ),
              UserResultAction.secondary(
                label: 'Về trang chủ',
                icon: Icons.home_outlined,
                onPressed: () => context.go(Routes.home),
              ),
            ],
            onClose: () => context.go(Routes.home),
          ),
          PaymentConfirmState.confirming => UserResultScreen(
            status: UserResultStatus.processing,
            appBarTitle: 'Kết quả thanh toán',
            title: 'Đang xác nhận',
            message:
                'Hệ thống đang xác nhận thanh toán với ngân hàng. Vui lòng không tắt ứng dụng trong lúc xử lý.',
            onClose: () => context.go(Routes.home),
          ),
          PaymentConfirmState.confirmed => UserResultScreen(
            status: UserResultStatus.success,
            appBarTitle: 'Kết quả thanh toán',
            title: 'Thanh toán thành công',
            message:
                'Cảm ơn bạn đã đặt tour. Booking của bạn đã được xác nhận.',
            summaryTitle: 'Chi tiết thanh toán',
            summaryIcon: Icons.receipt_long_outlined,
            details: _tourPaymentDetails(vm.bookingData),
            actions: [
              UserResultAction.primary(
                label: 'Về trang chủ',
                icon: Icons.home_outlined,
                onPressed: () => context.go(Routes.home),
              ),
            ],
            onClose: () => context.go(Routes.home),
          ),
          PaymentConfirmState.failed => UserResultScreen(
            status: UserResultStatus.failed,
            appBarTitle: 'Kết quả thanh toán',
            title: 'Thanh toán thất bại',
            message: vm.getErrorMessage(),
            actions: [
              UserResultAction.primary(
                label: 'Về trang chủ',
                icon: Icons.home_outlined,
                backgroundColor: AppColors.error,
                onPressed: () => context.go(Routes.home),
              ),
            ],
            onClose: () => context.go(Routes.home),
          ),
          PaymentConfirmState.processingTimeout => UserResultScreen(
            status: UserResultStatus.warning,
            appBarTitle: 'Kết quả thanh toán',
            title: 'Thanh toán đang xử lý',
            message:
                'Hệ thống chưa xác nhận được thanh toán của bạn. Vui lòng kiểm tra lại sau vài phút.',
            actions: [
              UserResultAction.primary(
                label: 'Kiểm tra lại',
                icon: Icons.refresh,
                onPressed: vm.retryPolling,
              ),
              UserResultAction.secondary(
                label: 'Về trang chủ',
                icon: Icons.home_outlined,
                onPressed: () => context.go(Routes.home),
              ),
            ],
            onClose: () => context.go(Routes.home),
          ),
        };
      },
    );
  }

  List<UserResultDetail> _tourPaymentDetails(TourBookingData? booking) {
    if (booking == null) return const [];
    final transactionId = booking.gatewayTransactionId.isNotEmpty
        ? booking.gatewayTransactionId
        : booking.transactionId;

    return [
      if (booking.tourName.isNotEmpty)
        UserResultDetail(label: 'Tour', value: booking.tourName),
      UserResultDetail(
        label: 'Mã giao dịch',
        value: shortUserResultCode(
          transactionId.isNotEmpty ? transactionId : booking.id,
        ),
      ),
      UserResultDetail(
        label: 'Tổng thanh toán',
        value: formatUserResultPrice(booking.totalPrice),
        highlighted: true,
      ),
      const UserResultDetail(label: 'Trạng thái', value: 'Đã thanh toán'),
    ];
  }
}
