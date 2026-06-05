import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_filter_button.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_searchbar.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_coach_trip_list_view_model.dart';
import 'package:travery_frontend/data/services/api/model/coordinator/coach_trip_response/coach_trip_response.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/utils/core_result.dart' as core;
import 'package:travery_frontend/utils/alert.dart';
import 'package:intl/intl.dart';

class CoordinatorViewCoachListScreen extends StatefulWidget {
  const CoordinatorViewCoachListScreen({super.key, required this.viewModel});

  final CoordinatorCoachTripListViewModel viewModel;

  @override
  State<CoordinatorViewCoachListScreen> createState() =>
      _CoordinatorViewCoachListScreenState();
}

class _CoordinatorViewCoachListScreenState
    extends State<CoordinatorViewCoachListScreen>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadCoachTrips.addListener(_onResult);
    // Initial fetch
    widget.viewModel.loadCoachTrips.execute(null);
  }

  @override
  void didUpdateWidget(covariant CoordinatorViewCoachListScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.loadCoachTrips.removeListener(_onResult);
    widget.viewModel.loadCoachTrips.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.loadCoachTrips.removeListener(_onResult);
    _searchController.dispose();
    super.dispose();
  }

  void _onResult() {
    if (widget.viewModel.loadCoachTrips.error) {
      final errorMessage =
          widget.viewModel.loadCoachTrips.errorMessage ??
          'Lỗi tải danh sách chuyến xe';
      Utils.showErrorNotification(context, errorMessage);
      widget.viewModel.loadCoachTrips.clearResult();
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 16),
          _buildSearchAndFilter(),
          const SizedBox(height: 12),
          Expanded(child: _buildList()),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, statusBarHeight + 16, 16, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDarkBlackBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            'Danh sách chuyến xe',
            style: TextStyle(
              fontSize: AppTextTheme.headlineSmall,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: CoordinatorSearchBar(
              title: 'Tìm kiếm',
              hint: 'Search',
              controller: _searchController,
              onSearchTap: () {}, // Stub
            ),
          ),
          // const SizedBox(width: 12),
          // CoordinatorFilterButton(
          //   onFilterTap: () {
          //     // TODO: open filter dialog
          //   },
          // ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return ListenableBuilder(
      listenable: widget.viewModel.loadCoachTrips,
      builder: (context, _) {
        if (widget.viewModel.loadCoachTrips.running) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        }

        final result = widget.viewModel.loadCoachTrips.result;
        List<CoachTripResponse> trips = [];
        if (result is core.Ok<List<CoachTripResponse>>) {
          trips = result.value;
        }

        if (trips.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.directions_bus_outlined,
                  color: AppColors.textSecondary,
                  size: 56,
                ),
                SizedBox(height: 16),
                Text(
                  'Không có chuyến xe nào',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: AppTextTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => widget.viewModel.loadCoachTrips.execute(null),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: trips.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final trip = trips[index];
              return InkWell(
                onTap: () {
                  if (trip.id != null) {
                    context.push(Routes.coordinatorViewCoach, extra: trip.id);
                  }
                },
                borderRadius: BorderRadius.circular(16),
                child: CoordinatorCoachTripCard(trip: trip),
              );
            },
          ),
        );
      },
    );
  }
}

class CoordinatorCoachTripCard extends StatelessWidget {
  const CoordinatorCoachTripCard({super.key, required this.trip});

  final CoachTripResponse trip;

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: '₫',
    );
    final timeFormatter = DateFormat('HH:mm dd/MM');

    final depTime = trip.departureTime != null
        ? timeFormatter.format(trip.departureTime!)
        : '--:--';
    final arrTime = trip.arrivalTime != null
        ? timeFormatter.format(trip.arrivalTime!)
        : '--:--';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${trip.originDestination?.name ?? 'Chưa rõ'} - ${trip.destinationDestination?.name ?? 'Chưa rõ'}',
                    style: const TextStyle(
                      fontSize: AppTextTheme.headlineMedium,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    trip.status ?? 'OPEN',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: AppTextTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 16,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Khởi hành: $depTime',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: AppTextTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 16,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Đến: $arrTime',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: AppTextTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(color: AppColors.textSecondary),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ghế trống',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: AppTextTheme.labelMedium,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${trip.availableSeats ?? 0}/${trip.totalSeats ?? 0}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppTextTheme.headlineSmall,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Giá vé',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: AppTextTheme.labelMedium,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      currencyFormatter.format(trip.basePrice ?? 0),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppTextTheme.headlineSmall,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
