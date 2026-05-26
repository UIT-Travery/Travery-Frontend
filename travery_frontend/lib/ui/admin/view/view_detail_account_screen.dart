import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/utils/core_result.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_theme.dart';
import 'package:travery_frontend/domain/models/admin/business_account/business_account.dart';
import '../view_model/view_detail_account_view_model.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Screen
// ─────────────────────────────────────────────────────────────────────────────

class ViewDetailAccountScreen extends StatefulWidget {
  const ViewDetailAccountScreen({
    super.key,
    required this.viewModel,
    required this.accountId,
  });

  final ViewDetailAccountViewModel viewModel;
  final String accountId;

  @override
  State<ViewDetailAccountScreen> createState() =>
      _ViewDetailAccountScreenState();
}

class _ViewDetailAccountScreenState extends State<ViewDetailAccountScreen> {
  AccountStatus? _currentStatus;

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadAccount.addListener(_onResult);
    widget.viewModel.loadAccount.execute(widget.accountId);
  }

  @override
  void didUpdateWidget(covariant ViewDetailAccountScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.loadAccount.removeListener(_onResult);
    widget.viewModel.loadAccount.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.loadAccount.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    setState(() {});
  }

  // ── Role display text (title-case for profile header) ────────────────────
  String _roleDisplayLabel(AccountRole role) {
    switch (role) {
      case AccountRole.coordinator:
        return 'Điều phối viên';
      case AccountRole.guide:
        return 'Hướng dẫn viên';
      case AccountRole.receptionist:
        return 'Lễ tân';
    }
  }

  // ── Handlers ──────────────────────────────────────────────────────────────

  void _onActivate() {
    setState(() => _currentStatus = AccountStatus.active);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Tài khoản đã được kích hoạt'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _onDeactivate() {
    setState(() => _currentStatus = AccountStatus.inactive);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Tài khoản đã bị vô hiệu hóa'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _onDelete(String accountName) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Xóa tài khoản'),
        content: Text(
          'Bạn có chắc muốn xóa tài khoản của $accountName? '
          'Hành động này không thể hoàn tác.',
        ),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Hủy')),
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Xóa', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final cmd = widget.viewModel.loadAccount;

    if (cmd.running) {
      return const Scaffold(
        backgroundColor: AppColors.surface,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (cmd.error) {
      return Scaffold(
        backgroundColor: AppColors.surface,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('Lỗi tải thông tin tài khoản')),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Quay lại'),
            ),
          ],
        ),
      );
    }

    if (cmd.result is! Ok<BusinessAccount>) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('Không tìm thấy tài khoản')),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Quay lại'),
            ),
          ],
        ),
      );
    }

    final account = (cmd.result as Ok<BusinessAccount>).value;
    final displayStatus = _currentStatus ?? account.status;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── App bar ──────────────────────────────────────────────────
              _buildAppBar(context),

              // ── Profile card (white) ─────────────────────────────────────
              _buildProfileCard(account, displayStatus),

              const SizedBox(height: 16),

              // ── Info tiles ───────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _InfoTile(
                      icon: Icons.badge_outlined,
                      label: 'TÊN NHÂN VIÊN',
                      value: account.name,
                    ),
                    const SizedBox(height: 10),
                    _InfoTile(
                      icon: Icons.phone,
                      label: 'SỐ ĐIỆN THOẠI',
                      value: account.email,
                    ),
                    const SizedBox(height: 10),
                    _InfoTile(
                      icon: Icons.email,
                      label: 'EMAIL',
                      value: account.email,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── App bar ───────────────────────────────────────────────────────────────

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.background,
                border: Border.all(color: AppColors.inputBorder),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: AppColors.textPrimary,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Chi tiết tài khoản',
            style: TextStyle(
              fontSize: AppTextTheme.headlineMedium,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  // ── Profile card ──────────────────────────────────────────────────────────

  Widget _buildProfileCard(
    BusinessAccount account,
    AccountStatus displayStatus,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Avatar
          _buildAvatar(account),

          const SizedBox(height: 14),

          // Name
          Text(
            account.name,
            style: TextStyle(
              fontSize: AppTextTheme.headlineSmall,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 4),

          // Role (blue)
          Text(
            _roleDisplayLabel(account.role),
            style: TextStyle(
              fontSize: AppTextTheme.bodyMedium,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 12),

          // Status badge
          _StatusPill(status: displayStatus),

          const SizedBox(height: 20),

          // ── Action buttons ────────────────────────────────────────────
          _buildActionButtons(displayStatus, account.name),
        ],
      ),
    );
  }

  Widget _buildAvatar(BusinessAccount account) {
    if (account.avatarUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          account.avatarUrl!,
          width: 88,
          height: 88,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _defaultAvatar(),
        ),
      );
    }
    return _defaultAvatar();
  }

  Widget _defaultAvatar() {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        color: const Color(0xFF1C3A5E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(Icons.person_rounded, color: Colors.white, size: 48),
    );
  }

  // ── Action buttons ────────────────────────────────────────────────────────

  Widget _buildActionButtons(AccountStatus currentStatus, String accountName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Kích hoạt — filled primary
        ElevatedButton.icon(
          onPressed: currentStatus == AccountStatus.active ? null : _onActivate,
          icon: const Icon(Icons.check_circle_outline_rounded, size: 18),
          label: const Text('Kích hoạt'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            disabledBackgroundColor: AppColors.primaryLight.withValues(
              alpha: 0.4,
            ),
            foregroundColor: Colors.white,
            disabledForegroundColor: Colors.white70,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 13),
            textStyle: TextStyle(
              fontSize: AppTextTheme.bodyLarge,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Vô hiệu hóa — outlined
        OutlinedButton.icon(
          onPressed: currentStatus == AccountStatus.inactive
              ? null
              : _onDeactivate,
          icon: const Icon(Icons.block_rounded, size: 18),
          label: const Text('Vô hiệu hóa'),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primaryDarkBlackBlue,
            side: BorderSide(color: AppColors.primaryDarkBlackBlue),
            padding: const EdgeInsets.symmetric(vertical: 13),
            textStyle: TextStyle(
              fontSize: AppTextTheme.bodyLarge,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Xóa tài khoản — outlined with red icon
        OutlinedButton.icon(
          onPressed: () => _onDelete(accountName),
          icon: Icon(
            Icons.delete_outline_rounded,
            size: 18,
            color: AppColors.error,
          ),
          label: Text(
            'Xóa tài khoản',
            style: TextStyle(color: AppColors.error),
          ),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.error,
            side: BorderSide(color: AppColors.error),
            padding: const EdgeInsets.symmetric(vertical: 13),
            textStyle: TextStyle(
              fontSize: AppTextTheme.bodyLarge,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Status pill badge
// ─────────────────────────────────────────────────────────────────────────────

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.status});

  final AccountStatus status;

  @override
  Widget build(BuildContext context) {
    final isActive = status == AccountStatus.active;
    final label = isActive ? 'ĐANG HOẠT ĐỘNG' : 'NGỪNG HOẠT ĐỘNG';
    final dotColor = isActive ? AppColors.success : AppColors.textSecondary;
    const pillColor = Color(0xFFF0F4FF); // background-tinted chip

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: pillColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: AppTextTheme.bodySmall,
              fontWeight: FontWeight.w700,
              color: AppColors.textSecondary,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Info tile card
// ─────────────────────────────────────────────────────────────────────────────

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, size: 18, color: AppColors.textSecondary),
              Text(
                label,
                style: TextStyle(
                  fontSize: AppTextTheme.bodySmall,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.6,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Value row
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: AppTextTheme.bodyLarge,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
