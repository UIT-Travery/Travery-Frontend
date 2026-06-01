import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/services/deep_link_service.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/tour/payment_result/view_models/payment_result_view_model.dart';

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
        final status = uri.queryParameters['status'];
        final code = uri.queryParameters['responseCode'];
        final ref = uri.queryParameters['txnRef'];
        // Re-initialize viewModel with deeplink data
        widget.viewModel.initState(
          txnRef: ref,
          deeplinkStatus: status,
          responseCode: code,
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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          context.go(Routes.home);
        }
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
        body: Consumer<PaymentResultViewModel>(
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

  Widget _buildContent(PaymentResultViewModel vm) {
    switch (vm.state) {
      case PaymentConfirmState.waitingDeeplink:
        return _WaitingUI(onCheckManually: () => vm.checkManually());
      case PaymentConfirmState.confirming:
        return _ConfirmingUI();
      case PaymentConfirmState.confirmed:
        return _SuccessUI(booking: vm.bookingData);
      case PaymentConfirmState.failed:
        return _FailedUI(
          message: vm.getErrorMessage(),
          responseCode: vm.responseCode,
        );
      case PaymentConfirmState.processingTimeout:
        return _ProcessingUI(onRetry: () => vm.retryPolling());
    }
  }

  Widget _buildActions(PaymentResultViewModel vm) {
    switch (vm.state) {
      case PaymentConfirmState.waitingDeeplink:
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
                child: const Text(
                  'Đã thanh toán — Kiểm tra ngay',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => context.go(Routes.home),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
              child: const Text('Về trang chủ', style: TextStyle(fontSize: 13)),
            ),
          ],
        );

      case PaymentConfirmState.confirmed:
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.push(
                    Routes.bookingDetailScreen,
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
                child: const Text(
                  'Xem chi tiết đặt tour',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => context.go(Routes.home),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
              child: const Text('Về trang chủ', style: TextStyle(fontSize: 13)),
            ),
          ],
        );

      case PaymentConfirmState.failed:
      case PaymentConfirmState.processingTimeout:
        return Column(
          children: [
            if (vm.state == PaymentConfirmState.processingTimeout)
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
                  child: const Text(
                    'Kiểm tra lại',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            if (vm.state == PaymentConfirmState.processingTimeout)
              const SizedBox(height: 10),
            TextButton(
              onPressed: () => context.go(Routes.home),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
              child: const Text('Về trang chủ', style: TextStyle(fontSize: 13)),
            ),
          ],
        );

      case PaymentConfirmState.confirming:
        return const SizedBox.shrink();
    }
  }
}

class _WaitingUI extends StatelessWidget {
  const _WaitingUI({required this.onCheckManually});

  final VoidCallback onCheckManually;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 88,
          height: 88,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
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

class _ConfirmingUI extends StatelessWidget {
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

class _SuccessUI extends StatelessWidget {
  const _SuccessUI({required this.booking});

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
            'Cảm ơn bạn đã đặt tour.\nBooking của bạn đã được xác nhận.',
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
          Container(
            width: double.infinity,
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
                _InfoItem(
                  label: 'Mã giao dịch',
                  value: _shortCode(
                    booking.gatewayTransactionId as String? ??
                        booking.transactionId as String? ??
                        '',
                  ),
                ),
                const Divider(height: 24),
                _InfoItem(
                  label: 'Tổng tiền',
                  value: _formatPrice(booking.totalPrice as double),
                ),
                const Divider(height: 24),
                const _InfoItem(label: 'Trạng thái', value: 'Đã thanh toán'),
              ],
            ),
          ),
        ],
      ],
    );
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }

  String _shortCode(String id) {
    final clean = id.replaceAll('-', '');
    return clean.length >= 8
        ? clean.substring(0, 8).toUpperCase()
        : clean.toUpperCase();
  }
}

class _FailedUI extends StatelessWidget {
  const _FailedUI({required this.message, required this.responseCode});

  final String message;
  final String? responseCode;

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
            fontWeight: FontWeight.w800,
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

class _ProcessingUI extends StatelessWidget {
  const _ProcessingUI({required this.onRetry});

  final VoidCallback onRetry;

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
            fontWeight: FontWeight.w800,
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

class _InfoItem extends StatelessWidget {
  const _InfoItem({required this.label, required this.value});

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
