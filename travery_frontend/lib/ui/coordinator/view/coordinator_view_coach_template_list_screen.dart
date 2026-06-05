import 'package:flutter/material.dart';
import 'package:travery_frontend/data/services/api/model/coordinator/coach_route_response/coach_route_response.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_coach_template_list_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart' as core_result;
import 'package:travery_frontend/utils/alert.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';

class CoordinatorViewCoachTemplateListScreen extends StatefulWidget {
  final CoordinatorCoachTemplateListViewModel viewModel;

  const CoordinatorViewCoachTemplateListScreen({
    super.key,
    required this.viewModel,
  });

  @override
  State<CoordinatorViewCoachTemplateListScreen> createState() =>
      _CoordinatorViewCoachTemplateListScreenState();
}

class _CoordinatorViewCoachTemplateListScreenState
    extends State<CoordinatorViewCoachTemplateListScreen> {
  final TextEditingController _searchController = TextEditingController();
  final NumberFormat _currencyFormat = NumberFormat.currency(
    locale: 'vi_VN',
    symbol: 'VND',
  );

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadRoutes.addListener(_onResult);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.loadRoutes.execute();
    });
  }

  @override
  void didUpdateWidget(
    covariant CoordinatorViewCoachTemplateListScreen oldWidget,
  ) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.loadRoutes.removeListener(_onResult);
      oldWidget.viewModel.dispose();
      widget.viewModel.loadRoutes.addListener(_onResult);
      widget.viewModel.loadRoutes.execute();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    widget.viewModel.loadRoutes.removeListener(_onResult);
    widget.viewModel.dispose();
    super.dispose();
  }

  void _onResult() {
    if (widget.viewModel.loadRoutes.error) {
      final result = widget.viewModel.loadRoutes.result;
      String errorMessage = 'Không thể tải danh sách routes';
      if (result != null && result is core_result.Error) {
        errorMessage = (result as core_result.Error).error
            .toString()
            .replaceAll('HttpException: ', '');
      }
      // widget.viewModel.loadTours.clearResult();
      Utils.showErrorNotification(context, errorMessage);
    }
  }

  Future<void> _onCreateNew() async {
    await context.push(Routes.coordinatorCreateCoachTemplate);
    if (!mounted) return;
    widget.viewModel.loadRoutes.execute();
  }

  void _onSelect(CoachRouteResponse route) {
    context.push(Routes.coordinatorCreateCoach, extra: route);
  }

  String _formatHours(double hours) {
    final int h = hours.floor();
    final int m = ((hours - h) * 60).round();
    if (m == 0) return '${h}H';
    return '${h}H ${m}M';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8.0),
              // Back Button
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.textPrimary,
                  size: 28,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 16.0),
              // Title and "+ Tạo lộ trình" Button Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Chọn lộ trình',
                          style: TextStyle(
                            fontSize: AppTextTheme.headlineLarge,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        const Text(
                          'Chọn lộ trình để tiếp tục tạo chuyến xe',
                          style: TextStyle(
                            fontSize: AppTextTheme.bodyMedium,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  // Create route button
                  Material(
                    color: AppColors.primaryDarkBlackBlue,
                    borderRadius: BorderRadius.circular(8.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: _onCreateNew,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add, color: Colors.white, size: 16),
                            SizedBox(width: 4.0),
                            Text(
                              'Tạo lộ trình',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: AppTextTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              // Search Bar
              _buildSearchBar(),
              const SizedBox(height: 16.0),
              // List of Templates
              Expanded(
                child: ListenableBuilder(
                  listenable: Listenable.merge([widget.viewModel.loadRoutes, _searchController]),
                  builder: (context, child) {
                    final viewModel = widget.viewModel;
                    if (viewModel.loadRoutes.running) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (viewModel.loadRoutes.error) {
                      return const Center(
                        child: Text(
                          'Không thể tải dữ liệu lộ trình',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    }

                    var routes = viewModel.loadRoutes.completed
                        ? (viewModel.loadRoutes.result
                                  as core_result.Ok<List<CoachRouteResponse>>)
                              .value
                        : <CoachRouteResponse>[];

                    final query = _searchController.text.trim().toLowerCase();
                    if (query.isNotEmpty) {
                      routes = routes.where((route) {
                        return route.originDestinationName.toLowerCase().contains(query) ||
                               route.destinationDestinationName.toLowerCase().contains(query);
                      }).toList();
                    }

                    if (routes.isEmpty && viewModel.loadRoutes.completed) {
                      return const Center(child: Text('Không có dữ liệu'));
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      physics: const BouncingScrollPhysics(),
                      itemCount: routes.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final route = routes[index];
                        return _buildRouteCard(route);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(
          0xFFF3F4FB,
        ), // Light grey/blue color matching the mockup
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
        controller: _searchController,
        style: const TextStyle(
          fontSize: AppTextTheme.bodyMedium,
          color: AppColors.textPrimary,
        ),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search, color: AppColors.textSecondary),
          hintText: 'Tìm kiếm lộ trình...',
          hintStyle: TextStyle(
            color: AppColors.textHint,
            fontSize: AppTextTheme.bodyMedium,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14.0),
        ),
      ),
    );
  }

  Widget _buildRouteCard(CoachRouteResponse route) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left blue accent line
            Container(
              width: 4,
              decoration: const BoxDecoration(
                color: AppColors.primaryDarkBlackBlue,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(12),
                ),
              ),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Top row: Location and Details
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Timeline dots
                        Column(
                          children: [
                            const SizedBox(height: 4),
                            Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              width: 2,
                              height: 24,
                              color: AppColors.primaryLightWhiteBlue,
                            ),
                            Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),

                        // Location names
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                route.originDestinationName,
                                style: const TextStyle(
                                  fontSize: AppTextTheme.bodyLarge,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                route.destinationDestinationName,
                                style: const TextStyle(
                                  fontSize: AppTextTheme.bodyLarge,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Price
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryLightWhiteBlue.withOpacity(
                              0.5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _currencyFormat.format(route.basePrice),
                            style: const TextStyle(
                              color: AppColors.primaryDarkBlackBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: AppTextTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Bottom row: Stats and Button
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLightWhiteBlue.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.route_outlined,
                            size: 16,
                            color: AppColors.textSecondary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${route.distanceKm.toStringAsFixed(0)} KM',
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: AppTextTheme.bodySmall,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Icon(
                            Icons.access_time,
                            size: 16,
                            color: AppColors.textSecondary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _formatHours(route.estimatedHours),
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: AppTextTheme.bodySmall,
                            ),
                          ),
                          const Spacer(),

                          // Choose button
                          Material(
                            color: AppColors.primaryDarkBlackBlue,
                            borderRadius: BorderRadius.circular(6),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(6),
                              onTap: () => _onSelect(route),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                child: Text(
                                  'CHỌN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: AppTextTheme.bodySmall,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
