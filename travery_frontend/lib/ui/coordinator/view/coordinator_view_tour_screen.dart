import 'package:flutter/material.dart';
import 'package:travery_frontend/domain/models/coordinator/coordinator_tour/coordinator_tour.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/coordinator/view/widgets/coordinator_tour_info_field.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_tour_detail_view_model.dart';
import 'package:travery_frontend/utils/alert.dart';
import 'package:travery_frontend/utils/core_result.dart' as core_result;

class CoordinatorViewTourScreen extends StatefulWidget {
  final CoordinatorTour tour;
  final CoordinatorTourDetailViewModel viewModel;

  const CoordinatorViewTourScreen({
    super.key,
    required this.tour,
    required this.viewModel,
  });

  @override
  State<CoordinatorViewTourScreen> createState() =>
      _CoordinatorViewTourScreenState();
}

class _CoordinatorViewTourScreenState extends State<CoordinatorViewTourScreen> {
  bool _isDetailsExpanded = false;
  bool _isBookingsExpanded = false;
  bool _isItineraryExpanded = false;

  /// The live instance detail (refreshed from API after mutations)
  CoordinatorTour get _tour =>
      widget.viewModel.loadTourDetail.completed &&
              widget.viewModel.loadTourDetail.result is core_result.Ok
          ? (widget.viewModel.loadTourDetail.result
                  as core_result.Ok<CoordinatorTour>)
              .value
          : widget.tour;

  // ── Lifecycle ──────────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadTourDetail.addListener(_onResult);
    widget.viewModel.updateInstance.addListener(_onResult);
    widget.viewModel.updateStatus.addListener(_onStatusResult);
    widget.viewModel.deleteInstance.addListener(_onDeleteResult);

    // Fetch fresh detail from coordinator-tour-instance-controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.loadTourDetail.execute(widget.tour.id);
    });
  }

  @override
  void didUpdateWidget(covariant CoordinatorViewTourScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.loadTourDetail.removeListener(_onResult);
    oldWidget.viewModel.updateInstance.removeListener(_onResult);
    oldWidget.viewModel.updateStatus.removeListener(_onStatusResult);
    oldWidget.viewModel.deleteInstance.removeListener(_onDeleteResult);

    widget.viewModel.loadTourDetail.addListener(_onResult);
    widget.viewModel.updateInstance.addListener(_onResult);
    widget.viewModel.updateStatus.addListener(_onStatusResult);
    widget.viewModel.deleteInstance.addListener(_onDeleteResult);
  }

  @override
  void dispose() {
    widget.viewModel.loadTourDetail.removeListener(_onResult);
    widget.viewModel.updateInstance.removeListener(_onResult);
    widget.viewModel.updateStatus.removeListener(_onStatusResult);
    widget.viewModel.deleteInstance.removeListener(_onDeleteResult);
    super.dispose();
  }

  void _onResult() {
    if (!mounted) return;
    if (widget.viewModel.loadTourDetail.error) {
      final result = widget.viewModel.loadTourDetail.result;
      String msg = 'Không thể tải chi tiết tour';
      if (result != null && result is core_result.Error) {
        msg = (result as core_result.Error).error
            .toString()
            .replaceAll('HttpException: ', '');
      }
      widget.viewModel.loadTourDetail.clearResult();
      Utils.showErrorNotification(context, msg);
    }
    if (widget.viewModel.updateInstance.error) {
      final result = widget.viewModel.updateInstance.result;
      String msg = 'Cập nhật thất bại';
      if (result != null && result is core_result.Error) {
        msg = (result as core_result.Error).error
            .toString()
            .replaceAll('HttpException: ', '');
      }
      widget.viewModel.updateInstance.clearResult();
      Utils.showErrorNotification(context, msg);
    } else if (widget.viewModel.updateInstance.completed) {
      widget.viewModel.updateInstance.clearResult();
      Utils.showSuccessNotification(context, 'Cập nhật thành công');
    }
    setState(() {});
  }

  void _onStatusResult() {
    if (!mounted) return;
    if (widget.viewModel.updateStatus.error) {
      final result = widget.viewModel.updateStatus.result;
      String msg = 'Cập nhật trạng thái thất bại';
      if (result != null && result is core_result.Error) {
        msg = (result as core_result.Error).error
            .toString()
            .replaceAll('HttpException: ', '');
      }
      widget.viewModel.updateStatus.clearResult();
      Utils.showErrorNotification(context, msg);
    } else if (widget.viewModel.updateStatus.completed) {
      widget.viewModel.updateStatus.clearResult();
      Utils.showSuccessNotification(context, 'Cập nhật trạng thái thành công');
      // Reload detail
      widget.viewModel.loadTourDetail.execute(widget.tour.id);
    }
    setState(() {});
  }

  void _onDeleteResult() {
    if (!mounted) return;
    if (widget.viewModel.deleteInstance.error) {
      final result = widget.viewModel.deleteInstance.result;
      String msg = 'Xóa tour thất bại';
      if (result is core_result.Error) {
        msg = result.error.toString().replaceAll('HttpException: ', '');
      }
      widget.viewModel.deleteInstance.clearResult();
      Utils.showErrorNotification(context, msg);
    } else if (widget.viewModel.deleteInstance.completed) {
      widget.viewModel.deleteInstance.clearResult();
      Utils.showSuccessNotification(context, 'Đã hủy tour');
      Navigator.of(context).pop();
    }
  }

  // ── Status actions ─────────────────────────────────────────────────────────

  void _showUpdateStatusDialog() {
    final statuses = ['PLANNING', 'OPEN', 'FULL', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED'];
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Cập nhật trạng thái'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: statuses.map((s) {
            return ListTile(
              title: Text(_localizedStatus(s)),
              onTap: () {
                Navigator.of(ctx).pop();
                widget.viewModel.executeUpdateStatus(
                  id: widget.tour.id,
                  status: s,
                );
              },
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Hủy'),
          ),
        ],
      ),
    );
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final tour = _tour;
    final isLoading = widget.viewModel.loadTourDetail.running ||
        widget.viewModel.updateStatus.running ||
        widget.viewModel.deleteInstance.running;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              // ── App Bar ─────────────────────────────────
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(16, statusBarHeight + 10, 16, 20),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    const Text(
                      'Tour chi tiết',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: const Icon(Icons.edit_outlined,
                            color: Colors.white, size: 22),
                        onPressed: _showUpdateStatusDialog,
                        tooltip: 'Cập nhật trạng thái',
                      ),
                    ),
                  ],
                ),
              ),

              // ── Scrollable Body ───────────────────────────────────────────────
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── Tour Image Hero ────────────────────────────────────────
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.primary, width: 2),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://vnn-imgs-f.vgcloud.vn/2019/10/24/16/du-lich-dai-loan-tu-tuc-nhung-dieu-can-biet.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withValues(alpha: 0.8),
                                Colors.transparent
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: Text(
                            tour.tourName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Status chip
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: _statusColor(tour.status),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _localizedStatus(tour.status),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ── Date Info Fields ─────────────────────────
                      Row(
                        children: [
                          Expanded(
                            child: CoordinatorTourInfoField(
                              label: 'Ngày bắt đầu',
                              content: tour.startDate,
                              prefixIcon: Icons.calendar_today_outlined,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CoordinatorTourInfoField(
                              label: 'Ngày kết thúc',
                              content: tour.endDate,
                              prefixIcon: Icons.calendar_today_outlined,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // ── Location Info Fields ─────────────────────────
                      Row(
                        children: [
                          Expanded(
                            child: CoordinatorTourInfoField(
                              label: 'Nơi khởi hành',
                              content: tour.pickupLocation.isNotEmpty
                                  ? tour.pickupLocation
                                  : 'Tp.HCM',
                              prefixIcon: Icons.location_on_outlined,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CoordinatorTourInfoField(
                              label: 'Nơi đến',
                              content: tour.destinationName.isNotEmpty
                                  ? tour.destinationName
                                  : 'Tp.HCM',
                              prefixIcon: Icons.location_on_outlined,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // ── Participants Info Fields ─────────────────────────
                      Row(
                        children: [
                          Expanded(
                            child: CoordinatorTourInfoField(
                              label: 'Số người tối thiểu',
                              content: '${tour.minParticipants}',
                              prefixIcon: Icons.person_outline,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CoordinatorTourInfoField(
                              label: 'Số người tối đa',
                              content: '${tour.maxParticipants}',
                              prefixIcon: Icons.person_outline,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Current participants
                      CoordinatorTourInfoField(
                        label: 'Số người hiện tại',
                        content: '${tour.currentParticipants}',
                        prefixIcon: Icons.group_outlined,
                      ),

                      const SizedBox(height: 24),

                      // ── Expandable Section: Thông tin chi tiết ──────────────────
                      _buildExpandableHeader(
                        title: 'Thông tin chi tiết',
                        isExpanded: _isDetailsExpanded,
                        onTap: () => setState(
                          () => _isDetailsExpanded = !_isDetailsExpanded,
                        ),
                      ),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: _isDetailsExpanded
                            ? Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Column(
                                  children: [
                                    if (tour.guideName != null)
                                      _buildInfoCard(
                                        icon: Icons.person_outline,
                                        title: 'Hướng dẫn viên',
                                        lines: [
                                          tour.guideName!,
                                          if (tour.guidePhone != null)
                                            tour.guidePhone!,
                                        ],
                                      ),
                                    if (tour.driverName != null)
                                      _buildInfoCard(
                                        icon: Icons.drive_eta_outlined,
                                        title: 'Tài xế',
                                        lines: [
                                          tour.driverName!,
                                          if (tour.driverPhone != null)
                                            tour.driverPhone!,
                                        ],
                                      ),
                                    if (tour.coachLicensePlate != null)
                                      _buildInfoCard(
                                        icon: Icons.directions_bus_outlined,
                                        title: 'Xe',
                                        lines: [
                                          tour.coachLicensePlate!,
                                          if (tour.coachType != null)
                                            tour.coachType!,
                                        ],
                                      ),
                                    if (tour.guideName == null &&
                                        tour.driverName == null &&
                                        tour.coachLicensePlate == null)
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Text(
                                          'Chưa phân công nhân sự',
                                          style: TextStyle(
                                            color: AppColors.textSecondary,
                                          ),
                                        ),
                                      ),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),

                      // ── Expandable Section: Danh sách Booking ────────────────
                      _buildExpandableHeader(
                        title: 'Danh sách Booking',
                        isExpanded: _isBookingsExpanded,
                        onTap: () => setState(
                          () => _isBookingsExpanded = !_isBookingsExpanded,
                        ),
                      ),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: _isBookingsExpanded
                            ? const Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 12.0),
                                child: Text(
                                  'Chức năng xem danh sách booking đang được phát triển.',
                                  style: TextStyle(
                                      color: AppColors.textSecondary),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),

                      // ── Expandable Section: Lịch trình chi tiết ────────────────
                      _buildExpandableHeader(
                        title: 'Lịch trình chi tiết',
                        isExpanded: _isItineraryExpanded,
                        onTap: () => setState(
                          () => _isItineraryExpanded =
                              !_isItineraryExpanded,
                        ),
                      ),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: _isItineraryExpanded
                            ? const Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 12.0),
                                child: Text(
                                  'Chức năng xem lịch trình chi tiết đang được phát triển.',
                                  style: TextStyle(
                                      color: AppColors.textSecondary),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Loading overlay
          if (isLoading)
            Container(
              color: Colors.black26,
              child: const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required List<String> lines,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primary, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                ...lines.map(
                  (l) => Text(
                    l,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableHeader({
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            Icon(
              isExpanded
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
              color: AppColors.textPrimary,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  String _localizedStatus(String status) {
    switch (status.toUpperCase()) {
      case 'PLANNING':
        return 'ĐANG LẬP KẾ HOẠCH';
      case 'OPEN':
        return 'ĐANG MỞ';
      case 'FULL':
        return 'ĐÃ ĐẦY';
      case 'IN_PROGRESS':
        return 'ĐANG DIỄN RA';
      case 'COMPLETED':
        return 'ĐÃ HOÀN THÀNH';
      case 'CANCELLED':
        return 'ĐÃ HỦY';
      default:
        return status;
    }
  }

  Color _statusColor(String status) {
    switch (status.toUpperCase()) {
      case 'PLANNING':
        return Colors.blueGrey;
      case 'OPEN':
        return Colors.green;
      case 'FULL':
        return Colors.orange;
      case 'IN_PROGRESS':
        return AppColors.primary;
      case 'COMPLETED':
        return Colors.teal;
      case 'CANCELLED':
        return AppColors.error;
      default:
        return AppColors.textSecondary;
    }
  }
}

