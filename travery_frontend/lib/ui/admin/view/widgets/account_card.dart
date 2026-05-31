import 'package:flutter/material.dart';
import 'package:travery_frontend/domain/models/admin/business_account/business_account.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_text_theme.dart';

extension AccountRoleLabel on AccountRole {
  String get label {
    switch (this) {
      case AccountRole.guide:
        return 'HƯỚNG DẪN VIÊN';
      case AccountRole.coordinator:
        return 'ĐIỀU PHỐI VIÊN';
      case AccountRole.receptionist:
        return 'LỄ TÂN';
      case AccountRole.tourist:
        return 'KHÁCH HÀNG';
      case AccountRole.admin:
        return 'QUẢN TRỊ VIÊN';
    }
  }
}

extension AccountStatusLabel on AccountStatus {
  String get label {
    switch (this) {
      case AccountStatus.active:
        return 'Đang hoạt động';
      case AccountStatus.inactive:
        return 'Ngừng hoạt động';
      case AccountStatus.banned:
        return 'Bị cấm';
      case AccountStatus.pending:
        return 'Chờ xác nhận';
      case AccountStatus.deleted:
        return 'Đã xóa';
    }
  }

  Color get color {
    switch (this) {
      case AccountStatus.active:
        return AppColors.success;
      case AccountStatus.inactive:
        return AppColors.textSecondary;
      case AccountStatus.banned:
        return AppColors.error;
      case AccountStatus.pending:
        return AppColors.warning;
      case AccountStatus.deleted:
        return AppColors.textHint;
    }
  }
}

class AccountCard extends StatelessWidget {
  const AccountCard({
    super.key,
    required this.name,
    required this.email,
    required this.role,
    required this.status,
    this.avatarUrl,
    this.onTap,
    this.onMenuTap,
  });

  final String name;
  final String email;
  final AccountRole role;
  final AccountStatus status;
  final String? avatarUrl;
  final VoidCallback? onTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          splashColor: AppColors.primary.withValues(alpha: 0.06),
          highlightColor: AppColors.primary.withValues(alpha: 0.03),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ── Avatar ────────────────────────────────────────────────
                _buildAvatar(),

                const SizedBox(width: 12),

                // ── Name / Email / Role badge ─────────────────────────────
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: AppTextTheme.bodyLarge,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      // Email
                      Text(
                        email,
                        style: TextStyle(
                          fontSize: AppTextTheme.bodySmall,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Bottom row: role badge + status
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _RoleBadge(role: role),
                          _StatusIndicator(status: status),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 4),

                // ── 3-dot menu ────────────────────────────────────────────
                IconButton(
                  onPressed: onMenuTap,
                  icon: const Icon(Icons.more_vert_rounded),
                  color: AppColors.textSecondary,
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 28,
                    minHeight: 28,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    if (avatarUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          avatarUrl!,
          width: 52,
          height: 52,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => _defaultAvatar(),
        ),
      );
    }
    return _defaultAvatar();
  }

  Widget _defaultAvatar() {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xFF1C3A5E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.person_rounded, color: Colors.white, size: 28),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Role badge
// ─────────────────────────────────────────────────────────────────────────────

class _RoleBadge extends StatelessWidget {
  const _RoleBadge({required this.role});

  final AccountRole role;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        role.label,
        style: TextStyle(
          fontSize: AppTextTheme.bodySmall,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondary,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Status indicator
// ─────────────────────────────────────────────────────────────────────────────

class _StatusIndicator extends StatelessWidget {
  const _StatusIndicator({required this.status});

  final AccountStatus status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            color: status.color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          status.label,
          style: TextStyle(
            fontSize: AppTextTheme.bodySmall,
            fontWeight: FontWeight.w600,
            color: status.color,
          ),
        ),
      ],
    );
  }
}
