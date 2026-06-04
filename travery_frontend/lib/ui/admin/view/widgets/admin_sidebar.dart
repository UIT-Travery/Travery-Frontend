import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/services/api/model/profile/profile_response/profile_response.dart';
import 'package:travery_frontend/ui/admin/view_model/admin_profile_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart';
import '../../../core/themes/app_colors.dart';

class AdminSidebar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final VoidCallback onLogout;

  const AdminSidebar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: SafeArea(child: _buildContent(context)),
    );
  }

  Widget _buildContent(BuildContext context) {
    final profileViewModel = context.read<AdminProfileViewModel>();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListenableBuilder(
              listenable: profileViewModel.loadProfile,
              builder: (context, _) {
                String fullName = 'Đang tải...';
                String email = '';
                String? avatarUrl;

                final result = profileViewModel.loadProfile.result;
                if (result is Ok<ProfileData>) {
                  fullName = result.value.fullName;
                  email = result.value.email;
                  avatarUrl = result.value.avatarUrl;
                }

                return Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: avatarUrl != null && avatarUrl.isNotEmpty
                          ? NetworkImage(avatarUrl)
                          : const NetworkImage('https://i.pravatar.cc/150?img=11'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fullName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            email,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 11,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Travery',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const Divider(height: 1, color: Colors.black12),
          const SizedBox(height: 16),
          // Menu Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildMenuItem(
                  icon: Icons.home_outlined,
                  title: 'Dashboard',
                  index: 0,
                ),
                _buildMenuItem(
                  icon: Icons.outlined_flag,
                  title: 'Quản lý tour',
                  index: 1,
                ),
                _buildMenuItem(
                  icon: Icons.directions_car_outlined,
                  title: 'Quản lý xe và tài xế',
                  index: 2,
                ),
                _buildMenuItem(
                  icon: Icons.face,
                  title: 'Quản lý tài khoản nội bộ',
                  index: 3,
                ),
                _buildMenuItem(
                  icon: Icons.bed_outlined,
                  title: 'Quản lý khách sạn',
                  index: 4,
                ),
                _buildMenuItem(
                  icon: Icons.hot_tub_outlined,
                  title: 'Quản lý cơ sở vật chất',
                  index: 5,
                ),
                _buildMenuItem(
                  icon: Icons.chat_bubble_outline,
                  title: 'Hộp thoại',
                  index: 6,
                ),
                _buildMenuItem(
                  icon: Icons.person_2_outlined,
                  title: 'Tài khoản người dùng',
                  index: 7,
                ),
                const SizedBox(height: 32),
                _buildLogoutItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required int index,
  }) {
    final isSelected = currentIndex == index;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey.shade200 : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black87, size: 24),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
            fontSize: 14,
          ),
        ),
        onTap: () => onTap(index),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        dense: true,
      ),
    );
  }

  Widget _buildLogoutItem() {
    return ListTile(
      leading: const Icon(Icons.logout, color: Colors.red, size: 24),
      title: const Text(
        'Đăng xuất',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
      onTap: onLogout,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      dense: true,
    );
  }
}
