import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/guide/coach_trip/coach_trip_status.dart';
import 'package:travery_frontend/ui/guide/coach_trip/list/guide_coach_trip_list_view_model.dart';
import 'package:travery_frontend/ui/guide/utils/guide_error_message.dart';
import 'package:travery_frontend/ui/guide/widgets/guide_bottom_nav_bar.dart';

class GuideCoachTripListScreen extends StatefulWidget {
  const GuideCoachTripListScreen({super.key});

  @override
  State<GuideCoachTripListScreen> createState() =>
      _GuideCoachTripListScreenState();
}

class _GuideCoachTripListScreenState extends State<GuideCoachTripListScreen> {
  late final GuideCoachTripListViewModel _viewModel;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _viewModel = GuideCoachTripListViewModel(
      missionService: context.read<GuideMissionService>(),
    );
    _scrollController = ScrollController()..addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.loadInitial();
    });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _viewModel.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 240) {
      _viewModel.loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceBlue,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceBlue,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Chuyến xe của tôi',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListenableBuilder(
        listenable: _viewModel,
        builder: (context, _) => _buildBody(),
      ),
      bottomNavigationBar: GuideBottomNavBar(currentIndex: 1, onTap: _onNavTap),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        const SizedBox(height: 12),
        _buildFilters(),
        const SizedBox(height: 12),
        Expanded(child: _buildTripList()),
      ],
    );
  }

  Widget _buildFilters() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: GuideCoachTripFilter.values.map((filter) {
          final isSelected = _viewModel.filter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              selected: isSelected,
              label: Text(filter.label),
              onSelected: (_) => _viewModel.setFilter(filter),
              selectedColor: AppColors.primary,
              backgroundColor: AppColors.surface,
              labelStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : AppColors.textSecondary,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTripList() {
    if (_viewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    if (_viewModel.errorMessage != null && _viewModel.trips.isEmpty) {
      return _StateMessage(
        icon: Icons.error_outline,
        title: 'Không tải được chuyến xe',
        message: guideFriendlyErrorMessage(
          _viewModel.errorMessage,
          fallback: 'Không tải được danh sách chuyến xe. Vui lòng thử lại.',
        ),
        actionLabel: 'Thử lại',
        onAction: _viewModel.loadInitial,
      );
    }

    if (_viewModel.trips.isEmpty) {
      return const _StateMessage(
        icon: Icons.directions_bus_outlined,
        title: 'Chưa có chuyến xe',
        message: 'Các chuyến được phân công sẽ hiển thị tại đây.',
      );
    }

    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: _viewModel.loadInitial,
      child: ListView.builder(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
        itemCount: _viewModel.trips.length + (_viewModel.isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= _viewModel.trips.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            );
          }
          final trip = _viewModel.trips[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _CoachTripCard(
              trip: trip,
              onTap: () => context.push(
                Routes.guideCoachTripDetail.replaceFirst(':id', trip.id),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onNavTap(int index) {
    if (index == 0) {
      context.go(Routes.guideHome);
    } else if (index == 2) {
      context.push(Routes.userProfile);
    }
  }
}

class _CoachTripCard extends StatelessWidget {
  const _CoachTripCard({required this.trip, required this.onTap});

  final CoachTripSummary trip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final status = coachTripStatusStyle(trip.status);
    final departure = trip.departureTime == null
        ? 'Chưa có giờ chạy'
        : DateFormat('dd/MM/yyyy HH:mm').format(trip.departureTime!);
    final totalSeats = trip.totalSeats > 0 ? trip.totalSeats : 0;
    final availableSeats = trip.availableSeats;

    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border(left: BorderSide(color: status.textColor, width: 4)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.directions_bus_outlined,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      trip.routeName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: AppColors.icon),
                ],
              ),
              const SizedBox(height: 12),
              _InfoLine(icon: Icons.schedule_outlined, text: departure),
              const SizedBox(height: 8),
              Row(
                children: [
                  _StatusPill(style: status),
                  if (totalSeats > 0) ...[
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        '$availableSeats/$totalSeats ghế trống',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoLine extends StatelessWidget {
  const _InfoLine({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 15, color: AppColors.primary),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.style});

  final CoachTripStatusStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(style.icon, size: 14, color: style.textColor),
          const SizedBox(width: 5),
          Text(
            style.label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: style.textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _StateMessage extends StatelessWidget {
  const _StateMessage({
    required this.icon,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onAction,
  });

  final IconData icon;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.textSecondary, size: 48),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              message,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 14),
              ElevatedButton(onPressed: onAction, child: Text(actionLabel!)),
            ],
          ],
        ),
      ),
    );
  }
}
