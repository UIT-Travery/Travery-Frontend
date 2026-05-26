import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_tour_list_view_model.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_searchbar.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_filter_button.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_tour_card.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/utils/core_result.dart' as core_result;

class CoordinatorTourListScreen extends StatefulWidget {
  final CoordinatorTourListViewModel viewModel;

  const CoordinatorTourListScreen({super.key, required this.viewModel});

  @override
  State<CoordinatorTourListScreen> createState() =>
      _CoordinatorTourListScreenState();
}

class _CoordinatorTourListScreenState extends State<CoordinatorTourListScreen>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _searchController = TextEditingController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadTours.addListener(_onLoadToursChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.loadTours.execute();
    });
  }

  void _onLoadToursChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _searchController.dispose();
    widget.viewModel.loadTours.removeListener(_onLoadToursChanged);
    // ViewModel lifecycle is managed by CoordinatorMainScreen
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required by AutomaticKeepAliveClientMixin
    return ColoredBox(
      color: AppColors.background,
      child: ListenableBuilder(
        listenable: Listenable.merge([
          widget.viewModel.loadTours,
          widget.viewModel.filteredTours,
        ]),
        builder: (context, child) {
          final viewModel = widget.viewModel;
          return Column(
            children: [
              _buildHeader(context),
              const SizedBox(height: 16),
              _buildSearchAndFilterRow(context),
              const SizedBox(height: 8),
              Expanded(child: _buildTourList(viewModel)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24, statusBarHeight + 20, 24, 28),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDarkBlackBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chào mừng điều phối viên',
                  style: TextStyle(
                    fontSize: AppTextTheme.bodyMedium,
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Đỗ Minh Trí',
                  style: TextStyle(
                    fontSize: AppTextTheme.headlineSmall,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              context.push(Routes.coordinatorViewProfile);
            },
            icon: const Icon(Icons.settings_outlined, color: Colors.white, size: 28),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilterRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: CoordinatorSearchBar(
              title: 'Tìm kiếm',
              hint: 'Search',
              controller: _searchController,
              onSearchTap: () {
                widget.viewModel.searchQuery.value = _searchController.text;
              },
            ),
          ),
          const SizedBox(width: 12),
          CoordinatorFilterButton(
            onFilterTap: () {
              // Open filter dialog or perform sorting if needed
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTourList(CoordinatorTourListViewModel viewModel) {
    if (viewModel.loadTours.running) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    if (viewModel.loadTours.error) {
      final error = (viewModel.loadTours.result as core_result.Error).error;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: AppColors.error, size: 40),
            const SizedBox(height: 12),
            Text(
              'Đã xảy ra lỗi: $error',
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: AppTextTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => viewModel.loadTours.execute(),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    final tours = viewModel.filteredTours.value;

    if (tours.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              color: AppColors.textSecondary,
              size: 48,
            ),
            SizedBox(height: 12),
            Text(
              'Không tìm thấy tour nào',
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
      padding: const EdgeInsets.only(bottom: 100, top: 8),
      itemCount: tours.length,
      itemBuilder: (context, index) {
        final tour = tours[index];
        return CoordinatorTourCard(
          label: tour.tourName,
          status: _localizedStatus(tour.status),
          bookingnumber: tour.currentParticipants,
          maxParticipants: tour.maxParticipants,
          date: '${tour.startDate} → ${tour.endDate}',
          imageUrl: '',
          onTap: () {
            context.push(Routes.coordinatorTourDetail, extra: tour);
          },
        );
      },
    );
  }

  /// Converts API status strings to Vietnamese labels shown in the card.
  String _localizedStatus(String status) {
    switch (status.toUpperCase()) {
      case 'PLANNING':
        return 'ĐANG LẬP KẾ HOẠCH';
      case 'CONFIRMED':
        return 'ĐÃ XÁC NHẬN';
      case 'ONGOING':
        return 'ĐANG DIỄN RA';
      case 'COMPLETED':
        return 'ĐÃ HOÀN THÀNH';
      case 'CANCELLED':
        return 'ĐÃ HỦY';
      default:
        return status;
    }
  }
}
