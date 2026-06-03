import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HotelAddonPaymentScreen extends StatefulWidget {
  const HotelAddonPaymentScreen({super.key});

  @override
  State<HotelAddonPaymentScreen> createState() =>
      _HotelAddonPaymentScreenState();
}

class _HotelAddonPaymentScreenState extends State<HotelAddonPaymentScreen> {
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
            if (url.contains('return') ||
                url.contains('callback') ||
                url.contains('success')) {
              _handlePaymentSuccess();
            }
          },
          onPageFinished: (url) => setState(() => _isLoading = false),
        ),
      );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.loadRequest(Uri.parse('https://sandbox.vnpayment.vn'));
    });
  }

  void _handlePaymentSuccess() {
    context.go(
      Routes.hotelAddonPaymentResult,
      extra: {'transactionId': 'AS-8892', 'status': 'success'},
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
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Thanh toán dịch vụ',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
