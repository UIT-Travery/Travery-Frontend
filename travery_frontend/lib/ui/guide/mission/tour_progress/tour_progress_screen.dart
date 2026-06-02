import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/guide/mission/mission_detail_view_model.dart';

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
  String? _selectedStatus;
  final _notesController = TextEditingController();
  final _locationController = TextEditingController();

  static const _statusOptions = [
    ('PLANNING', 'Lên kế hoạch', Color(0xFF6B7280)),
    ('OPEN', 'Mở bán', Color(0xFF10B981)),
    ('FULL', 'Đã đủ khách', Color(0xFFF59E0B)),
    ('IN_PROGRESS', 'Đang diễn ra', Color(0xFF3B82F6)),
    ('COMPLETED', 'Hoàn thành', Color(0xFF16A34A)),
    ('CANCELLED', 'Đã hủy', Color(0xFFDC2626)),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.viewModel.loadMissionDetail(widget.missionId);
    });
  }

  @override
  void dispose() {
    _notesController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  String _getStatusLabel(String status) {
    for (final opt in _statusOptions) {
      if (opt.$1 == status) return opt.$2;
    }
    return status;
  }

  Color _getStatusColor(String status) {
    for (final opt in _statusOptions) {
      if (opt.$1 == status) return opt.$3;
    }
    return AppColors.outline;
  }

  Color _getStatusBgColor(String status) {
    for (final opt in _statusOptions) {
      if (opt.$1 == status) return opt.$3.withValues(alpha: 0.1);
    }
    return AppColors.surface;
  }

  bool _isValidTransition(String currentStatus, String newStatus) {
    final order = ['PLANNING', 'OPEN', 'FULL', 'IN_PROGRESS', 'COMPLETED'];
    final currentIndex = order.indexOf(currentStatus);
    final newIndex = order.indexOf(newStatus);

    if (currentStatus == 'CANCELLED') return false;
    if (currentStatus == 'COMPLETED') return newStatus == 'CANCELLED';

    return newIndex > currentIndex || newStatus == 'CANCELLED';
  }

  Future<void> _updateProgress() async {
    if (_selectedStatus == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng chọn trạng thái mới'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    final currentStatus = widget.viewModel.mission?.status ?? '';
    if (!_isValidTransition(currentStatus, _selectedStatus!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Không thể chuyển từ "$currentStatus" sang "$_selectedStatus"',
          ),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    final success = await widget.viewModel.updateProgress(_selectedStatus!);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cập nhật tiến độ thành công'),
          backgroundColor: AppColors.primary,
        ),
      );
      context.pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(widget.viewModel.errorMessage ?? 'Cập nhật thất bại'),
          backgroundColor: AppColors.error,
        ),
      );
    }
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
        titleSpacing: 0,
        title: Consumer<MissionDetailViewModel>(
          builder: (context, vm, _) {
            final name = vm.mission?.tourName ?? 'Tiến độ tour';
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.65,
              ),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            );
          },
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

          return _buildContent(mission, vm);
        },
      ),
    );
  }

  Widget _buildContent(mission, MissionDetailViewModel vm) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTourInfoCard(mission),
          const SizedBox(height: 16),
          _buildCurrentStatusCard(mission),
          const SizedBox(height: 16),
          _buildStatusSelector(mission),
          const SizedBox(height: 16),
          _buildNotesCard(),
          const SizedBox(height: 16),
          _buildLocationCard(),
          const SizedBox(height: 24),
          _buildUpdateButton(vm),
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
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '#${mission.id.substring(0, mission.id.length.clamp(0, 8)).toUpperCase()}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
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
                Icons.calendar_today,
                size: 14,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                '${mission.startDate.day}/${mission.startDate.month}/${mission.startDate.year} - ${mission.endDate.day}/${mission.endDate.month}/${mission.endDate.year}',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildMiniStat(Icons.groups, '${mission.totalPassengers} khách'),
              const SizedBox(width: 16),
              _buildMiniStat(
                Icons.event_seat,
                '${mission.bookings.length} đoàn',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiniStat(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.primary),
        const SizedBox(width: 6),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentStatusCard(mission) {
    final status = mission.status;
    final color = _getStatusColor(status);
    final bgColor = _getStatusBgColor(status);

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
            'TRẠNG THÁI HIỆN TẠI',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: AppColors.outline,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withValues(alpha: 0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  _getStatusLabel(status),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusSelector(mission) {
    final currentStatus = mission.status;

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
            'CẬP NHẬT TRẠNG THÁI MỚI',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: AppColors.outline,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _statusOptions.map((opt) {
              final (value, label, color) = opt;
              final isSelected = _selectedStatus == value;
              final isCurrent = currentStatus == value;
              final isValid =
                  _isValidTransition(currentStatus, value) || isCurrent;

              return GestureDetector(
                onTap: isValid && !isCurrent
                    ? () => setState(() => _selectedStatus = value)
                    : null,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? color.withValues(alpha: 0.15)
                        : (isCurrent
                              ? AppColors.surface
                              : (isValid
                                    ? AppColors.surface
                                    : Colors.grey.shade100)),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected
                          ? color
                          : (isCurrent
                                ? AppColors.primary
                                : (isValid
                                      ? AppColors.outline
                                      : Colors.grey.shade300)),
                      width: isSelected || isCurrent ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: isValid || isCurrent
                              ? color
                              : Colors.grey.shade400,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: isSelected || isCurrent
                              ? FontWeight.bold
                              : FontWeight.w500,
                          color: isValid || isCurrent
                              ? (isSelected ? color : AppColors.textPrimary)
                              : Colors.grey.shade400,
                        ),
                      ),
                      if (isCurrent)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'HIỆN TẠI',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesCard() {
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
            'GHI CHÚ / NHẬT KÝ',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: AppColors.outline,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _notesController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Nhập ghi chú về tiến độ tour...',
              hintStyle: const TextStyle(color: AppColors.outline),
              filled: true,
              fillColor: AppColors.background,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationCard() {
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
            'VỊ TRÍ HIỆN TẠI',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: AppColors.outline,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _locationController,
            decoration: InputDecoration(
              hintText: 'VD: Đang ở Hải Phòng',
              hintStyle: const TextStyle(color: AppColors.outline),
              prefixIcon: const Icon(
                Icons.location_on,
                color: AppColors.primary,
              ),
              filled: true,
              fillColor: AppColors.background,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateButton(MissionDetailViewModel vm) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: vm.isUpdatingProgress || _selectedStatus == null
            ? null
            : _updateProgress,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: vm.isUpdatingProgress
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle_outline, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Cập nhật tiến độ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
      ),
    );
  }
}
