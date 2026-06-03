import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/user/tour/payment/view_models/vnpay_payment_view_model.dart';
import 'package:travery_frontend/ui/user/widgets/user_app_bar.dart';

class VNPayPaymentScreen extends StatefulWidget {
  const VNPayPaymentScreen({
    super.key,
    required this.viewModel,
    required this.bookingId,
    required this.paymentUrl,
    required this.transactionId,
    required this.amount,
    required this.tourName,
    this.expiresAt,
  });

  final VNPayPaymentViewModel viewModel;
  final String bookingId;
  final String paymentUrl;
  final String transactionId;
  final double amount;
  final String? tourName;
  final String? expiresAt;

  @override
  State<VNPayPaymentScreen> createState() => _VNPayPaymentScreenState();
}

class _VNPayPaymentScreenState extends State<VNPayPaymentScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _hasNavigatedAway = false;
  Timer? _pollingTimer;
  int _pollAttempts = 0;
  static const int _maxPollAttempts = 30;

  @override
  void initState() {
    super.initState();
    _initWebView();
    _startPolling();
  }

  void _initWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            if (_hasNavigatedAway) return;
            _handleNavigation(url);
          },
          onPageFinished: (url) {
            if (mounted) {
              setState(() => _isLoading = false);
            }
          },
          onWebResourceError: (error) {
            debugPrint('WebView error: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  void _handleNavigation(String url) {
    // VNPay return URL check - vnp_ResponseCode=00 means success
    if (url.contains('vnp_ResponseCode') || url.contains('responseCode')) {
      _hasNavigatedAway = true;
      _pollingTimer?.cancel();

      final uri = Uri.parse(url);
      final responseCode =
          uri.queryParameters['vnp_ResponseCode'] ??
          uri.queryParameters['responseCode'];

      // DEBUG: log VNPay response
      debugPrint('=== VNPay Return URL: $url');
      debugPrint('=== VNPay ResponseCode: $responseCode');

      // VNPay 00 = success, otherwise stay on screen
      if (responseCode == '00') {
        _navigateToResult(success: true);
      }
      // If not 00, user can continue payment - stay on screen
    }
  }

  void _startPolling() {
    _pollAttempts = 0;
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(const Duration(seconds: 5), (_) async {
      if (!mounted || _hasNavigatedAway) {
        _pollingTimer?.cancel();
        return;
      }

      if (_pollAttempts >= _maxPollAttempts) {
        _pollingTimer?.cancel();
        // Timeout - stay on screen, user can manually check
        return;
      }

      _pollAttempts++;

      final result = await widget.viewModel.checkBookingStatus(
        widget.bookingId,
      );

      switch (result) {
        case CheckResult.paid:
          _pollingTimer?.cancel();
          _hasNavigatedAway = true;
          _navigateToResult(success: true);
        case CheckResult.pending:
        case CheckResult.error:
        case CheckResult.failed:
          // Continue polling - stay on screen
          break;
      }
    });
  }

  void _navigateToResult({required bool success, String? responseCode}) {
    debugPrint(
      '=== _navigateToResult called: success=$success, responseCode=$responseCode',
    );
    if (!mounted) return;

    context.pushReplacement(
      Routes.paymentResult,
      extra: {
        'bookingId': widget.bookingId,
        'txnRef': widget.transactionId,
        'deeplinkStatus': success ? 'success' : 'failed',
        'responseCode': responseCode ?? (success ? '00' : null),
      },
    );
  }

  @override
  void dispose() {
    _pollingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFF),
      appBar: UserAppBar(
        title: 'Thanh toán VNPay',
        leading: IconButton(
          icon: const Icon(Icons.close, color: Color(0xFF131B2E)),
          onPressed: () => _showExitDialog(context),
        ),
        actions: [
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          // Payment info bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: Colors.white,
            child: Row(
              children: [
                const Icon(
                  Icons.account_balance_wallet,
                  size: 16,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.tourName ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF131B2E),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  _formatPrice(widget.amount),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // WebView
          Expanded(
            child: Stack(
              children: [
                WebViewWidget(controller: _controller),
                if (_isLoading)
                  Container(
                    color: Colors.white,
                    child: const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.primary,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Đang tải trang thanh toán...',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF717786),
                            ),
                          ),
                        ],
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

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Hủy thanh toán?'),
        content: const Text(
          'Bạn có muốn hủy thanh toán không? Đơn đặt tour vẫn được giữ trong thời gian thanh toán.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Tiếp tục thanh toán'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.go(Routes.home);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Hủy'),
          ),
        ],
      ),
    );
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }
}
