import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/guide/coach_trip/passengers/guide_coach_trip_passengers_view_model.dart';
import 'package:travery_frontend/ui/guide/widgets/guide_attendance_status_picker.dart';

class GuideCoachTripPassengersScreen extends StatefulWidget {
  const GuideCoachTripPassengersScreen({super.key, required this.tripId});

  final String tripId;

  @override
  State<GuideCoachTripPassengersScreen> createState() =>
      _GuideCoachTripPassengersScreenState();
}

class _GuideCoachTripPassengersScreenState
    extends State<GuideCoachTripPassengersScreen> {
  late final GuideCoachTripPassengersViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = GuideCoachTripPassengersViewModel(
      missionService: context.read<GuideMissionService>(),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.load(widget.tripId);
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
          return Column(
            children: [
              _buildHeader(),
              Expanded(child: _buildBody()),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: AppColors.surface,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 6, 12, 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.primary,
                      size: 20,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 36,
                      minHeight: 36,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Expanded(
                    child: Text(
                      'Điểm danh',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Text(
                    '${_viewModel.checkedInCount}/${_viewModel.totalCount}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            LinearProgressIndicator(
              value: _viewModel.totalCount > 0
                  ? _viewModel.checkedInCount / _viewModel.totalCount
                  : 0,
              backgroundColor: AppColors.surfaceGray,
              valueColor: const AlwaysStoppedAnimation(AppColors.primary),
              minHeight: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_viewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    if (_viewModel.errorMessage != null) {
      return _buildErrorState();
    }

    if (_viewModel.bookings.isEmpty) {
      return _buildEmptyMemberList();
    }

    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: () => _viewModel.load(widget.tripId),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: _viewModel.bookings.length,
        itemBuilder: (context, index) {
          final booking = _viewModel.bookings[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _CoachPassengerAttendanceTile(
              booking: booking,
              isEditable:
                  _viewModel.isTripEditable &&
                  booking.canCheckIn &&
                  !_viewModel.isActing,
              onStatusChanged: (status) => _handleStatusChange(booking, status),
            ),
          );
        },
      ),
    );
  }

  Future<void> _handleStatusChange(
    CoachTripBooking booking,
    String status,
  ) async {
    if (status == booking.normalizedStatus ||
        !booking.canCheckIn ||
        !_viewModel.isTripEditable) {
      return;
    }

    if (status == 'CHECKED_IN') {
      await _confirmBookingAction(booking, isCheckIn: true);
    } else if (status == 'NO_SHOW') {
      await _confirmBookingAction(booking, isCheckIn: false);
    }
  }

  Future<void> _confirmBookingAction(
    CoachTripBooking booking, {
    required bool isCheckIn,
  }) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          isCheckIn ? 'Check-in ${booking.contactName}?' : 'Đánh dấu vắng mặt?',
        ),
        content: Text(
          isCheckIn
              ? 'Xác nhận hành khách đã lên xe?\nGhế: ${_seatText(booking)}'
              : 'Xác nhận ${booking.contactName} không lên xe?\nGhế: ${_seatText(booking)}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(isCheckIn ? 'Xác nhận check-in' : 'Xác nhận vắng mặt'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    final success = isCheckIn
        ? await _viewModel.checkIn(widget.tripId, booking.bookingId)
        : await _viewModel.noShow(widget.tripId, booking.bookingId);
    if (!mounted) return;

    final messenger = ScaffoldMessenger.of(context);
    if (success) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(isCheckIn ? 'Đã check-in' : 'Đã đánh dấu vắng mặt'),
          backgroundColor: AppColors.success,
        ),
      );
    } else {
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            _cleanError(_viewModel.actionError ?? 'Thao tác thất bại'),
          ),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  Widget _buildEmptyMemberList() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_outline, color: AppColors.textSecondary, size: 48),
          SizedBox(height: 12),
          Text(
            'Chưa có hành khách nào',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: AppTextTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: AppColors.error, size: 48),
          const SizedBox(height: 12),
          Text(
            _cleanError(_viewModel.errorMessage ?? 'Đã xảy ra lỗi'),
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: AppTextTheme.bodyMedium,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => _viewModel.load(widget.tripId),
            child: const Text('Thử lại'),
          ),
        ],
      ),
    );
  }

  String _seatText(CoachTripBooking booking) {
    return booking.seatNames.isEmpty
        ? '${booking.seatCount} ghế'
        : booking.seatNames.join(', ');
  }

  String _cleanError(String message) {
    return message.replaceFirst('HttpException: ', '');
  }
}

class _CoachPassengerAttendanceTile extends StatelessWidget {
  const _CoachPassengerAttendanceTile({
    required this.booking,
    required this.isEditable,
    required this.onStatusChanged,
  });

  final CoachTripBooking booking;
  final bool isEditable;
  final ValueChanged<String> onStatusChanged;

  Color get _borderColor {
    switch (booking.normalizedStatus) {
      case 'CHECKED_IN':
        return const Color(0xFF22c55e);
      case 'NO_SHOW':
      case 'CANCELLED':
        return const Color(0xFFef4444);
      default:
        return AppColors.icon;
    }
  }

  @override
  Widget build(BuildContext context) {
    final seatText = booking.seatNames.isEmpty
        ? '${booking.seatCount} ghế'
        : booking.seatNames.join(', ');

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(width: 3, color: _borderColor),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          color: AppColors.primary,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              booking.contactName.isEmpty
                                  ? 'Hành khách'
                                  : booking.contactName,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                const Icon(
                                  Icons.event_seat_outlined,
                                  size: 12,
                                  color: AppColors.textSecondary,
                                ),
                                const SizedBox(width: 3),
                                Flexible(
                                  child: Text(
                                    seatText,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: AppColors.textSecondary,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 6),
                      SizedBox(
                        width: 96,
                        child: GuideAttendanceStatusPicker(
                          value: booking.normalizedStatus,
                          onChanged: isEditable ? onStatusChanged : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
