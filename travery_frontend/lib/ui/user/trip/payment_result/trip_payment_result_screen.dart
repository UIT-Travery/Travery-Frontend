import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/trip/payment_result/view_models/trip_payment_result_view_model.dart';

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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Color(0xFF1E293B)),
            onPressed: () => context.go(Routes.home),
          ),
          title: const Text(
            'Kết quả thanh toán',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E293B),
            ),
          ),
          centerTitle: true,
        ),
        body: Consumer<TripPaymentResultViewModel>(
          builder: (context, vm, _) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    _buildContent(vm),
                    const Spacer(),
                    _buildActions(vm),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(TripPaymentResultViewModel vm) {
    switch (vm.state) {
      case TripPaymentConfirmState.waitingDeeplink:
        return _WaitingDeeplinkContent();
      case TripPaymentConfirmState.confirming:
        return _ConfirmingContent();
      case TripPaymentConfirmState.confirmed:
        return _ConfirmedContent(booking: vm.bookingData);
      case TripPaymentConfirmState.failed:
        return _FailedContent(message: vm.getErrorMessage());
      case TripPaymentConfirmState.processingTimeout:
        return _TimeoutContent();
    }
  }

  Widget _buildActions(TripPaymentResultViewModel vm) {
    switch (vm.state) {
      case TripPaymentConfirmState.waitingDeeplink:
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => vm.checkManually(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text('Đã thanh toán — Kiểm tra ngay'),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => context.go(Routes.home),
              child: const Text('Về trang chủ'),
            ),
          ],
        );
      case TripPaymentConfirmState.confirmed:
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.go(
                    Routes.tripBookingDetail,
                    extra: {'bookingId': vm.bookingData?.id ?? ''},
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text('Xem chi tiết đặt vé'),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => context.go(Routes.home),
              child: const Text('Về trang chủ'),
            ),
          ],
        );
      case TripPaymentConfirmState.failed:
      case TripPaymentConfirmState.processingTimeout:
        return Column(
          children: [
            if (vm.state == TripPaymentConfirmState.processingTimeout)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => vm.retryPolling(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text('Kiểm tra lại'),
                ),
              ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => context.go(Routes.home),
              child: const Text('Về trang chủ'),
            ),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

class _WaitingDeeplinkContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 88,
          height: 88,
          decoration: const BoxDecoration(
            color: Color(0xFFF1F5F9),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.receipt_long_outlined,
            size: 44,
            color: Color(0xFF64748B),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Chờ thanh toán...',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 12),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Vui lòng hoàn tất thanh toán trên VNPay.\nKết quả sẽ tự động cập nhật khi bạn quay lại app.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

class _ConfirmingContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 88,
          height: 88,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: SizedBox(
              width: 44,
              height: 44,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Đang xác nhận thanh toán...',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 12),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Vui lòng không tắt ứng dụng.\nHệ thống đang xác nhận với ngân hàng.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

class _ConfirmedContent extends StatelessWidget {
  const _ConfirmedContent({required this.booking});

  final dynamic booking;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 88,
          height: 88,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF10B981), Color(0xFF059669)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check_circle, size: 52, color: Colors.white),
        ),
        const SizedBox(height: 24),
        const Text(
          'Thanh toán thành công!',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 12),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Cảm ơn bạn đã đặt vé.\nBooking của bạn đã được xác nhận.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
              height: 1.5,
            ),
          ),
        ),
        if (booking != null) ...[
          const SizedBox(height: 28),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 48,
              ),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE2E8F0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _InfoRow(
                    'Mã giao dịch',
                    _shortCode(
                      booking.gatewayTransactionId as String? ??
                          booking.transactionId as String? ??
                          booking.id as String,
                    ),
                  ),
                  const Divider(height: 24),
                  _InfoRow(
                    'Tổng tiền',
                    _formatPrice(booking.totalPrice as double),
                  ),
                  const Divider(height: 24),
                  const _InfoRow('Trạng thái', 'Đã thanh toán'),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  String _shortCode(String id) {
    final clean = id.replaceAll('-', '');
    return clean.length >= 8
        ? clean.substring(0, 8).toUpperCase()
        : clean.toUpperCase();
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }
}

class _FailedContent extends StatelessWidget {
  const _FailedContent({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 88,
          height: 88,
          decoration: BoxDecoration(
            color: Colors.red.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.cancel_outlined, size: 52, color: Colors.red),
        ),
        const SizedBox(height: 24),
        const Text(
          'Thanh toán thất bại',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

class _TimeoutContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 88,
          height: 88,
          decoration: BoxDecoration(
            color: Colors.orange.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.hourglass_empty,
            size: 52,
            color: Colors.orange,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Thanh toán đang xử lý',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 12),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Hệ thống chưa xác nhận được thanh toán của bạn.\nVui lòng kiểm tra lại sau vài phút.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1E293B),
          ),
        ),
      ],
    );
  }
}
