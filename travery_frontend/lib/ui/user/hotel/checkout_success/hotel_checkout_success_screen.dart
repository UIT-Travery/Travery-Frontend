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

class _HotelCheckoutSuccessScreenState
    extends State<HotelCheckoutSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              _buildSuccessContent(),
              const Spacer(),
              _buildBottomButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCheckCircle(),
        const SizedBox(height: 24),
        const Text(
          'Check-out thành công!',
          style: TextStyle(
            fontSize: AppTextTheme.headlineMedium,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Cảm ơn bạn đã sử dụng dịch vụ. Chúc bạn một hành trình tiếp theo thượng lộ bình an!',
          style: TextStyle(
            fontSize: AppTextTheme.bodyMedium,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildCheckCircle() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.success.withValues(alpha: 0.15),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 56,
          height: 56,
          decoration: const BoxDecoration(
            color: AppColors.success,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 28),
        ),
      ],
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
          elevation: 0,
        ),
        child: const Text(
          'Quay về trang chủ',
          style: TextStyle(
            fontSize: AppTextTheme.buttonMedium,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
