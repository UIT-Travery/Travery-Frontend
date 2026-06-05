import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/repositories/coordinator/coordinator_repository.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_coach_trip_list_view_model.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_tour_template_list_view_model.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_coach_template_list_view_model.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_view_tour_template_list_screen.dart';
import 'package:travery_frontend/ui/coordinator/view/coordinator_view_coach_template_list_screen.dart';

class CoordinatorSelectionScreen extends StatefulWidget {
  const CoordinatorSelectionScreen({super.key});

  @override
  State<CoordinatorSelectionScreen> createState() =>
      _CoordinatorSelectionScreenState();
}

class _CoordinatorSelectionScreenState extends State<CoordinatorSelectionScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                const Text(
                  'Hôm nay bạn muốn\nthực hiện gì?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28, // Using a specific size for emphasis
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryDarkBlackBlue,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Lựa chọn tác vụ nhanh bên dưới để bắt\nđầu luồng điều phối của bạn.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppTextTheme.bodyLarge,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),

                // Tạo Tour Mới Button
                _buildSelectionCard(
                  context: context,
                  icon: Icons.travel_explore,
                  title: 'Tạo Tour Mới',
                  description:
                      'Thiết lập lộ trình, chọn điểm đến\nvà cấu hình dịch vụ cho một\nđoàn khách mới.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CoordinatorViewTourTemplateListScreen(
                              viewModel: CoordinatorTourTemplateListViewModel(
                                coordinatorRepository: context
                                    .read<CoordinatorRepository>(),
                              ),
                            ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 16),

                // Thiết lập Chuyến Xe Button
                _buildSelectionCard(
                  context: context,
                  icon: Icons.directions_bus,
                  title: 'Thiết lập Chuyến Xe',
                  description:
                      'Phân bổ phương tiện, điều phối\ntài xế và sắp xếp lịch trình vận\nchuyển trong ngày.',
                  onTap: () async {
                    final result = await Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CoordinatorViewCoachTemplateListScreen(
                              viewModel: CoordinatorCoachTemplateListViewModel(
                                coordinatorRepository: context
                                    .read<CoordinatorRepository>(),
                              ),
                            ),
                      ),
                    );

                    if (result == true && mounted) {
                      context
                          .read<CoordinatorCoachTripListViewModel>()
                          .loadCoachTrips
                          .execute(null);
                    }
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary, width: 2),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.1),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onTap,
          splashColor: AppColors.primary.withValues(alpha: 0.1),
          highlightColor: AppColors.primary.withValues(alpha: 0.05),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLightWhiteBlue.withValues(
                      alpha: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(icon, size: 40, color: AppColors.primary),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: AppTextTheme.bodyMedium,
                    color: AppColors.textSecondary,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
