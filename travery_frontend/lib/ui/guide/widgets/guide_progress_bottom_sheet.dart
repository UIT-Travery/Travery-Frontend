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
    _selectedStatus = _getNextStatus(widget.currentStatus);
  }

  /// Get available next statuses based on current status
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

    // Filter based on current status
    final currentIndex = allStatuses.indexWhere(
      (s) => s.value == widget.currentStatus,
    );

    if (currentIndex == -1) {
      return allStatuses;
    }

    // Can only move forward or to COMPLETED/CANCELLED
    // For simplicity, show all upcoming statuses
    return allStatuses.sublist(currentIndex);
  }

  String? _getNextStatus(String currentStatus) {
    final statuses = ['PLANNING', 'OPEN', 'FULL', 'IN_PROGRESS', 'COMPLETED'];
    final currentIndex = statuses.indexOf(currentStatus);
    if (currentIndex == -1 || currentIndex >= statuses.length - 1) {
      return null;
    }
    return statuses[currentIndex + 1];
  }

  bool get _isTerminalStatus =>
      widget.currentStatus == 'COMPLETED' ||
      widget.currentStatus == 'CANCELLED';

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
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.update,
                        color: AppColors.primary,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Cập nhật tiến độ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Trạng thái hiện tại: ${_getStatusLabel(widget.currentStatus)}',
                    style: const TextStyle(
                      fontSize: 14,
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
            const SizedBox(height: 20),
            // Action buttons
            _buildActions(),
            const SizedBox(height: 16),
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const Text(
            'Chọn trạng thái tiếp theo:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          ...statuses.map((status) => _buildStatusOption(status)),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                _error!,
                style: const TextStyle(fontSize: 13, color: AppColors.error),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStatusOption(_TourStatusOption status) {
    final isSelected = _selectedStatus == status.value;
    final isCurrent = status.value == widget.currentStatus;

    return GestureDetector(
      onTap: isCurrent ? null : () => _selectStatus(status.value),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.1)
              : isCurrent
              ? AppColors.surfaceGray
              : AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.surfaceGray,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
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
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    status.label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isCurrent ? AppColors.icon : AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    status.description,
                    style: TextStyle(
                      fontSize: 12,
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.icon.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'HIỆN TẠI',
                  style: TextStyle(
                    fontSize: 10,
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: AppColors.icon),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Hủy',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: _isLoading || _selectedStatus == null
                  ? null
                  : _confirmStatus,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    )
                  : const Text(
                      'Xác nhận',
                      style: TextStyle(fontWeight: FontWeight.w600),
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
