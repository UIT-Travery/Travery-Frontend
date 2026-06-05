import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/authentication/widgets/role_option_card.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  int selectedRoleId = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  RoleOptionCard(
                    id: 1,
                    title: 'Khách hàng',
                    description:
                        'Khám phá và đặt các chuyến đi mơ ước của bạn một cách dễ dàng.',
                    icon: Icons.person,
                    isSelected: selectedRoleId == 1,
                    onTap: () => setState(() => selectedRoleId = 1),
                  ),
                  const SizedBox(height: 12),
                  RoleOptionCard(
                    id: 2,
                    title: 'Điều phối viên',
                    description:
                        'Quản lý lịch trình, phân bổ nhân sự và vận hành các tour du lịch chuyên nghiệp.',
                    icon: Icons.hub,
                    isSelected: selectedRoleId == 2,
                    onTap: () => setState(() => selectedRoleId = 2),
                  ),
                  const SizedBox(height: 12),
                  RoleOptionCard(
                    id: 3,
                    title: 'Hướng dẫn viên',
                    description:
                        'Kết nối với khách du lịch, chia sẻ kiến thức và dẫn dắt các hành trình trải nghiệm.',
                    icon: Icons.map,
                    isSelected: selectedRoleId == 3,
                    onTap: () => setState(() => selectedRoleId = 3),
                  ),
                ],
              ),
            ),
            _buildBottomAction(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TRAVERY',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w900,
              fontSize: 20,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Chào mừng bạn!',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Vui lòng chọn vai trò của bạn để bắt đầu hành trình.',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAction() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: () => _navigateToRole(selectedRoleId),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            elevation: 2,
            shadowColor: AppColors.primary.withValues(alpha: 0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tiếp tục',
                style: TextStyle(
                  fontSize: AppTextTheme.buttonMedium,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 6),
              Icon(Icons.arrow_forward, size: 18),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToRole(int roleId) {
    switch (roleId) {
      case 1:
        context.go('/tour-home');
        break;
      case 2:
        context.go('/coordinator-main');
        break;
      case 3:
        context.go('/guide/home');
        break;
    }
  }
}
