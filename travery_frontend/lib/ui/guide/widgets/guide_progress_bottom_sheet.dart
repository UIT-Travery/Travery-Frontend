import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class GuideProgressBottomSheet extends StatefulWidget {
  const GuideProgressBottomSheet({
    super.key,
    required this.missionId,
    required this.currentStatus,
    required this.onStatusSelected,
  });

  final String missionId;
  final String currentStatus;
  final ValueChanged<String> onStatusSelected;

  @override
  State<GuideProgressBottomSheet> createState() =>
      _GuideProgressBottomSheetState();
}

class _GuideProgressBottomSheetState extends State<GuideProgressBottomSheet> {
  String? _selectedStatus;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    final statuses = _getAvailableStatuses();
    // First option is always current (disabled); pre-select the first selectable one
    _selectedStatus = statuses.length > 1 ? statuses[1].value : null;
  }

  bool get _isTerminalStatus =>
      widget.currentStatus == 'COMPLETED' ||
      widget.currentStatus == 'CANCELLED';

  /// Get available statuses: current (disabled), all other valid statuses (enabled).
  List<_TourStatusOption> _getAvailableStatuses() {
    final allStatuses = [
      _TourStatusOption(
        value: 'PLANNING',
        label: 'PLANNING',
        description: 'Đang lập kế hoạch',
      ),
      _TourStatusOption(
        value: 'OPEN',
        label: 'OPEN',
        description: 'Mở đăng ký',
      ),
      _TourStatusOption(
        value: 'FULL',
        label: 'FULL',
        description: 'Đã đủ khách',
      ),
      _TourStatusOption(
        value: 'IN_PROGRESS',
        label: 'IN_PROGRESS',
        description: 'Đang diễn ra',
      ),
      _TourStatusOption(
        value: 'COMPLETED',
        label: 'COMPLETED',
        description: 'Hoàn thành',
      ),
      _TourStatusOption(
        value: 'CANCELLED',
        label: 'CANCELLED',
        description: 'Đã hủy',
      ),
    ];

    return allStatuses;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.surfaceGray,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            // Title
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.update,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Cập nhật tiến độ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 20),
                        onPressed: () => Navigator.pop(context),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Hiện tại: ${_getStatusLabel(widget.currentStatus)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Content
            if (_isTerminalStatus)
              _buildTerminalState()
            else
              _buildStatusOptions(),
            const SizedBox(height: 12),
            // Action buttons
            _buildActions(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildTerminalState() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFfef2f2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: Color(0xFFef4444)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Chuyến đi đã kết thúc, không thể thay đổi trạng thái.',
              style: TextStyle(fontSize: 14, color: const Color(0xFFef4444)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusOptions() {
    final statuses = _getAvailableStatuses();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: (statuses.length * 64.0).clamp(0, 280),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: statuses.length,
            itemBuilder: (context, index) {
              final status = statuses[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (index == 0) const SizedBox(height: 8),
                  _buildStatusOption(status),
                  if (index == statuses.length - 1) const SizedBox(height: 8),
                ],
              );
            },
          ),
        ),
        if (_error != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Text(
              _error!,
              style: const TextStyle(fontSize: 12, color: AppColors.error),
            ),
          ),
      ],
    );
  }

  Widget _buildStatusOption(_TourStatusOption status) {
    final isSelected = _selectedStatus == status.value;
    final isCurrent = status.value == widget.currentStatus;

    return GestureDetector(
      onTap: isCurrent ? null : () => _selectStatus(status.value),
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.1)
              : isCurrent
              ? AppColors.surfaceGray
              : AppColors.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.surfaceGray,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? AppColors.primary
                    : isCurrent
                    ? AppColors.icon
                    : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : isCurrent
                      ? AppColors.icon
                      : AppColors.icon,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    status.label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: isCurrent ? AppColors.icon : AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    status.description,
                    style: TextStyle(
                      fontSize: 11,
                      color: isCurrent
                          ? AppColors.icon
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (isCurrent)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.icon.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'HIỆN TẠI',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: AppColors.icon,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _selectStatus(String status) {
    setState(() {
      _selectedStatus = status;
      _error = null;
    });
  }

  Widget _buildActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10),
                side: const BorderSide(color: AppColors.icon),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Hủy',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: _isLoading || _selectedStatus == null
                  ? null
                  : _confirmStatus,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: _isLoading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    )
                  : const Text(
                      'Xác nhận',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmStatus() async {
    if (_selectedStatus == null) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final missionService = context.read<GuideMissionService>();
      final result = await missionService.updateProgress(
        widget.missionId,
        _selectedStatus!,
      );

      if (!mounted) return;

      switch (result) {
        case Ok():
          widget.onStatusSelected(_selectedStatus!);
          Navigator.pop(context);
          break;
        case Error(:final error):
          setState(() {
            _error = error.toString();
          });
          break;
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'Đã xảy ra lỗi: $e';
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  String _getStatusLabel(String status) {
    switch (status) {
      case 'PLANNING':
        return 'Đang lập kế hoạch';
      case 'OPEN':
        return 'Mở đăng ký';
      case 'FULL':
        return 'Đã đủ khách';
      case 'IN_PROGRESS':
        return 'Đang diễn ra';
      case 'COMPLETED':
        return 'Hoàn thành';
      case 'CANCELLED':
        return 'Đã hủy';
      default:
        return status;
    }
  }
}

class _TourStatusOption {
  final String value;
  final String label;
  final String description;

  const _TourStatusOption({
    required this.value,
    required this.label,
    required this.description,
  });
}
