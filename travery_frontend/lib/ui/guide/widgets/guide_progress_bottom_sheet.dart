import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/guide/utils/guide_error_message.dart';
import 'package:travery_frontend/utils/core_result.dart';

class GuideProgressBottomSheet extends StatefulWidget {
  const GuideProgressBottomSheet({
    super.key,
    required this.missionId,
    required this.currentStatus,
    required this.onStatusSelected,
    this.onSubmitStatus,
  });

  final String missionId;
  final String currentStatus;
  final ValueChanged<String> onStatusSelected;
  final Future<Result<void>> Function(String status)? onSubmitStatus;

  @override
  State<GuideProgressBottomSheet> createState() =>
      _GuideProgressBottomSheetState();
}

class _GuideProgressBottomSheetState extends State<GuideProgressBottomSheet> {
  String? _selectedStatus;
  bool _isLoading = false;
  String? _error;

  bool get _isTerminalStatus {
    final status = widget.currentStatus.toUpperCase();
    return status == 'COMPLETED' || status == 'CANCELLED';
  }

  @override
  void initState() {
    super.initState();
    _selectedStatus = _firstSelectableStatus(_availableStatuses);
  }

  List<_ProgressStatusOption> get _availableStatuses {
    const selectable = ['IN_PROGRESS', 'COMPLETED'];
    final current = widget.currentStatus.toUpperCase();
    final result = <_ProgressStatusOption>[_buildStatusOptionData(current)];

    for (final status in selectable) {
      if (status != current) result.add(_buildStatusOptionData(status));
    }

    return result;
  }

  String? _firstSelectableStatus(List<_ProgressStatusOption> statuses) {
    if (_isTerminalStatus) return null;
    final current = widget.currentStatus.toUpperCase();
    for (final status in statuses) {
      if (status.value != current) return status.value;
    }
    return null;
  }

  _ProgressStatusOption _buildStatusOptionData(String status) {
    switch (status) {
      case 'PLANNING':
      case 'PENDING':
        return _ProgressStatusOption(
          value: status,
          label: _statusLabel(status),
          description: 'Chờ bắt đầu',
        );
      case 'OPEN':
        return _ProgressStatusOption(
          value: status,
          label: _statusLabel(status),
          description: 'Mở đăng ký',
        );
      case 'FULL':
        return _ProgressStatusOption(
          value: status,
          label: _statusLabel(status),
          description: 'Đã đủ khách',
        );
      case 'IN_PROGRESS':
        return _ProgressStatusOption(
          value: status,
          label: _statusLabel(status),
          description: 'Đang diễn ra',
        );
      case 'COMPLETED':
        return _ProgressStatusOption(
          value: status,
          label: _statusLabel(status),
          description: 'Hoàn thành',
        );
      case 'CANCELLED':
        return _ProgressStatusOption(
          value: status,
          label: _statusLabel(status),
          description: 'Đã hủy',
        );
      default:
        return _ProgressStatusOption(
          value: status,
          label: _statusLabel(status),
          description: status,
        );
    }
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
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.surfaceGray,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
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
                    'Hiện tại: ${_statusLabel(widget.currentStatus)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            if (_isTerminalStatus) _buildTerminalState() else _buildOptions(),
            const SizedBox(height: 12),
            _buildActions(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildTerminalState() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 16, 20, 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF2F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.info_outline, color: Color(0xFFEF4444)),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Chuyến đi đã kết thúc, không thể thay đổi trạng thái.',
              style: TextStyle(fontSize: 14, color: Color(0xFFEF4444)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptions() {
    final statuses = _availableStatuses;

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
                  _buildStatusOptionTile(status),
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
              guideFriendlyErrorMessage(
                _error,
                fallback: 'Không cập nhật được tiến độ. Vui lòng kiểm tra lại.',
              ),
              style: const TextStyle(fontSize: 12, color: AppColors.error),
            ),
          ),
      ],
    );
  }

  Widget _buildStatusOptionTile(_ProgressStatusOption status) {
    final current = widget.currentStatus.toUpperCase();
    final isSelected = _selectedStatus == status.value;
    final isCurrent = status.value == current;

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
              onPressed:
                  _isLoading || _selectedStatus == null || _isTerminalStatus
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
    final selected = _selectedStatus;
    if (selected == null || !_canSubmitStatus(selected)) return;

    final submit = widget.onSubmitStatus;
    final missionService = submit == null
        ? context.read<GuideMissionService>()
        : null;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final result = submit == null
          ? await missionService!.updateProgress(widget.missionId, selected)
          : await submit(selected);

      if (!mounted) return;

      switch (result) {
        case Ok():
          widget.onStatusSelected(selected);
          Navigator.pop(context);
          break;
        case Error(:final error):
          setState(() {
            _error = guideFriendlyErrorMessage(
              error,
              fallback: 'Không cập nhật được tiến độ. Vui lòng kiểm tra lại.',
            );
          });
          break;
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = guideFriendlyErrorMessage(
            e,
            fallback: 'Không cập nhật được tiến độ. Vui lòng kiểm tra lại.',
          );
        });
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  bool _canSubmitStatus(String status) {
    return status == 'IN_PROGRESS' || status == 'COMPLETED';
  }

  String _statusLabel(String status) {
    switch (status.toUpperCase()) {
      case 'PLANNING':
        return 'Đang lập kế hoạch';
      case 'PENDING':
        return 'Chờ bắt đầu';
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

class _ProgressStatusOption {
  const _ProgressStatusOption({
    required this.value,
    required this.label,
    required this.description,
  });

  final String value;
  final String label;
  final String description;
}
