import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/guide/mission/mission_detail_view_model.dart';
import 'package:travery_frontend/ui/guide/mission/report_incident/report_incident_screen.dart';

class TourProgressScreen extends StatefulWidget {
  final String missionId;
  final MissionDetailViewModel viewModel;

  const TourProgressScreen({
    super.key,
    required this.missionId,
    required this.viewModel,
  });

  @override
  State<TourProgressScreen> createState() => _TourProgressScreenState();
}

class _TourProgressScreenState extends State<TourProgressScreen> {
  int _activeStepIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.loadMissionDetail(widget.missionId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => context.pop(),
        ),
        title: Column(
          children: [
            const Text(
              'Tiến độ tour',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            Consumer<MissionDetailViewModel>(
              builder: (context, vm, _) {
                if (vm.mission == null) return const SizedBox.shrink();
                return Text(
                  vm.mission!.id
                      .substring(vm.mission!.id.length.clamp(0, 8))
                      .toUpperCase(),
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.textSecondary,
                  ),
                );
              },
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Consumer<MissionDetailViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          final mission = vm.mission;
          if (mission == null) {
            return const Center(child: Text('Không có dữ liệu'));
          }

          return _buildBody(mission);
        },
      ),
    );
  }

  Widget _buildBody(mission) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTourInfoCard(mission),
          const SizedBox(height: 16),
          _buildInfoSummaryCards(mission),
          const SizedBox(height: 24),
          _buildProgressSection(),
          const SizedBox(height: 32),
          _buildReportIncidentButton(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildTourInfoCard(mission) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tour hiện tại',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            mission.tourName,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.confirmation_number_outlined,
                size: 14,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                'Mã tour: ${mission.id.substring(mission.id.length.clamp(0, 8)).toUpperCase()}',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSummaryCards(mission) {
    return Row(
      children: [
        Expanded(
          child: _InfoCard(
            icon: Icons.person,
            label: 'Tài xế',
            value: mission.driverName ?? 'Chưa có',
            subValue: 'Xe: ${mission.coachLicensePlate ?? 'N/A'}',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _InfoCard(
            icon: Icons.groups,
            label: 'Thành viên',
            value: '${mission.totalPassengers} thành viên',
            subValue: '',
          ),
        ),
      ],
    );
  }

  Widget _buildProgressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tiến độ chuyến đi',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(_steps.length, (index) {
          return _TimelineStepWidget(
            step: _steps[index],
            isLast: index == _steps.length - 1,
            stepIndex: index,
            onComplete: index == _activeStepIndex
                ? () => _onCompleteStep(index)
                : null,
          );
        }),
      ],
    );
  }

  void _onCompleteStep(int index) {
    if (index < _steps.length - 1) {
      setState(() {
        _activeStepIndex = index + 1;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đã xác nhận hoàn thành bước này'),
          backgroundColor: AppColors.primary,
        ),
      );
    }
  }

  Widget _buildReportIncidentButton() {
    return GestureDetector(
      onTap: () {
        context.push('/guide/mission/${widget.missionId}/report-incident');
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFFEE2E2)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFDC2626),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFDC2626).withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.warning_amber_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Báo cáo sự cố',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFB91C1C),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Gửi thông báo khẩn cấp về văn phòng điều hành',
                    style: TextStyle(fontSize: 11, color: Color(0xFFF87171)),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.outline, size: 20),
          ],
        ),
      ),
    );
  }

  static const _steps = [
    _StepItem(
      title: 'Đón khách',
      description: 'Đã đón đủ khách tại điểm hẹn.',
      status: _StepStatus.completed,
      time: '08:30 AM',
    ),
    _StepItem(
      title: 'Di chuyển',
      description: 'Đoàn đang di chuyển trên cao tốc.',
      status: _StepStatus.active,
      time: null,
    ),
    _StepItem(
      title: 'Nhận phòng khách sạn',
      description: 'Check-in tại khách sạn.',
      status: _StepStatus.upcoming,
      time: null,
    ),
    _StepItem(
      title: 'Tham quan',
      description: 'Tham quan các điểm đến.',
      status: _StepStatus.upcoming,
      time: null,
    ),
    _StepItem(
      title: 'Kết thúc',
      description: 'Đưa khách về điểm hẹn và trả khách.',
      status: _StepStatus.upcoming,
      time: null,
      isLast: true,
    ),
  ];
}

class _StepItem {
  final String title;
  final String description;
  final _StepStatus status;
  final String? time;
  final bool isLast;

  const _StepItem({
    required this.title,
    required this.description,
    required this.status,
    this.time,
    this.isLast = false,
  });
}

enum _StepStatus { completed, active, upcoming }

class _TimelineStepWidget extends StatelessWidget {
  final _StepItem step;
  final bool isLast;
  final int stepIndex;
  final VoidCallback? onComplete;

  const _TimelineStepWidget({
    required this.step,
    required this.isLast,
    required this.stepIndex,
    this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = step.status == _StepStatus.completed;
    final isActive = step.status == _StepStatus.active;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimelineDot(isCompleted, isActive),
          if (!isLast) _buildTimelineLine(isCompleted, isActive),
          const SizedBox(width: 16),
          Expanded(child: _buildStepContent(isCompleted, isActive)),
        ],
      ),
    );
  }

  Widget _buildTimelineDot(bool isCompleted, bool isActive) {
    if (isCompleted) {
      return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.check, color: Colors.white, size: 14),
      );
    }
    if (isActive) {
      return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white, width: 3),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.4),
              blurRadius: 6,
            ),
          ],
        ),
        child: Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      );
    }
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.outline,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  Widget _buildTimelineLine(bool isCompleted, bool isActive) {
    return Container(
      width: 2,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      color: isCompleted ? AppColors.primary : const Color(0xFFE2E8F0),
    );
  }

  Widget _buildStepContent(bool isCompleted, bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFFE0F2FE)
            : (isCompleted ? AppColors.surface : const Color(0xFFF8FAFC)),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isActive
              ? const Color(0xFFBFDBFE)
              : (isCompleted
                    ? const Color(0xFFF1F5F9)
                    : const Color(0xFFE2E8F0)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                step.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: isActive ? AppColors.primary : AppColors.textPrimary,
                ),
              ),
              _buildStatusBadge(isCompleted, isActive),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            step.description,
            style: TextStyle(
              fontSize: 12,
              color: isActive
                  ? AppColors.textSecondary
                  : const Color(0xFF94A3B8),
            ),
          ),
          if (step.time != null) ...[
            const SizedBox(height: 6),
            Text(
              'Cập nhật lúc ${step.time}',
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.outline,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
          if (isActive && onComplete != null) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton.icon(
                onPressed: onComplete,
                icon: const Icon(Icons.check_circle_outline, size: 16),
                label: const Text(
                  'Xác nhận hoàn thành',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusBadge(bool isCompleted, bool isActive) {
    if (isCompleted) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: const Color(0xFFDCFCE7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          'Hoàn thành',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Color(0xFF16A34A),
          ),
        ),
      );
    }
    if (isActive) {
      return Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFFE0F2FE),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'ĐANG DIỄN RA',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String subValue;

  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.subValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F0FE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Icon(icon, size: 16, color: AppColors.primary),
              ),
              const SizedBox(width: 6),
              Text(
                label.toUpperCase(),
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (subValue.isNotEmpty) ...[
            const SizedBox(height: 2),
            Text(
              subValue,
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
