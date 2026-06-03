import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/admin/view/widgets/small_button.dart';
import 'package:travery_frontend/ui/admin/view_model/admin_profile_view_model.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/data/services/api/model/profile/profile_response/profile_response.dart';
import 'package:travery_frontend/utils/core_result.dart';

class CoordinatorViewProfileScreen extends StatefulWidget {
  const CoordinatorViewProfileScreen({super.key, required this.viewModel});
  final AdminProfileViewModel viewModel;

  @override
  State<CoordinatorViewProfileScreen> createState() =>
      _CoordinatorViewProfileScreenState();
}

class _CoordinatorViewProfileScreenState
    extends State<CoordinatorViewProfileScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.logout.addListener(_onResult);
    if (widget.viewModel.loadProfile.result == null) {
      widget.viewModel.loadProfile.execute();
    }
  }

  @override
  void didUpdateWidget(covariant CoordinatorViewProfileScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.logout.removeListener(_onResult);
    widget.viewModel.logout.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.logout.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    if (widget.viewModel.logout.completed) {
      widget.viewModel.logout.clearResult();
      if (mounted) {
        context.go(Routes.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: ListenableBuilder(
        listenable: widget.viewModel.loadProfile,
        builder: (context, _) {
          final isRunning = widget.viewModel.loadProfile.running;
          final result = widget.viewModel.loadProfile.result;
          ProfileData? profile;
          if (result is Ok<ProfileData>) {
            profile = result.value;
          }

          if (isRunning && profile == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: statusBarHeight + 16,
                    bottom: 24,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 16),
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () => context.pop(),
                          ),
                          const Expanded(
                            child: Text(
                              'Cài đặt',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: AppTextTheme.headlineMedium,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 65,
                          ), // To balance the back button
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: profile?.avatarUrl.isNotEmpty == true
                              ? Image.network(
                                  profile!.avatarUrl,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      _buildAvatarPlaceholder(),
                                )
                              : Image.asset(
                                  'assets/images/placeholder_avatar.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      _buildAvatarPlaceholder(),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  profile?.fullName ?? 'Đang tải...',
                  style: const TextStyle(
                    fontSize: AppTextTheme.headlineLarge,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Điều phối viên',
                  style: TextStyle(
                    fontSize: AppTextTheme.bodyMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        'ĐANG HOẠT ĐỘNG',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      _buildInfoCard(
                        title: 'TÊN NHÂN VIÊN',
                        value: profile?.fullName ?? 'Đang tải...',
                        icon: Icons.badge_outlined,
                      ),
                      const SizedBox(height: 12),
                      _buildInfoCard(
                        title: 'SỐ ĐIỆN THOẠI',
                        value: profile?.phoneNumber ?? 'Đang tải...',
                        icon: Icons.phone_outlined,
                      ),
                      const SizedBox(height: 12),
                      _buildInfoCard(
                        title: 'EMAIL',
                        value: profile?.email ?? 'Đang tải...',
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 32),
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: SmallButton(
                      //     label: 'Chỉnh sửa thông tin cá nhân',
                      //     color: const Color(0xFF0D47A1), // Blue
                      //     height: 48,
                      //     onTap: () {
                      //       context.push(Routes.coordinatorUpdateProfile).then((_) {
                      //         widget.viewModel.loadProfile.execute();
                      //       });
                      //     },
                      //   ),
                      // ),
                      // const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: SmallButton(
                          label: 'Đăng xuất',
                          color: const Color(0xFFB71C1C), // Red
                          height: 48,
                          prefixIcon: const Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: 18,
                          ),
                          onTap: () {
                            widget.viewModel.logout.execute();
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAvatarPlaceholder() {
    return Container(
      width: 100,
      height: 100,
      color: Colors.white.withValues(alpha: 0.2),
      child: const Icon(Icons.person, size: 50, color: Colors.white),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 20, color: AppColors.textSecondary),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(
              fontSize: AppTextTheme.bodyLarge,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
