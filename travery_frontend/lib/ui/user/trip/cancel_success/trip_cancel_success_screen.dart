import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/data/models/trip/cancel_trip_data.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/widgets/user_result_screen.dart';

class TripCancelSuccessScreen extends StatelessWidget {
  const TripCancelSuccessScreen({super.key, this.cancelData, this.booking});

  final dynamic cancelData;
  final dynamic booking;

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final data =
        cancelData as CancelTripData? ??
        extra?['cancelData'] as CancelTripData?;

    return UserResultScreen(
      status: UserResultStatus.success,
      appBarTitle: 'Hủy booking',
      title: 'Hủy vé thành công',
      message: 'Yêu cầu hủy vé của bạn đã được xử lý thành công.',
      summaryTitle: 'Thông tin hoàn tiền',
      summaryIcon: Icons.account_balance_wallet_outlined,
      details: [
        UserResultDetail(
          label: 'Số tiền hoàn',
          value: formatUserResultPrice(data?.refundAmount ?? 0),
          highlighted: true,
          valueColor: AppColors.success,
        ),
        UserResultDetail(
          label: 'Tỷ lệ hoàn',
          value: '${(data?.refundPercentage ?? 0).toInt()}%',
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
