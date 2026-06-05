import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_coach_trip_detail_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart' as core;
import 'package:travery_frontend/utils/alert.dart';
import 'package:intl/intl.dart';

class CoordinatorViewCoachScreen extends StatefulWidget {
  final String id;
  final CoordinatorCoachTripDetailViewModel viewModel;

  const CoordinatorViewCoachScreen({
    super.key,
    required this.id,
    required this.viewModel,
  });

  @override
  State<CoordinatorViewCoachScreen> createState() =>
      _CoordinatorViewCoachScreenState();
}

class _CoordinatorViewCoachScreenState
    extends State<CoordinatorViewCoachScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.loadCoachTripDetail.addListener(_onResult);
    widget.viewModel.loadCoachTripDetail.execute(widget.id);
  }

  @override
  void didUpdateWidget(covariant CoordinatorViewCoachScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.loadCoachTripDetail.removeListener(_onResult);
    widget.viewModel.loadCoachTripDetail.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.loadCoachTripDetail.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    if (widget.viewModel.loadCoachTripDetail.error) {
      final errorMessage =
          widget.viewModel.loadCoachTripDetail.errorMessage ??
          'Lỗi tải chi tiết chuyến xe';
      Utils.showErrorNotification(context, errorMessage);
      widget.viewModel.loadCoachTripDetail.clearResult();
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // ── Blue gradient AppBar ─────────────────────────────────────────
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16, statusBarHeight + 10, 16, 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.primaryDarkBlackBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const Text(
                  'Chi tiết chuyến xe',
                  style: TextStyle(
                    fontSize: AppTextTheme.headlineSmall,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // ── Scrollable body ───────────────────────────────────────────────
          Expanded(
            child: ListenableBuilder(
              listenable: widget.viewModel.loadCoachTripDetail,
              builder: (context, _) {
                if (widget.viewModel.loadCoachTripDetail.running) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                }

                final result = widget.viewModel.loadCoachTripDetail.result;
                if (result == null || result is core.Error) {
                  return const Center(child: Text('Không thể tải dữ liệu'));
                }

                final trip = (result as core.Ok).value;

                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        child: Column(
                          children: [
                            // Route card (departure + destination)
                            _buildInfoCard(
                              children: [
                                _buildRouteRow(
                                  from: trip.originDestinationName ?? 'Nơi đi',
                                  to:
                                      trip.destinationDestinationName ??
                                      'Nơi đến',
                                  licensePlate:
                                      trip.coachLicensePlate ?? 'Không rõ',
                                  coachType: trip.coachType ?? 'SEAT',
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),

                            // Time & price card
                            _buildInfoCard(
                              children: [
                                _buildTimeAndPriceRow(
                                  departureTime: trip.departureTime,
                                  arrivalTime: trip.arrivalTime,
                                  price: trip.basePrice ?? 0,
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),

                            // Driver and Guide card
                            _buildInfoCard(
                              children: [
                                _buildStaffRow(
                                  label: 'TÀI XẾ',
                                  icon: Icons.badge_outlined,
                                  name: trip.driverName ?? 'Chưa cập nhật',
                                  phone: trip.driverPhone ?? 'Không có',
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  child: Divider(color: AppColors.inputBorder),
                                ),
                                _buildStaffRow(
                                  label: 'HƯỚNG DẪN VIÊN',
                                  icon: Icons.support_agent_outlined,
                                  name: trip.guideName ?? 'Chưa cập nhật',
                                  phone: trip.guidePhone ?? 'Không có',
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
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
        children: children,
      ),
    );
  }

  Widget _buildRouteRow({
    required String from,
    required String to,
    required String licensePlate,
    required String coachType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Departure
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(
                  width: 14,
                  height: 14,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.circle_outlined,
                      size: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                Container(
                  width: 1.5,
                  height: 40,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ĐIỂM ĐI',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textSecondary,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    from,
                    style: const TextStyle(
                      fontSize: AppTextTheme.bodyLarge,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    'Biển số: $licensePlate',
                    style: const TextStyle(
                      fontSize: AppTextTheme.bodySmall,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Destination
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on_rounded,
              size: 14,
              color: AppColors.primary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ĐIỂM ĐẾN',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textSecondary,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    to,
                    style: const TextStyle(
                      fontSize: AppTextTheme.bodyLarge,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    'Loại xe: $coachType',
                    style: const TextStyle(
                      fontSize: AppTextTheme.bodySmall,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeAndPriceRow({
    required DateTime? departureTime,
    required DateTime? arrivalTime,
    required double price,
  }) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'vi_VN',
      symbol: '₫',
    );
    final timeFormatter = DateFormat('HH:mm dd/MM/yyyy');

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Giờ khởi hành:',
              style: TextStyle(
                fontSize: AppTextTheme.bodyLarge,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              departureTime != null
                  ? timeFormatter.format(departureTime)
                  : '--:--',
              style: const TextStyle(
                fontSize: AppTextTheme.bodyLarge,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Giờ đến:',
              style: TextStyle(
                fontSize: AppTextTheme.bodyLarge,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              arrivalTime != null ? timeFormatter.format(arrivalTime) : '--:--',
              style: const TextStyle(
                fontSize: AppTextTheme.bodyLarge,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const Divider(height: 24, color: AppColors.inputBorder),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Giá vé:',
              style: TextStyle(
                fontSize: AppTextTheme.bodyLarge,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              currencyFormatter.format(price),
              style: const TextStyle(
                fontSize: AppTextTheme.bodyLarge,
                fontWeight: FontWeight.bold,
                color: AppColors.error,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStaffRow({
    required String label,
    required IconData icon,
    required String name,
    required String phone,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: AppColors.textSecondary),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppColors.textSecondary,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            // Avatar
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: AppColors.primaryLightWhiteBlue,
                shape: BoxShape.circle,
              ),
              child: ClipOval(child: _buildInitials(name)),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: AppTextTheme.bodyLarge,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  phone,
                  style: const TextStyle(
                    fontSize: AppTextTheme.bodyMedium,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInitials(String name) {
    if (name.trim().isEmpty) {
      return const Center(
        child: Icon(Icons.person, color: AppColors.primaryDarkBlackBlue),
      );
    }
    final initials = name
        .split(' ')
        .where((w) => w.isNotEmpty)
        .map((w) => w[0].toUpperCase())
        .take(2)
        .join();
    return Center(
      child: Text(
        initials,
        style: const TextStyle(
          color: AppColors.primaryDarkBlackBlue,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
