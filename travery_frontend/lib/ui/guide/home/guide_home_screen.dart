import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/guide/home/view_models/guide_home_view_model.dart';
import 'package:travery_frontend/ui/guide/home/widgets/guide_bottom_nav_bar.dart';
import 'package:travery_frontend/ui/guide/home/widgets/guide_custom_tab_bar.dart';
import 'package:travery_frontend/ui/guide/home/widgets/guide_tour_card.dart';

class GuideHomeScreen extends StatefulWidget {
  final GuideHomeViewModel viewModel;

  const GuideHomeScreen({super.key, required this.viewModel});

  @override
  State<GuideHomeScreen> createState() => _GuideHomeScreenState();
}

class _GuideHomeScreenState extends State<GuideHomeScreen> {
  int _selectedNavIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.loadGuideTours();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Builder(
        builder: (context) {
          final viewModel = widget.viewModel;
          return Stack(
            children: [
              SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(16, 40, 16, 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildWelcomeHeader(viewModel),
                            const SizedBox(height: 24),
                            _buildTabBar(viewModel),
                            const SizedBox(height: 16),
                            _buildTourList(viewModel),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: GuideBottomNavBar(
                  currentIndex: _selectedNavIndex,
                  onTap: (index) => setState(() => _selectedNavIndex = index),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildWelcomeHeader(GuideHomeViewModel viewModel) {
    final ongoingCount = viewModel.ongoingCount;
    String tourText = ongoingCount == 1 ? 'tour' : 'tours';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Xin chào, Guide!',
          style: TextStyle(
            fontSize: AppTextTheme.headlineSmall,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Bạn có $ongoingCount $tourText trong tuần này.',
          style: const TextStyle(
            fontSize: AppTextTheme.bodyMedium,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar(GuideHomeViewModel viewModel) {
    return GuideCustomTabBar(
      selectedIndex: viewModel.selectedTabIndex,
      onTabChanged: viewModel.setSelectedTab,
      ongoingCount: viewModel.ongoingCount,
      completedCount: viewModel.completedCount,
    );
  }

  Widget _buildTourList(GuideHomeViewModel viewModel) {
    if (viewModel.isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    }

    if (viewModel.errorMessage != null) {
      return Center(
        child: Column(
          children: [
            const Icon(Icons.error_outline, color: AppColors.error, size: 40),
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
              onPressed: viewModel.loadGuideTours,
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    final tours = viewModel.displayedTours;

    if (tours.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Icon(
                Icons.inbox_outlined,
                color: AppColors.textSecondary,
                size: 48,
              ),
              const SizedBox(height: 12),
              Text(
                'Không có tour nào',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: AppTextTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tours.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final tour = tours[index];
        return GuideTourCard(
          tour: tour,
          onTap: () {
            if (tour.status.name == 'completed') {
              context.push('/guide/mission/${tour.id}/completed');
            } else {
              context.push('/guide/mission/${tour.id}');
            }
          },
        );
      },
    );
  }
}
