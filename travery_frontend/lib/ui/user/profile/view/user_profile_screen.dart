import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/services/api/model/profile/profile_response/profile_response.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/profile/view_model/profile_view_model.dart';
import 'package:travery_frontend/ui/user/widgets/user_app_bar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  ProfileViewModel? _viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _viewModel = context.read<ProfileViewModel>();
      _viewModel!.loadProfile.addListener(_onLoadProfileStateChanged);
      _viewModel!.logout.addListener(_onLogoutResult);
      _viewModel!.loadProfile.execute();
    });
  }

  @override
  void dispose() {
    _viewModel?.loadProfile.removeListener(_onLoadProfileStateChanged);
    _viewModel?.logout.removeListener(_onLogoutResult);
    super.dispose();
  }

  void _onLoadProfileStateChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  void _onLogoutResult() {
    final viewModel = _viewModel;
    if (viewModel != null && viewModel.logout.completed) {
      viewModel.logout.clearResult();
      if (mounted) {
        context.go(Routes.login);
      }
    }
  }

  Future<void> _handleLogout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Đăng xuất'),
        content: const Text('Bạn có chắc chắn muốn đăng xuất không?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Hủy'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Đăng xuất'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      _viewModel?.logout.execute();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: UserAppBar(title: 'Hồ sơ', showBackButton: context.canPop()),
      body: Consumer<ProfileViewModel>(
        builder: (context, viewModel, _) {
          if (viewModel.loadProfile.running && viewModel.profile == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.loadProfile.error || viewModel.profile == null) {
            return _ProfileErrorState(
              message: 'Không thể tải thông tin hồ sơ',
              onRetry: () => viewModel.loadProfile.execute(),
            );
          }

          return RefreshIndicator(
            onRefresh: () async => viewModel.loadProfile.execute(),
            color: AppColors.primary,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
              children: [
                _ProfileHeader(profile: viewModel.profile!),
                const SizedBox(height: 18),
                _ProfileInfoCard(profile: viewModel.profile!),
                const SizedBox(height: 18),
                _LogoutButton(
                  isLoading: viewModel.logout.running,
                  onPressed: _handleLogout,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.profile});

  final ProfileData profile;

  @override
  Widget build(BuildContext context) {
    final displayName = profile.fullName.isNotEmpty
        ? profile.fullName
        : 'Người dùng';

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 92,
            height: 92,
            child: ClipOval(
              child: profile.avatarUrl.isNotEmpty
                  ? Image.network(
                      profile.avatarUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => _DefaultAvatar(),
                    )
                  : _DefaultAvatar(),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            displayName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            _roleLabel(profile.role),
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoCard extends StatelessWidget {
  const _ProfileInfoCard({required this.profile});

  final ProfileData profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          _InfoRow(
            icon: Icons.badge_outlined,
            label: 'Họ và tên',
            value: _valueOrEmpty(profile.fullName),
          ),
          const Divider(height: 22),
          _InfoRow(
            icon: Icons.email_outlined,
            label: 'Email',
            value: _valueOrEmpty(profile.email),
          ),
          const Divider(height: 22),
          _InfoRow(
            icon: Icons.phone_outlined,
            label: 'Số điện thoại',
            value: _valueOrEmpty(profile.phoneNumber),
          ),
          const Divider(height: 22),
          _InfoRow(
            icon: Icons.verified_user_outlined,
            label: 'Trạng thái',
            value: _statusLabel(profile.status),
          ),
          const Divider(height: 22),
          _InfoRow(
            icon: Icons.person_pin_outlined,
            label: 'Vai trò',
            value: _roleLabel(profile.role),
          ),
          const Divider(height: 22),
          _InfoRow(
            icon: Icons.event_outlined,
            label: 'Ngày tạo',
            value: _formatDateTime(profile.createdAt),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primary, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF64748B),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF1E293B),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton({required this.isLoading, required this.onPressed});

  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: isLoading
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : const Icon(Icons.logout),
        label: const Text('Đăng xuất'),
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.error,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class _ProfileErrorState extends StatelessWidget {
  const _ProfileErrorState({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48, color: AppColors.error),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 14),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Tải lại'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DefaultAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surfaceContainerHigh,
      child: const Icon(Icons.person, size: 46, color: AppColors.primary),
    );
  }
}

String _valueOrEmpty(String value) {
  return value.trim().isEmpty ? 'Chưa cập nhật' : value.trim();
}

String _statusLabel(String status) {
  return switch (status.toUpperCase()) {
    'ACTIVE' => 'Đang hoạt động',
    'INACTIVE' => 'Không hoạt động',
    'BLOCKED' => 'Đã khóa',
    _ => _valueOrEmpty(status),
  };
}

String _roleLabel(String role) {
  final normalized = role.replaceFirst('ROLE_', '').toUpperCase();
  return switch (normalized) {
    'TOURIST' => 'Khách du lịch',
    'GUIDE' => 'Hướng dẫn viên',
    'ADMIN' => 'Quản trị viên',
    'COORDINATOR' => 'Điều phối viên',
    'RECEPTIONIST' => 'Lễ tân',
    _ => _valueOrEmpty(normalized),
  };
}

String _formatDateTime(String value) {
  final date = DateTime.tryParse(value);
  if (date == null) return _valueOrEmpty(value);
  final local = date.toLocal();
  final day = local.day.toString().padLeft(2, '0');
  final month = local.month.toString().padLeft(2, '0');
  return '$day/$month/${local.year}';
}
