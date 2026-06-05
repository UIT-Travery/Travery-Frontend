import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/guide/coach_trip/coach_trip_status.dart';
import 'package:travery_frontend/ui/guide/coach_trip/detail/guide_coach_trip_detail_view_model.dart';
import 'package:travery_frontend/ui/guide/utils/guide_error_message.dart';
import 'package:travery_frontend/ui/guide/widgets/guide_progress_bottom_sheet.dart';

class GuideCoachTripDetailScreen extends StatefulWidget {
  const GuideCoachTripDetailScreen({super.key, required this.tripId});

  final String tripId;

  @override
  State<GuideCoachTripDetailScreen> createState() =>
      _GuideCoachTripDetailScreenState();
}

class _GuideCoachTripDetailScreenState
    extends State<GuideCoachTripDetailScreen> {
  late final GuideCoachTripDetailViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = GuideCoachTripDetailViewModel(
      missionService: context.read<GuideMissionService>(),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.loadTrip(widget.tripId);
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
      body: ListenableBuilder(
        listenable: _viewModel,
        builder: (context, _) {
          if (_viewModel.isLoading) {
            return Column(
              children: [
                _buildFallbackHeader(),
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                ),
              ],
            );
          }

          if (_viewModel.errorMessage != null) {
            return Column(
              children: [
                _buildFallbackHeader(),
                Expanded(
                  child: _StateMessage(
                    icon: Icons.error_outline,
                    title: 'Không tải được chuyến xe',
                    message: guideFriendlyErrorMessage(
                      _viewModel.errorMessage,
                      fallback:
                          'Không tải được thông tin chuyến xe. Vui lòng thử lại.',
                    ),
                    actionLabel: 'Thử lại',
                    onAction: () => _viewModel.loadTrip(widget.tripId),
                  ),
                ),
              ],
            );
          }

          final trip = _viewModel.trip;
          if (trip == null) {
            return Column(
              children: [
                _buildFallbackHeader(),
                const Expanded(
                  child: _StateMessage(
                    icon: Icons.directions_bus_outlined,
                    title: 'Không có dữ liệu',
                    message: 'Không tìm thấy thông tin chuyến xe.',
                  ),
                ),
              ],
            );
          }

          return _buildContent(trip);
        },
      ),
    );
  }

  Widget _buildHeader(CoachTripDetail trip) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        MediaQuery.of(context).padding.top + 8,
        16,
        16,
      ),
      color: AppColors.surface,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.primary),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Expanded(
            child: Text(
              'Chi tiết chuyến',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          _StatusPill(style: coachTripStatusStyle(trip.status)),
        ],
      ),
    );
  }

  Widget _buildFallbackHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        MediaQuery.of(context).padding.top + 8,
        16,
        16,
      ),
      color: AppColors.surface,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.primary),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const Expanded(
            child: Text(
              'Chi tiết chuyến',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(CoachTripDetail trip) {
    return Column(
      children: [
        _buildHeader(trip),
        Expanded(
          child: RefreshIndicator(
            color: AppColors.primary,
            onRefresh: () => _viewModel.loadTrip(widget.tripId),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildRouteCard(trip),
                  const SizedBox(height: 16),
                  _buildVehicleCard(trip),
                  const SizedBox(height: 16),
                  _buildPassengerSummary(trip),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
        _buildBottomActions(trip),
      ],
    );
  }

  Widget _buildRouteCard(CoachTripDetail trip) {
    return _SectionCard(
      title: 'Lộ trình',
      icon: Icons.route_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _RoutePoint(
                  label: trip.originDestinationName ?? 'Điểm đi',
                  time: _formatTime(trip.departureTime),
                  alignEnd: false,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.arrow_forward, color: AppColors.primary),
              ),
              Expanded(
                child: _RoutePoint(
                  label: trip.destinationDestinationName ?? 'Điểm đến',
                  time: _formatTime(trip.arrivalTime),
                  alignEnd: true,
                ),
              ),
            ],
          ),
          if (trip.departureTime != null) ...[
            const SizedBox(height: 12),
            _InfoLine(
              icon: Icons.calendar_today_outlined,
              text: DateFormat('dd/MM/yyyy').format(trip.departureTime!),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildVehicleCard(CoachTripDetail trip) {
    final vehicleText = [
      trip.coachLicensePlate,
      trip.coachType,
    ].where((e) => e != null && e.trim().isNotEmpty).join(' - ');

    return _SectionCard(
      title: 'Thông tin xe',
      icon: Icons.directions_bus_outlined,
      child: Column(
        children: [
          _InfoLine(
            icon: Icons.confirmation_number_outlined,
            text: vehicleText,
            fallback: 'Chưa có thông tin xe',
          ),
          const SizedBox(height: 10),
          _InfoLine(
            icon: Icons.person_outline,
            text: trip.driverName ?? '',
            fallback: 'Chưa có tài xế',
          ),
          if (trip.driverPhone != null && trip.driverPhone!.isNotEmpty) ...[
            const SizedBox(height: 10),
            _InfoLine(icon: Icons.phone_outlined, text: trip.driverPhone!),
          ],
        ],
      ),
    );
  }

  Widget _buildPassengerSummary(CoachTripDetail trip) {
    final seatText = trip.totalSeats > 0
        ? '${trip.bookingsCount} vé đã đặt / ${trip.totalSeats} tổng'
        : '${trip.bookingsCount} vé đã đặt';

    return _SectionCard(
      title: 'Hành khách',
      icon: Icons.groups_outlined,
      child: Column(
        children: [
          _InfoLine(icon: Icons.event_seat_outlined, text: seatText),
          const SizedBox(height: 10),
          _InfoLine(
            icon: Icons.how_to_reg_outlined,
            text: '${trip.passengersCount} hành khách',
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: trip.totalSeats > 0
                  ? trip.occupiedSeats / trip.totalSeats
                  : 0,
              minHeight: 7,
              backgroundColor: AppColors.surfaceGray,
              valueColor: const AlwaysStoppedAnimation(AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions(CoachTripDetail trip) {
    final isAttendanceEditable = _isAttendanceEditable(trip.status);
    final isProgressEditable = _isProgressEditable(trip.status);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: isAttendanceEditable
                    ? () => _navigateToPassengers(trip.id)
                    : null,
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Điểm danh'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  disabledForegroundColor: AppColors.textSecondary,
                  side: BorderSide(
                    color: isAttendanceEditable
                        ? AppColors.primary
                        : AppColors.surfaceGray,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: ElevatedButton.icon(
                onPressed: isProgressEditable
                    ? () => _showProgressBottomSheet(trip)
                    : null,
                icon: const Icon(Icons.update),
                label: Text(_progressButtonLabel(trip.status)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isProgressEditable
                      ? AppColors.primary
                      : AppColors.surfaceGray,
                  foregroundColor: isProgressEditable
                      ? Colors.white
                      : AppColors.textSecondary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isAttendanceEditable(String status) {
    final normalized = status.toUpperCase();
    return normalized != 'COMPLETED' && normalized != 'CANCELLED';
  }

  bool _isProgressEditable(String status) {
    final normalized = status.toUpperCase();
    return normalized != 'COMPLETED' && normalized != 'CANCELLED';
  }

  String _progressButtonLabel(String status) {
    final normalized = status.toUpperCase();
    if (normalized == 'COMPLETED') return 'Đã hoàn thành';
    if (normalized == 'CANCELLED') return 'Đã hủy';
    return 'Cập nhật tiến độ';
  }

  void _navigateToPassengers(String tripId) {
    context.push(Routes.guideCoachTripPassengers.replaceFirst(':id', tripId));
  }

  void _showProgressBottomSheet(CoachTripDetail trip) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => GuideProgressBottomSheet(
        missionId: trip.id,
        currentStatus: trip.status,
        onSubmitStatus: _viewModel.updateStatusResult,
        onStatusSelected: (_) {
          _viewModel.loadTrip(widget.tripId);
        },
      ),
    );
  }

  String _formatTime(DateTime? dateTime) {
    if (dateTime == null) return '--:--';
    return DateFormat('HH:mm').format(dateTime);
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  final String title;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
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
              Icon(icon, size: 18, color: AppColors.primary),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

class _RoutePoint extends StatelessWidget {
  const _RoutePoint({
    required this.label,
    required this.time,
    required this.alignEnd,
  });

  final String label;
  final String time;
  final bool alignEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignEnd
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: alignEnd ? TextAlign.end : TextAlign.start,
        ),
        const SizedBox(height: 4),
        Text(
          time,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _InfoLine extends StatelessWidget {
  const _InfoLine({required this.icon, required this.text, this.fallback = ''});

  final IconData icon;
  final String text;
  final String fallback;

  @override
  Widget build(BuildContext context) {
    final displayText = text.trim().isEmpty ? fallback : text;
    return Row(
      children: [
        Icon(icon, size: 17, color: AppColors.primary),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            displayText,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
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
                fontSize: AppTextTheme.bodySmall,
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
