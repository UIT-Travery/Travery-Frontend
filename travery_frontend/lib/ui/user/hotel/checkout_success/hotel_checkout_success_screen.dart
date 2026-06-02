import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';

class HotelCheckoutSuccessScreen extends StatefulWidget {
  const HotelCheckoutSuccessScreen({super.key});

  @override
  State<HotelCheckoutSuccessScreen> createState() =>
      _HotelCheckoutSuccessScreenState();
}

class _HotelCheckoutSuccessScreenState extends State<HotelCheckoutSuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF0F7FF), AppColors.background],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Spacer(),
                _buildSuccessContent(),
                const Spacer(),
                _buildBottomButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessContent() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale: _scaleAnimation, child: _buildSuccessBadge()),
          const SizedBox(height: 32),
          const Text(
            'Thanh toán thành công!',
            style: TextStyle(
              fontSize: AppTextTheme.headlineLarge,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Cảm ơn bạn đã thanh toán hóa đơn',
            style: TextStyle(
              fontSize: AppTextTheme.bodyMedium,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          _buildAmountCard(),
          const SizedBox(height: 32),
          const Text(
            'Chúc bạn một hành trình tiếp theo\nthượng lộ bình an!',
            style: TextStyle(
              fontSize: AppTextTheme.bodySmall,
              color: AppColors.textHint,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessBadge() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.success.withValues(alpha: 0.15),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.success.withValues(alpha: 0.3),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 70,
          height: 70,
          decoration: const BoxDecoration(
            color: AppColors.success,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 40),
        ),
      ),
    );
  }

  Widget _buildAmountCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Số tiền đã thanh toán',
            style: TextStyle(
              fontSize: AppTextTheme.bodySmall,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _formatPrice(13050000),
            style: const TextStyle(
              fontSize: AppTextTheme.headlineLarge,
              fontWeight: FontWeight.w800,
              color: AppColors.success,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => context.pushReplacement(Routes.tourHome),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.buttonPrimaryText,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home_outlined, size: 20),
            SizedBox(width: 8),
            Text(
              'Quay về trang chủ',
              style: TextStyle(
                fontSize: AppTextTheme.buttonMedium,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
