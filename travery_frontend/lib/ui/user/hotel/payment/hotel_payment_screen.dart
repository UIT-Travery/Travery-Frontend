import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/services/hotel/hotel_service.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:travery_frontend/ui/user/hotel/widgets/hotel_app_bar.dart';

class HotelPaymentScreen extends StatefulWidget {
  const HotelPaymentScreen({super.key});

  @override
  State<HotelPaymentScreen> createState() => _HotelPaymentScreenState();
}

class _HotelPaymentScreenState extends State<HotelPaymentScreen> {
  WebViewController? _controller;
  bool _isLoading = true;
  bool _hasNavigatedAway = false;
  Timer? _pollingTimer;
  int _pollAttempts = 0;
  static const int _maxPollAttempts = 60;

  String? _bookingId;
  String? _transactionId;
  double? _totalPrice;
  String? _paymentUrl;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    _bookingId = extra?['bookingId'] as String?;
    _transactionId = extra?['transactionId'] as String?;
    _totalPrice = (extra?['totalPrice'] as num?)?.toDouble();
    _paymentUrl =
        extra?['paymentUrl'] as String? ??
        'https://sandbox.vnpayment.vn/apis/sandbox/transaction/1fbc18cd-a5e5-44f3-b9bf-e7b24d5ed7c5';

    _initWebView();
    _startPolling();
  }

  void _startPolling() {
    _pollAttempts = 0;
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(const Duration(seconds: 2), (_) async {
      if (!mounted || _hasNavigatedAway || _bookingId == null) {
        _pollingTimer?.cancel();
        return;
      }
      if (_pollAttempts >= _maxPollAttempts) {
        _pollingTimer?.cancel();
        return;
      }
      _pollAttempts++;

      final result = await _checkPaymentStatus();
      if (result == PaymentStatus.paid) {
        _pollingTimer?.cancel();
        _hasNavigatedAway = true;
        _navigateToResult(success: true);
      } else if (result == PaymentStatus.failed) {
        _pollingTimer?.cancel();
        _hasNavigatedAway = true;
        _navigateToResult(success: false);
      }
    });
  }

  Future<PaymentStatus> _checkPaymentStatus() async {
    if (_bookingId == null) return PaymentStatus.unknown;

    try {
      final hotelService = context.read<HotelService>();
      final result = await hotelService.getBookingDetail(_bookingId!);

      if (result is Ok) {
        final booking = (result as Ok).value;
        final paymentStatus = booking.paymentStatus?.toUpperCase();

        if (paymentStatus == 'PAID') {
          _transactionId =
              booking.gatewayTransactionId ?? booking.transactionId;
          return PaymentStatus.paid;
        } else if (paymentStatus == 'FAILED' || paymentStatus == 'CANCELLED') {
          return PaymentStatus.failed;
        }
      }
    } catch (e) {
      debugPrint('Error checking payment status: $e');
    }

    return PaymentStatus.pending;
  }

  void _initWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            if (_hasNavigatedAway) return;
            debugPrint('Page started: $url');
            _handleNavigation(url);
          },
          onPageFinished: (_) {
            if (mounted) setState(() => _isLoading = false);
          },
          onWebResourceError: (error) {
            debugPrint('WebView error: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse(_paymentUrl!));
  }

  void _handleNavigation(String url) {
    // Check for VNPay response codes
    if (url.contains('vnp_ResponseCode') || url.contains('responseCode')) {
      _pollingTimer?.cancel();
      final uri = Uri.parse(url);
      final responseCode =
          uri.queryParameters['vnp_ResponseCode'] ??
          uri.queryParameters['responseCode'];
      _hasNavigatedAway = true;
      _navigateToResult(success: responseCode == '00');
      return;
    }

    // Check for custom scheme return URLs (e.g., travery://payment-result?...)
    if (url.startsWith('travery://') ||
        url.startsWith('app://') ||
        url.contains('payment-result')) {
      _pollingTimer?.cancel();
      _hasNavigatedAway = true;
      _navigateToResult(success: true);
    }
  }

  void _navigateToResult({required bool success}) {
    if (!mounted) return;
    _pollingTimer?.cancel();
    _hasNavigatedAway = true;
    context.go(
      Routes.hotelPaymentResult,
      extra: {
        'bookingId': _bookingId,
        'status': success ? 'success' : 'failed',
        'transactionId': _transactionId,
        'totalPrice': _totalPrice,
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
      appBar: const HotelAppBar(
        title: 'Thanh toán VNPay',
        leadingIcon: Icons.close,
        showConfirmDialog: true,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller!),
          if (_isLoading)
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Đang tải trang thanh toán...'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

enum PaymentStatus { pending, paid, failed, unknown }
