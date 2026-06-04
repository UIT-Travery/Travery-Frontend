import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/models/trip/trip_booking_data.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/trip/payment_result/view_models/trip_payment_result_view_model.dart';
import 'package:travery_frontend/ui/user/widgets/user_result_screen.dart';

class TripPaymentResultScreen extends StatefulWidget {
  const TripPaymentResultScreen({
    super.key,
    this.txnRef,
    this.deeplinkStatus,
    this.responseCode,
    this.bookingId,
  });

  final String? txnRef;
  final String? deeplinkStatus;
  final String? responseCode;
  final String? bookingId;

  @override
  State<TripPaymentResultScreen> createState() =>
      _TripPaymentResultScreenState();
}

class _TripPaymentResultScreenState extends State<TripPaymentResultScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TripPaymentResultViewModel>().initState(
        txnRef: widget.txnRef,
        deeplinkStatus: widget.deeplinkStatus,
        responseCode: widget.responseCode,
        bookingId: widget.bookingId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TripPaymentResultViewModel>(
      builder: (context, vm, _) {
        return switch (vm.state) {
          TripPaymentConfirmState.waitingDeeplink => UserResultScreen(
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
          TripPaymentConfirmState.confirming => UserResultScreen(
            status: UserResultStatus.processing,
            appBarTitle: 'Kết quả thanh toán',
            title: 'Đang xác nhận',
            message:
                'Hệ thống đang xác nhận thanh toán với ngân hàng. Vui lòng không tắt ứng dụng trong lúc xử lý.',
            onClose: () => context.go(Routes.home),
          ),
          TripPaymentConfirmState.confirmed => UserResultScreen(
            status: UserResultStatus.success,
            appBarTitle: 'Kết quả thanh toán',
            title: 'Thanh toán thành công',
            message: 'Cảm ơn bạn đã đặt vé. Booking của bạn đã được xác nhận.',
            summaryTitle: 'Chi tiết thanh toán',
            summaryIcon: Icons.receipt_long_outlined,
            details: _tripPaymentDetails(vm.bookingData),
            actions: [
              if (vm.bookingData != null)
                UserResultAction.primary(
                  label: 'Xem chi tiết vé',
                  icon: Icons.article_outlined,
                  onPressed: () => context.push(
                    Routes.tripBookingDetail.replaceFirst(
                      ':id',
                      vm.bookingData!.id,
                    ),
                  ),
                ),
              UserResultAction.secondary(
                label: 'Về trang chủ',
                icon: Icons.home_outlined,
                onPressed: () => context.go(Routes.home),
              ),
            ],
            onClose: () => context.go(Routes.home),
          ),
          TripPaymentConfirmState.failed => UserResultScreen(
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
          TripPaymentConfirmState.processingTimeout => UserResultScreen(
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

  List<UserResultDetail> _tripPaymentDetails(TripBookingData? booking) {
    if (booking == null) return const [];
    final transactionId =
        booking.gatewayTransactionId ??
        booking.transactionId ??
        booking.payment?.transactionId ??
        booking.id;

    return [
      if (booking.originDestination.isNotEmpty ||
          booking.destinationDestination.isNotEmpty)
        UserResultDetail(
          label: 'Tuyến xe',
          value:
              '${booking.originDestination} - ${booking.destinationDestination}',
        ),
      UserResultDetail(
        label: 'Mã giao dịch',
        value: shortUserResultCode(transactionId),
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
