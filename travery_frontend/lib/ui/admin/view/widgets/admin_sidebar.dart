import 'package:flutter/material.dart';
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
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=11',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Trí tiên sinh',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'minhtri2416@gmail.com',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 11,
                        ),
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
                  icon: Icons.door_front_door_outlined,
                  title: 'Quản lý loại phòng',
                  index: 5,
                ),
                _buildMenuItem(
                  icon: Icons.hot_tub_outlined,
                  title: 'Quản lý cơ sở vật chất',
                  index: 6,
                ),
                _buildMenuItem(
                  icon: Icons.chat_bubble_outline,
                  title: 'Hộp thoại',
                  index: 7,
                ),
                _buildMenuItem(
                  icon: Icons.person_2_outlined,
                  title: 'Tài khoản người dùng',
                  index: 8,
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
