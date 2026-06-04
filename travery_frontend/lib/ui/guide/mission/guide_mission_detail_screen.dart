import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/guide/mission/guide_mission_detail_view_model.dart';
import 'package:travery_frontend/ui/guide/mission/widgets/trip_info_card.dart';
import 'package:travery_frontend/ui/guide/mission/widgets/transport_card.dart';
import 'package:travery_frontend/ui/guide/mission/widgets/passenger_list.dart';
import 'package:travery_frontend/ui/guide/widgets/guide_progress_bottom_sheet.dart';

class GuideMissionDetailScreen extends StatefulWidget {
  const GuideMissionDetailScreen({super.key, required this.missionId});

  final String missionId;

  @override
  State<GuideMissionDetailScreen> createState() =>
      _GuideMissionDetailScreenState();
}

class _GuideMissionDetailScreenState extends State<GuideMissionDetailScreen> {
  late GuideMissionDetailViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = GuideMissionDetailViewModel(
      missionService: context.read<GuideMissionService>(),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.fetchMission(widget.missionId);
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
        listenable: _viewModel.loadMission,
        builder: (context, _) {
          if (_viewModel.loadMission.running) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (_viewModel.loadMission.error) {
            return _buildErrorState();
          }

          final mission = _viewModel.loadMission.value;
          if (mission == null) {
            return _buildEmptyState();
          }

          return _buildContent(mission);
        },
      ),
    );
  }

  Widget _buildHeader(GuideMissionDetail mission) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  mission.tourName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (mission.destinationName.isNotEmpty)
                  Text(
                    mission.destinationName,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
              ],
            ),
          ),
          _buildStatusBadge(mission.status),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    final (bgColor, textColor, label) = _getStatusStyle(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }

  (Color, Color, String) _getStatusStyle(String status) {
    switch (status) {
      case 'IN_PROGRESS':
        return (
          const Color(0xFFeffaf3),
          const Color(0xFF22c55e),
          'ĐANG DIỄN RA',
        );
      case 'COMPLETED':
        return (const Color(0xFFf3f4f6), const Color(0xFF6b7280), 'HOÀN THÀNH');
      case 'CANCELLED':
        return (const Color(0xFFfef2f2), const Color(0xFFef4444), 'ĐÃ HỦY');
      case 'PLANNING':
      case 'PENDING':
        return (
          const Color(0xFFfef3c7),
          const Color(0xFFd97706),
          'CHỜ BẮT ĐẦU',
        );
      case 'OPEN':
      case 'FULL':
        return (const Color(0xFFeef2ff), const Color(0xFF3b82f6), 'ĐANG MỞ');
      default:
        return (
          const Color(0xFFfef3c7),
          const Color(0xFFd97706),
          'CHỜ BẮT ĐẦU',
        );
    }
  }

  Widget _buildContent(GuideMissionDetail mission) {
    return Column(
      children: [
        _buildHeader(mission),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TripInfoCard(mission: mission),
                const SizedBox(height: 16),

                if (mission.coachLicensePlate != null ||
                    mission.driverName != null)
                  TransportCard(mission: mission),
                if (mission.coachLicensePlate != null ||
                    mission.driverName != null)
                  const SizedBox(height: 16),

                PassengerList(bookings: mission.bookings),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
        _buildBottomActions(mission),
      ],
    );
  }

  Widget _buildBottomActions(GuideMissionDetail mission) {
    final isProgressEditable = _isProgressEditable(mission.status);
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
                onPressed: () => _navigateToCheckin(mission.id),
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Điểm danh'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary),
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
                    ? () => _showProgressBottomSheet(mission)
                    : null,
                icon: const Icon(Icons.update),
                label: Text(_getProgressButtonLabel(mission.status)),
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

  bool _isProgressEditable(String status) {
    return status != 'COMPLETED' && status != 'CANCELLED';
  }

  String _getProgressButtonLabel(String status) {
    if (status == 'COMPLETED') return 'Đã hoàn thành';
    if (status == 'CANCELLED') return 'Đã hủy';
    return 'Cập nhật tiến độ';
  }

  void _navigateToCheckin(String missionId) {
    context.push(Routes.checkIn.replaceFirst(':id', missionId));
  }

  void _showProgressBottomSheet(GuideMissionDetail mission) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => GuideProgressBottomSheet(
        missionId: mission.id,
        currentStatus: mission.status,
        onStatusSelected: (newStatus) {
          _viewModel.refresh();
        },
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
          const Text(
            'Đã xảy ra lỗi khi tải dữ liệu',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: AppTextTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => _viewModel.fetchMission(widget.missionId),
            child: const Text('Thử lại'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, color: AppColors.textSecondary, size: 48),
          SizedBox(height: 12),
          Text(
            'Không tìm thấy thông tin nhiệm vụ',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: AppTextTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
