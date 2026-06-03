import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HotelPaymentScreen extends StatefulWidget {
  const HotelPaymentScreen({super.key});

  @override
  State<HotelPaymentScreen> createState() => _HotelPaymentScreenState();
}

class _HotelPaymentScreenState extends State<HotelPaymentScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            if (url.contains('vnpay') || url.contains('payment')) {
              return;
            }
            if (url.contains('return') ||
                url.contains('callback') ||
                url.contains('success')) {
              _handlePaymentSuccess();
            }
          },
          onPageFinished: (url) {
            setState(() => _isLoading = false);
          },
          onWebResourceError: (error) {
            debugPrint('WebView error: ${error.description}');
          },
        ),
      );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
      final paymentUrl =
          extra?['paymentUrl'] as String? ??
          'https://sandbox.vnpayment.vn/apis/sandbox/transaction/1fbc18cd-a5e5-44f3-b9bf-e7b24d5ed7c5';
      _controller.loadRequest(Uri.parse(paymentUrl));
    });
  }

  void _handlePaymentSuccess() {
    context.go(
      Routes.hotelPaymentResult,
      extra: {'bookingId': 'BK-TEST-001', 'status': 'success'},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1F2937),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Xác nhận hủy'),
                content: const Text(
                  'Bạn có chắc chắn muốn hủy thanh toán không?',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: const Text('Không'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                      context.pop();
                    },
                    child: const Text('Có, hủy'),
                  ),
                ],
              ),
            );
          },
        ),
        title: const Text(
          'Thanh toán VNPay',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
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
