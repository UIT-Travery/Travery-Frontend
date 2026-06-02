import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/guide/mission/mission_detail_view_model.dart';

class MissionDetailScreen extends StatefulWidget {
  final String missionId;
  final MissionDetailViewModel viewModel;

  const MissionDetailScreen({
    super.key,
    required this.missionId,
    required this.viewModel,
  });

  @override
  State<MissionDetailScreen> createState() => _MissionDetailScreenState();
}

class _MissionDetailScreenState extends State<MissionDetailScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.loadMissionDetail(widget.missionId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Chi tiết Nhiệm vụ',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, _) {
          if (widget.viewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (widget.viewModel.errorMessage != null) {
            return _buildError(widget.viewModel.errorMessage!);
          }

          final mission = widget.viewModel.mission;
          if (mission == null) {
            return _buildError('Không tìm thấy nhiệm vụ');
          }

          return _buildContent(mission);
        },
      ),
    );
  }

  Widget _buildContent(mission) {
    return RefreshIndicator(
      onRefresh: () => widget.viewModel.loadMissionDetail(widget.missionId),
      color: AppColors.primary,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTourCard(mission),
            const SizedBox(height: 16),
            _buildActionButtons(mission),
            const SizedBox(height: 16),
            _buildOperationalCard(mission),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildTourCard(mission) {
    final codeSuffix = mission.id.isNotEmpty
        ? mission.id.substring(0, mission.id.length.clamp(0, 8)).toUpperCase()
        : 'N/A';
    final dateStr =
        '${mission.startDate.day}/${mission.startDate.month}/${mission.startDate.year}';

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: const Center(
              child: Icon(Icons.tour, size: 64, color: AppColors.primary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        mission.tourName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    _buildStatusBadge(mission.status),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Mã: $codeSuffix',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        mission.pickupLocation,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 16,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      dateStr,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.groups_outlined,
                      size: 16,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${mission.totalPassengers} khách',
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color bgColor;
    Color textColor;
    String label;

    switch (status.toUpperCase()) {
      case 'IN_PROGRESS':
        bgColor = const Color(0xFFFEF3C7);
        textColor = const Color(0xFFD97706);
        label = 'ĐANG DIỄN RA';
        break;
      case 'COMPLETED':
        bgColor = const Color(0xFFD1FAE5);
        textColor = const Color(0xFF10B981);
        label = 'HOÀN THÀNH';
        break;
      case 'CANCELLED':
        bgColor = const Color(0xFFFEE2E2);
        textColor = const Color(0xFFDC2626);
        label = 'ĐÃ HỦY';
        break;
      default:
        bgColor = const Color(0xFFE0F2FE);
        textColor = const Color(0xFF3B82F6);
        label = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildActionButtons(mission) {
    final isOngoing = mission.isOngoing;

    return Column(
      children: [
        _buildActionButton(
          icon: Icons.check_circle_outline,
          label: 'Điểm danh',
          subtitle: 'Check-in hành khách',
          color: const Color(0xFF3B82F6),
          onTap: () =>
              context.push('/guide/mission/${widget.missionId}/check-in'),
        ),
        const SizedBox(height: 12),
        if (isOngoing)
          _buildActionButton(
            icon: Icons.trending_up,
            label: 'Cập nhật tiến độ',
            subtitle: 'Chuyển trạng thái tour',
            color: const Color(0xFF10B981),
            onTap: () =>
                context.push('/guide/mission/${widget.missionId}/progress'),
          ),
        if (isOngoing) const SizedBox(height: 12),
        _buildActionButton(
          icon: Icons.warning_amber_outlined,
          label: 'Báo cáo sự cố',
          subtitle: 'Thông báo vấn đề',
          color: const Color(0xFFEF4444),
          onTap: () => context.push(
            '/guide/mission/${widget.missionId}/report-incident',
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withValues(alpha: 0.2)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: color),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOperationalCard(mission) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thông tin điều hành',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          if (mission.driverName != null && mission.driverName!.isNotEmpty) ...[
            _buildInfoRow(
              icon: Icons.person_outline,
              label: 'Tài xế',
              value: mission.driverName!,
            ),
            const SizedBox(height: 12),
          ],
          if (mission.coachLicensePlate != null &&
              mission.coachLicensePlate!.isNotEmpty) ...[
            _buildInfoRow(
              icon: Icons.directions_bus_outlined,
              label: 'Biển số',
              value: mission.coachLicensePlate!,
            ),
            const SizedBox(height: 12),
          ],
          if (mission.coachType != null && mission.coachType!.isNotEmpty) ...[
            _buildInfoRow(
              icon: Icons.airline_seat_recline_normal_outlined,
              label: 'Loại xe',
              value: mission.coachType!,
            ),
            const SizedBox(height: 12),
          ],
          _buildInfoRow(
            icon: Icons.groups_outlined,
            label: 'Tổng khách',
            value: '${mission.totalPassengers} người',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.textSecondary),
        const SizedBox(width: 12),
        Text(
          '$label:',
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: AppColors.error),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () =>
                  widget.viewModel.loadMissionDetail(widget.missionId),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      ),
    );
  }
}
