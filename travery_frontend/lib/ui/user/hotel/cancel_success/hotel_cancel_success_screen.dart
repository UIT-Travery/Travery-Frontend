import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/widgets/user_result_screen.dart';

class HotelCancelSuccessScreen extends StatelessWidget {
  const HotelCancelSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final refundAmount = (extra?['refundAmount'] as num?)?.toDouble() ?? 0;
    final refundPercentage =
        (extra?['refundPercentage'] as num?)?.toDouble() ?? 0;

    return UserResultScreen(
      status: UserResultStatus.success,
      appBarTitle: 'Hủy booking',
      title: 'Hủy phòng thành công',
      message: 'Yêu cầu hủy phòng của bạn đã được xác nhận.',
      summaryTitle: 'Thông tin hoàn tiền',
      summaryIcon: Icons.account_balance_wallet_outlined,
      details: [
        UserResultDetail(
          label: 'Số tiền hoàn',
          value: formatUserResultPrice(refundAmount),
          highlighted: true,
          valueColor: AppColors.success,
        ),
        UserResultDetail(
          label: 'Tỷ lệ hoàn',
          value: '${refundPercentage.toInt()}%',
        ),
        const UserResultDetail(
          label: 'Thời gian xử lý',
          value: '3-5 ngày làm việc',
        ),
      ],
      actions: [
        UserResultAction.primary(
          label: 'Về trang chủ',
          icon: Icons.home_outlined,
          onPressed: () => context.go(Routes.home),
        ),
      ],
      onClose: () => context.go(Routes.home),
    );
  }
}
