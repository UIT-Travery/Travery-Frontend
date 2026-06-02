import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/guide/home/guide_home_view_model.dart';
import 'package:travery_frontend/ui/user/profile/view_model/profile_view_model.dart';
import 'package:travery_frontend/ui/guide/widgets/guide_tour_card.dart';

class GuideHomeScreen extends StatefulWidget {
  final GuideHomeViewModel viewModel;

  const GuideHomeScreen({super.key, required this.viewModel});

  @override
  State<GuideHomeScreen> createState() => _GuideHomeScreenState();
}

class _GuideHomeScreenState extends State<GuideHomeScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.viewModel.allTours.isEmpty && !widget.viewModel.isLoading) {
      widget.viewModel.loadGuideTours();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Consumer<GuideHomeViewModel>(
                builder: (context, vm, _) {
                  if (vm.isLoading && vm.allTours.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }

                  if (vm.errorMessage != null && vm.allTours.isEmpty) {
                    return _buildError(vm.errorMessage!);
                  }

                  return _buildBody(vm);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hướng dẫn viên',
                style: TextStyle(
                  fontSize: AppTextTheme.headlineSmall,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: AppColors.primary,
                  size: 22,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Consumer<ProfileViewModel>(
            builder: (context, profileVm, _) {
              final guideName = profileVm.profile?.fullName;
              return Text(
                guideName != null && guideName.isNotEmpty
                    ? 'Xin chào, $guideName'
                    : 'Xin chào, Hướng dẫn viên',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              );
            },
          ),
          const SizedBox(height: 4),
          Consumer<GuideHomeViewModel>(
            builder: (context, vm, _) {
              final inProgress = vm.inProgressCount;
              final inProgressTour = inProgress == 1
                  ? vm.inProgressTours.firstOrNull
                  : null;
              final text = inProgress == 0
                  ? 'Chưa có tour nào được phân công'
                  : (inProgress == 1
                        ? 'Tour đang diễn ra: ${inProgressTour?.tourName ?? ''}'
                        : 'Bạn có $inProgress tour trong tuần này');
              return Text(
                text,
                style: const TextStyle(
                  fontSize: AppTextTheme.bodyMedium,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
                maxLines: inProgress == 1 ? 2 : 1,
                overflow: TextOverflow.ellipsis,
              );
            },
          ),
          const SizedBox(height: 20),
          _buildTabBar(),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Consumer<GuideHomeViewModel>(
      builder: (context, vm, _) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF3F6FF),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              _buildTab('Hôm nay', 0, vm.selectedTabIndex, vm.todayCount),
              _buildTab('Sắp tới', 1, vm.selectedTabIndex, vm.upcomingCount),
              _buildTab(
                'Đang chạy',
                2,
                vm.selectedTabIndex,
                vm.inProgressCount,
              ),
              _buildTab('Tất cả', 3, vm.selectedTabIndex, vm.allTours.length),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTab(String label, int index, int selected, int count) {
    final isSelected = selected == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          final vm = context.read<GuideHomeViewModel>();
          vm.setSelectedTab(index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.surface : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                    ),
                  ]
                : null,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(GuideHomeViewModel vm) {
    final tours = vm.displayedTours;

    if (tours.isEmpty) {
      return _buildEmpty();
    }

    return RefreshIndicator(
      onRefresh: () => vm.loadGuideTours(),
      color: AppColors.primary,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
        itemCount: tours.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final tour = tours[index];
          return GuideTourCard(
            tour: tour,
            onTap: () {
              final missionId = tour.id ?? tour.tourInstanceId;
              if (tour.status.name == 'completed') {
                context.push('/guide/mission/$missionId/completed');
              } else {
                context.push('/guide/mission/$missionId');
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 64,
            color: AppColors.textSecondary.withValues(alpha: 0.4),
          ),
          const SizedBox(height: 16),
          const Text(
            'Không có tour nào',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: AppColors.error, size: 48),
          const SizedBox(height: 16),
          Text('Đã xảy ra lỗi', style: TextStyle(color: AppColors.textPrimary)),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              context.read<GuideHomeViewModel>().loadGuideTours();
            },
            child: const Text('Thử lại'),
          ),
        ],
      ),
    );
  }
}
