import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'package:travery_frontend/data/seed_models/guide_tour/guide_tour.dart';
import 'package:travery_frontend/data/services/guide/guide_service.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/common/notification/view/widgets/notification_badge.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/guide/home/guide_home_view_model.dart';
import 'package:travery_frontend/ui/guide/home/widgets/guide_tour_card.dart';
import 'package:travery_frontend/ui/guide/home/widgets/guide_filter_chips.dart';
import 'package:travery_frontend/ui/guide/widgets/guide_bottom_nav_bar.dart';

class GuideHomeScreen extends StatefulWidget {
  final GuideHomeViewModel? viewModel;
  const GuideHomeScreen({super.key, this.viewModel});

  @override
  State<GuideHomeScreen> createState() => _GuideHomeScreenState();
}

class _GuideHomeScreenState extends State<GuideHomeScreen> {
  late GuideHomeViewModel _viewModel;
  int _currentNavIndex = 0;

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModel ??
        GuideHomeViewModel(guideService: context.read<GuideService>());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.fetchTours();
    });
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceBlue,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceBlue,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Chuyến đi của tôi',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          NotificationBadge(
            onTap: () => context.push(Routes.notifications),
            iconColor: AppColors.textPrimary,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListenableBuilder(
        listenable: _viewModel.loadTours,
        builder: (context, _) {
          return ListenableBuilder(
            listenable: _viewModel.filteredTours,
            builder: (context, _) {
              return _buildContent();
            },
          );
        },
      ),
      bottomNavigationBar: GuideBottomNavBar(
        currentIndex: _currentNavIndex,
        onTap: _onNavTap,
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        const SizedBox(height: 16),
        // Filter chips
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GuideFilterChips(
            selectedFilter: _viewModel.selectedFilter,
            onFilterChanged: (filter) {
              _viewModel.selectedFilter.value = filter;
            },
          ),
        ),
        const SizedBox(height: 16),
        // Tour list
        Expanded(child: _buildTourList()),
      ],
    );
  }

  Widget _buildTourList() {
    if (_viewModel.loadTours.running) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    if (_viewModel.loadTours.error) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: AppColors.error, size: 48),
            const SizedBox(height: 12),
            const Text(
              'Đã xảy ra lỗi khi tải dữ liệu',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: AppTextTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _viewModel.fetchTours,
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    final tours = _viewModel.filteredTours.value;

    if (tours.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              color: AppColors.textSecondary,
              size: 48,
            ),
            const SizedBox(height: 12),
            const Text(
              'Không có chuyến đi nào',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: AppTextTheme.bodyMedium,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: tours.length,
      itemBuilder: (context, index) {
        final tour = tours[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: GuideTourCard(
            tour: tour,
            onTap: () => _navigateToDetail(tour),
          ),
        );
      },
    );
  }

  void _navigateToDetail(GuideTour tour) {
    if (tour.tourInstanceId.isEmpty) return;
    context.push(Routes.missionDetail.replaceFirst(':id', tour.tourInstanceId));
  }

  void _onNavTap(int index) {
    setState(() {
      _currentNavIndex = index;
    });
    // Navigation handled by bottom nav
  }
}
