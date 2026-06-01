import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/core/widgets/app_bar_widget.dart';
import 'package:travery_frontend/ui/guide/mission/view_models/mission_detail_view_model.dart';
import 'package:travery_frontend/ui/guide/mission/widgets/mission_tour_info_card.dart';
import 'package:travery_frontend/ui/guide/mission/widgets/mission_operations_card.dart';
import 'package:travery_frontend/ui/guide/mission/widgets/mission_action_buttons.dart';

class MissionDetailScreen extends StatefulWidget {
  final String missionId;
  final MissionDetailViewModel viewModel;

  const MissionDetailScreen({
    super.key,
    required this.missionId,
    required this.viewModel,
  });

  @override
  State<MissionDetailScreen> createState() => _MissionDetailScreenState();
}

class _MissionDetailScreenState extends State<MissionDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.loadMissionDetail(missionId: widget.missionId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBarWidget(title: 'Chi tiết Nhiệm vụ'),
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
                    onPressed: () {
                      viewModel.loadMissionDetail(missionId: widget.missionId);
                    },
                    child: const Text('Thử lại'),
                  ),
                ],
              ),
            );
          }

          final mission = viewModel.mission;
          if (mission == null) {
            return const Center(child: Text('Không tìm thấy nhiệm vụ'));
          }

          return RefreshIndicator(
            onRefresh: viewModel.refreshMission,
            color: AppColors.primary,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  MissionTourInfoCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1528127269322-539801943592?auto=format&fit=crop&q=80&w=800',
                    title: mission.tourName,
                    tourCode: viewModel.formattedTourCode,
                    departureDate: viewModel.formattedDepartureDate,
                  ),
                  const SizedBox(height: 12),
                  MissionActionButtons(
                    onCheckIn: () {
                      context.push(
                        '/guide/mission/${widget.missionId}/check-in',
                      );
                    },
                    onUpdateProgress: () {
                      context.push(
                        '/guide/mission/${widget.missionId}/progress',
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  MissionOperationsCard(
                    licensePlate: mission.vehiclePlate ?? 'Chưa có',
                    driverName: mission.driverName ?? 'Chưa có',
                    hotelName: mission.groupDescription,
                    onCallDriver: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Gọi tài xế: ${mission.driverName}'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
