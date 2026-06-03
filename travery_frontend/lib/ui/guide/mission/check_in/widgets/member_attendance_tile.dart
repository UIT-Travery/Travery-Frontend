import 'package:flutter/material.dart';
import 'package:travery_frontend/data/services/guide/guide_mission_service.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

class MemberAttendanceTile extends StatelessWidget {
  const MemberAttendanceTile({
    super.key,
    required this.member,
    required this.currentStatus,
    required this.onStatusChanged,
    this.isEditable = true,
  });

  final GuideMember member;
  final String currentStatus;
  final ValueChanged<String> onStatusChanged;
  final bool isEditable;

  Color get _borderColor {
    switch (currentStatus) {
      case 'CHECKED_IN':
        return const Color(0xFF22c55e);
      case 'NO_SHOW':
        return const Color(0xFFef4444);
      default:
        return AppColors.icon;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                              member.fullName,
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
                                Icon(
                                  member.memberType == 'ADULT'
                                      ? Icons.person_outline
                                      : Icons.child_care,
                                  size: 12,
                                  color: AppColors.textSecondary,
                                ),
                                const SizedBox(width: 3),
                                Flexible(
                                  child: Text(
                                    member.memberType == 'ADULT'
                                        ? 'Người lớn'
                                        : 'Trẻ em',
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
                        child: _CompactStatusPicker(
                          value: currentStatus,
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

class _CompactStatusPicker extends StatelessWidget {
  const _CompactStatusPicker({required this.value, required this.onChanged});

  final String value;
  final ValueChanged<String>? onChanged;

  Color get _statusColor {
    switch (value) {
      case 'CHECKED_IN':
        return const Color(0xFF22c55e);
      case 'NO_SHOW':
        return const Color(0xFFef4444);
      default:
        return AppColors.textSecondary;
    }
  }

  IconData get _statusIcon {
    switch (value) {
      case 'CHECKED_IN':
        return Icons.check_circle;
      case 'NO_SHOW':
        return Icons.cancel;
      default:
        return Icons.radio_button_unchecked;
    }
  }

  String get _statusLabel {
    switch (value) {
      case 'CHECKED_IN':
        return 'Có mặt';
      case 'NO_SHOW':
        return 'Vắng';
      default:
        return '...';
    }
  }

  void _showOptions(BuildContext context) {
    final callback = onChanged;
    if (callback == null) return;

    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset offset = button.localToGlobal(Offset.zero);

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
                    _OptionTile(
                      icon: Icons.radio_button_unchecked,
                      label: 'Chưa điểm danh',
                      iconColor: AppColors.icon,
                      textColor: AppColors.textPrimary,
                      onTap: () {
                        Navigator.of(ctx).pop();
                        callback('NOT_CHECKED');
                      },
                      isSelected: value == 'NOT_CHECKED',
                    ),
                    _buildDivider(),
                    _OptionTile(
                      icon: Icons.check_circle,
                      label: 'Đã có mặt',
                      iconColor: const Color(0xFF22c55e),
                      textColor: const Color(0xFF22c55e),
                      onTap: () {
                        Navigator.of(ctx).pop();
                        callback('CHECKED_IN');
                      },
                      isSelected: value == 'CHECKED_IN',
                    ),
                    _buildDivider(),
                    _OptionTile(
                      icon: Icons.cancel,
                      label: 'Vắng mặt',
                      iconColor: const Color(0xFFef4444),
                      textColor: const Color(0xFFef4444),
                      onTap: () {
                        Navigator.of(ctx).pop();
                        callback('NO_SHOW');
                      },
                      isSelected: value == 'NO_SHOW',
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
    return GestureDetector(
      onTap: () => _showOptions(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: value == 'NOT_CHECKED'
              ? AppColors.surface
              : _statusColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: value == 'NOT_CHECKED'
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
