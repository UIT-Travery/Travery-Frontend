import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class GuideAttendanceStatusPicker extends StatelessWidget {
  const GuideAttendanceStatusPicker({
    super.key,
    required this.value,
    required this.onChanged,
    this.includeNotChecked = true,
  });

  final String value;
  final ValueChanged<String>? onChanged;
  final bool includeNotChecked;

  String get _normalizedValue => value.toUpperCase();

  Color get _statusColor {
    switch (_normalizedValue) {
      case 'CHECKED_IN':
      case 'PRESENT':
        return const Color(0xFF22C55E);
      case 'NO_SHOW':
      case 'ABSENT':
      case 'CANCELLED':
        return const Color(0xFFEF4444);
      default:
        return AppColors.textSecondary;
    }
  }

  IconData get _statusIcon {
    switch (_normalizedValue) {
      case 'CHECKED_IN':
      case 'PRESENT':
        return Icons.check_circle;
      case 'NO_SHOW':
      case 'ABSENT':
      case 'CANCELLED':
        return Icons.cancel;
      default:
        return Icons.radio_button_unchecked;
    }
  }

  String get _statusLabel {
    switch (_normalizedValue) {
      case 'CHECKED_IN':
      case 'PRESENT':
        return 'Có mặt';
      case 'NO_SHOW':
      case 'ABSENT':
        return 'Vắng';
      case 'CANCELLED':
        return 'Đã hủy';
      default:
        return '...';
    }
  }

  void _showOptions(BuildContext context) {
    final callback = onChanged;
    if (callback == null) return;

    final button = context.findRenderObject() as RenderBox;
    final offset = button.localToGlobal(Offset.zero);

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: true,
      builder: (ctx) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Navigator.of(ctx).pop(),
              behavior: HitTestBehavior.opaque,
              child: Container(color: Colors.transparent),
            ),
          ),
          Positioned(
            right: 0,
            top: offset.dy + button.size.height + 2,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(8),
              color: AppColors.surface,
              child: Container(
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.surfaceGray.withValues(alpha: 0.5),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (includeNotChecked) ...[
                      _OptionTile(
                        icon: Icons.radio_button_unchecked,
                        label: 'Chưa điểm danh',
                        iconColor: AppColors.icon,
                        textColor: AppColors.textPrimary,
                        onTap: () {
                          Navigator.of(ctx).pop();
                          callback('NOT_CHECKED');
                        },
                        isSelected:
                            _normalizedValue != 'CHECKED_IN' &&
                            _normalizedValue != 'PRESENT' &&
                            _normalizedValue != 'NO_SHOW' &&
                            _normalizedValue != 'ABSENT',
                      ),
                      _buildDivider(),
                    ],
                    _OptionTile(
                      icon: Icons.check_circle,
                      label: 'Đã có mặt',
                      iconColor: const Color(0xFF22C55E),
                      textColor: const Color(0xFF22C55E),
                      onTap: () {
                        Navigator.of(ctx).pop();
                        callback('CHECKED_IN');
                      },
                      isSelected:
                          _normalizedValue == 'CHECKED_IN' ||
                          _normalizedValue == 'PRESENT',
                    ),
                    _buildDivider(),
                    _OptionTile(
                      icon: Icons.cancel,
                      label: 'Vắng mặt',
                      iconColor: const Color(0xFFEF4444),
                      textColor: const Color(0xFFEF4444),
                      onTap: () {
                        Navigator.of(ctx).pop();
                        callback('NO_SHOW');
                      },
                      isSelected:
                          _normalizedValue == 'NO_SHOW' ||
                          _normalizedValue == 'ABSENT',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() => Container(
    height: 1,
    margin: const EdgeInsets.symmetric(horizontal: 8),
    color: AppColors.surfaceGray.withValues(alpha: 0.4),
  );

  @override
  Widget build(BuildContext context) {
    final isEditable = onChanged != null;
    final isNotChecked =
        _normalizedValue != 'CHECKED_IN' &&
        _normalizedValue != 'PRESENT' &&
        _normalizedValue != 'NO_SHOW' &&
        _normalizedValue != 'ABSENT' &&
        _normalizedValue != 'CANCELLED';

    return GestureDetector(
      onTap: () => _showOptions(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: isNotChecked
              ? AppColors.surface
              : _statusColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isNotChecked
                ? AppColors.surfaceGray
                : _statusColor.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              isEditable ? _statusIcon : Icons.lock_outline,
              size: 14,
              color: isEditable ? _statusColor : AppColors.textSecondary,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                _statusLabel,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: isEditable ? _statusColor : AppColors.textSecondary,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            Icon(
              isEditable ? Icons.arrow_drop_down : Icons.remove,
              size: 16,
              color: isEditable ? _statusColor : AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.textColor,
    required this.onTap,
    required this.isSelected,
  });

  final IconData icon;
  final String label;
  final Color iconColor;
  final Color textColor;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        color: isSelected
            ? AppColors.surfaceGray.withValues(alpha: 0.15)
            : null,
        child: Row(
          children: [
            Icon(icon, size: 16, color: iconColor),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: textColor,
                ),
              ),
            ),
            if (isSelected) Icon(Icons.check, size: 14, color: textColor),
          ],
        ),
      ),
    );
  }
}
