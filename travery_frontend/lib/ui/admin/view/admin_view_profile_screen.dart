import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/admin/view/widgets/small_button.dart';
import 'package:travery_frontend/ui/admin/view_model/admin_profile_view_model.dart';
import 'package:travery_frontend/routing/routes.dart';

class AdminViewProfileScreen extends StatefulWidget {
  const AdminViewProfileScreen({super.key, required this.viewModel});
  final AdminProfileViewModel viewModel;

  @override
  State<AdminViewProfileScreen> createState() => _AdminViewProfileScreenState();
}

class _AdminViewProfileScreenState extends State<AdminViewProfileScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.logout.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant AdminViewProfileScreen oldWidget) {
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
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/placeholder_avatar.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 100,
                  height: 100,
                  color: AppColors.primary.withValues(alpha: 0.1),
                  child: const Icon(
                    Icons.person,
                    size: 50,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '',
              style: TextStyle(
                fontSize: AppTextTheme.headlineLarge,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '',
              style: TextStyle(
                fontSize: AppTextTheme.bodyMedium,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                  Text(
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
            _buildInfoCard(
              title: 'TÊN NHÂN VIÊN',
              value: '',
              icon: Icons.badge_outlined,
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              title: 'SỐ ĐIỆN THOẠI',
              value: '',
              icon: Icons.phone_outlined,
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              title: 'EMAIL',
              value: '',
              icon: Icons.email_outlined,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: SmallButton(
                label: 'Chỉnh sửa thông tin cá nhân',
                color: const Color(0xFF0D47A1), // Blue
                height: 48,
                onTap: () {
                  context.push('/admin/update-profile');
                },
              ),
            ),
            const SizedBox(height: 12),
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
