import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/profile/view_model/profile_view_model.dart';

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

  void _handleLogout() async {
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
          TextButton(
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
      backgroundColor: AppColors.surface,
      body: Consumer<ProfileViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.loadProfile.running) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.loadProfile.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.grey),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      viewModel.errorMessage ?? 'Không thể tải thông tin',
                      style: const TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => viewModel.loadProfile.execute(),
                    child: const Text('Thử lại'),
                  ),
                ],
              ),
            );
          }

          if (viewModel.profile == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person_off, size: 48, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text(
                    'Vui lòng đăng nhập để xem hồ sơ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => viewModel.loadProfile.execute(),
                    child: const Text('Thử lại'),
                  ),
                ],
              ),
            );
          }

          final profile = viewModel.profile!;
          final roleDisplay = profile.role.replaceAll('ROLE_', '');

          return CustomScrollView(
            slivers: [
              // Top AppBar
              SliverAppBar(
                floating: true,
                backgroundColor: AppColors.surface,
                elevation: 0,
                centerTitle: true,
                title: const Text(
                  'Hồ sơ',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),

                      // Avatar Section
                      _buildAvatarSection(profile.avatarUrl),

                      const SizedBox(height: 16),

                      // Name & Role
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  profile.fullName.isNotEmpty
                                      ? profile.fullName
                                      : 'Người dùng',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  roleDisplay,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            profile.email,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Menu List
                      _buildMenuCard([
                        _MenuItem(
                          icon: Icons.person_outline,
                          title: 'Chỉnh sửa hồ sơ',
                          onTap: () => context.push(Routes.userEditProfile),
                        ),
                        _MenuItem(
                          icon: Icons.lock_outline,
                          title: 'Đổi mật khẩu',
                          onTap: () => context.push(Routes.userChangePassword),
                        ),
                        _MenuItem(
                          icon: Icons.tune,
                          title: 'Cài đặt',
                          onTap: () => context.push(Routes.userSettings),
                        ),
                      ]),

                      const SizedBox(height: 24),

                      // Logout Button
                      _buildLogoutButton(),

                      const SizedBox(height: 24),

                      // Footer
                      _buildFooter(),

                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAvatarSection(String avatarUrl) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 128,
            height: 128,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipOval(
              child: avatarUrl.isNotEmpty
                  ? Image.network(
                      avatarUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildDefaultAvatar(),
                    )
                  : _buildDefaultAvatar(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      color: AppColors.surfaceContainerHigh,
      child: const Icon(Icons.person, size: 64, color: AppColors.primary),
    );
  }

  Widget _buildMenuCard(List<_MenuItem> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Column(
            children: [
              if (index > 0) const Divider(height: 1, indent: 72),
              _buildMenuListTile(item),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMenuListTile(_MenuItem item) {
    return InkWell(
      onTap: item.onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.surfaceBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(item.icon, color: AppColors.primary, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                item.title,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.outline),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return InkWell(
      onTap: _handleLogout,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.errorContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.logout, color: AppColors.error, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                'Đăng xuất',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward, color: AppColors.error),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        const Text(
          'Version 1.0.0',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.outline,
            letterSpacing: 0.05,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFooterLink('Chính sách bảo mật'),
            const Text(
              ' • ',
              style: TextStyle(color: AppColors.outlineVariant),
            ),
            _buildFooterLink('Điều khoản dịch vụ'),
          ],
        ),
      ],
    );
  }

  Widget _buildFooterLink(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 11, color: AppColors.outlineVariant),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  _MenuItem({required this.icon, required this.title, required this.onTap});
}
