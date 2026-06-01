import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/trip/payment/view_models/trip_payment_view_model.dart';
import 'package:travery_frontend/ui/user/widgets/user_app_bar.dart';

class TripPaymentScreen extends StatefulWidget {
  const TripPaymentScreen({super.key});

  @override
  State<TripPaymentScreen> createState() => _TripPaymentScreenState();
}

class _TripPaymentScreenState extends State<TripPaymentScreen> {
  WebViewController? _controller;
  bool _isLoading = true;
  bool _hasNavigatedAway = false;
  Timer? _pollingTimer;
  int _pollAttempts = 0;
  static const int _maxPollAttempts = 30;

  String? _bookingId;
  String? _paymentUrl;
  String? _transactionId;
  String? _tripName;
  double? _amount;
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _isInitialized = true;
      _parseExtra();
      if (_paymentUrl != null && _paymentUrl!.isNotEmpty) {
        _initWebView();
        _startPolling();
      }
    }
  }

  void _parseExtra() {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    if (extra != null) {
      _bookingId = extra['bookingId'] as String?;
      final urlRaw = extra['paymentUrl'];
      _paymentUrl = (urlRaw is String && urlRaw.isNotEmpty) ? urlRaw : null;
      _transactionId = extra['transactionId'] as String?;
      _tripName = extra['tripName'] as String? ?? 'Chuyến xe';
      final amountRaw = extra['amount'];
      _amount = (amountRaw is num) ? amountRaw.toDouble() : null;
    }
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
          onPageFinished: (_) {
            if (mounted) setState(() => _isLoading = false);
          },
          onWebResourceError: (e) =>
              debugPrint('WebView error: ${e.description}'),
        ),
      )
      ..loadRequest(Uri.parse(_paymentUrl!));
  }

  void _handleNavigation(String url) {
    if (url.contains('vnp_ResponseCode') || url.contains('responseCode')) {
      _hasNavigatedAway = true;
      _pollingTimer?.cancel();
      final uri = Uri.parse(url);
      final responseCode =
          uri.queryParameters['vnp_ResponseCode'] ??
          uri.queryParameters['responseCode'];
      debugPrint('VNPay Return URL: $url, ResponseCode: $responseCode');
      if (responseCode == '00') {
        _navigateToResult(success: true);
      }
    }
  }

  void _startPolling() {
    _pollAttempts = 0;
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(const Duration(seconds: 5), (_) async {
      if (!mounted || _hasNavigatedAway || _bookingId == null) {
        _pollingTimer?.cancel();
        return;
      }
      if (_pollAttempts >= _maxPollAttempts) {
        _pollingTimer?.cancel();
        return;
      }
      _pollAttempts++;
      final vm = context.read<TripPaymentViewModel>();
      final result = await vm.checkBookingStatus(_bookingId!);
      if (result?.paymentStatus == 'PAID' || result?.status == 'PAID') {
        _pollingTimer?.cancel();
        _hasNavigatedAway = true;
        _navigateToResult(success: true);
      }
    });
  }

  void _navigateToResult({required bool success}) {
    if (!mounted) return;
    context.pushReplacement(
      Routes.tripPaymentResult,
      extra: {
        'bookingId': _bookingId,
        'txnRef': _transactionId,
        'deeplinkStatus': success ? 'success' : 'failed',
        'responseCode': success ? '00' : null,
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
    if (_paymentUrl == null) {
      return Scaffold(
        appBar: const UserAppBar(title: 'Thanh toán'),
        body: const Center(child: Text('Không có liên kết thanh toán')),
      );
    }

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
                    _tripName ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF131B2E),
                    ),
                  ),
                ),
                if (_amount != null) ...[
                  const SizedBox(width: 8),
                  Text(
                    _formatPrice(_amount!),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: Stack(
              children: [
                WebViewWidget(controller: _controller!),
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
          'Bạn có muốn hủy thanh toán không? Đơn đặt vé vẫn được giữ trong thời gian thanh toán.',
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
