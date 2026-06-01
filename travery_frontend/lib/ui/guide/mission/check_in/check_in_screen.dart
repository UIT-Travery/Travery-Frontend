import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/guide/mission/check_in/view_models/check_in_view_model.dart';
import 'package:travery_frontend/ui/guide/mission/check_in/widgets/check_in_stats_card.dart';
import 'package:travery_frontend/ui/guide/mission/check_in/widgets/check_in_search_bar.dart';
import 'package:travery_frontend/ui/guide/mission/check_in/widgets/check_in_passenger_card.dart';
import 'package:travery_frontend/ui/guide/mission/check_in/widgets/check_in_bottom_bar.dart';

import '../../../core/widgets/app_bar_widget.dart';

class CheckInScreen extends StatefulWidget {
  final String missionId;
  final CheckInViewModel viewModel;

  const CheckInScreen({
    super.key,
    required this.missionId,
    required this.viewModel,
  });

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.loadPassengers(widget.missionId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBarWidget(title: 'Điểm danh đoàn'),
      body: Builder(
        builder: (context) {
          final viewModel = widget.viewModel;
          if (viewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (viewModel.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: AppColors.error,
                    size: 40,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Đã xảy ra lỗi',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: AppTextTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () => viewModel.loadPassengers(widget.missionId),
                    child: const Text('Thử lại'),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: viewModel.refreshPassengers,
                  color: AppColors.primary,
                  child: ListView(
                    padding: const EdgeInsets.all(12),
                    children: [
                      CheckInStatsCard(
                        current: viewModel.arrivedCount,
                        total: viewModel.totalCount,
                        progress: viewModel.progress,
                      ),
                      const SizedBox(height: 12),
                      CheckInSearchBar(onChanged: viewModel.setSearchQuery),
                      const SizedBox(height: 12),
                      ...viewModel.passengers.map(
                        (passenger) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: CheckInPassengerCard(
                            passenger: passenger,
                            isLocked: viewModel.isCompleted,
                            onToggleStatus: () {
                              viewModel.togglePassengerStatus(passenger.id);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
              if (!viewModel.isCompleted)
                CheckInBottomBar(
                  arrivedCount: viewModel.arrivedCount,
                  totalCount: viewModel.totalCount,
                  isSubmitting: viewModel.isSubmitting,
                  onComplete: () async {
                    final success = await viewModel.completeCheckIn();
                    if (success && mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Hoàn tất điểm danh thành công'),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: AppColors.success,
                        ),
                      );
                      Navigator.of(context).pop();
                    }
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
