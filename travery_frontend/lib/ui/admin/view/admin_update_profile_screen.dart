import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/admin/view/widgets/input_text_field.dart';
import 'package:travery_frontend/ui/admin/view/widgets/small_button.dart';
import 'package:travery_frontend/ui/admin/view_model/admin_profile_view_model.dart';

class AdminUpdateProfileScreen extends StatefulWidget {
  const AdminUpdateProfileScreen({super.key, required this.viewModel});
  final AdminProfileViewModel viewModel;

  @override
  State<AdminUpdateProfileScreen> createState() =>
      _AdminUpdateProfileScreenState();
}

class _AdminUpdateProfileScreenState extends State<AdminUpdateProfileScreen> {
  final TextEditingController _emailController = TextEditingController(
    text: 'coordinator20@gmail.com',
  );
  final TextEditingController _nameController = TextEditingController(
    text: 'Nguyen Van A',
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '0942555321',
  );

  @override
  void initState() {
    super.initState();
    // Add listener if there is an update command in future
  }

  @override
  void didUpdateWidget(covariant AdminUpdateProfileScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update listener if there is an update command in future
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onResult() {
    // Handle results from viewModel commands
  }

  void _handleUpdate() {
    final phoneError = widget.viewModel.validatePhoneNumber(
      _phoneController.text,
    );

    if (phoneError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(phoneError),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    // Success logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Cập nhật thành công'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
      ),
    );
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: const SizedBox.shrink(),
        leadingWidth: 0,
        title: Row(
          children: [
            const Icon(Icons.grid_view, color: AppColors.primary),
            const SizedBox(width: 8),
            Text(
              'Travery Admin',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: AppTextTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Stack(
              children: [
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
                Positioned(
                  bottom: -4,
                  right: -4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            InputTextField(
              label: 'Email',
              textholder: 'Nhập email',
              controller: _emailController,
              textInputType: TextInputType.emailAddress,
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: AppColors.textPrimary,
              ),
              suffixIcon: const Icon(
                Icons.edit,
                color: AppColors.textSecondary,
                size: 20,
              ),
            ),
            const SizedBox(height: 16),
            InputTextField(
              label: 'Họ và tên',
              textholder: 'Nhập họ và tên',
              controller: _nameController,
              textInputType: TextInputType.name,
              prefixIcon: const Icon(
                Icons.person_outline,
                color: AppColors.textPrimary,
              ),
              suffixIcon: const Icon(
                Icons.edit,
                color: AppColors.textSecondary,
                size: 20,
              ),
            ),
            const SizedBox(height: 16),
            InputTextField(
              label: 'Số điện thoại',
              textholder: 'Nhập số điện thoại',
              controller: _phoneController,
              textInputType: TextInputType.phone,
              prefixIcon: const Icon(
                Icons.phone_outlined,
                color: AppColors.textPrimary,
              ),
              suffixIcon: const Icon(
                Icons.edit,
                color: AppColors.textSecondary,
                size: 20,
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: SmallButton(
                label: 'Xác nhận chỉnh sửa',
                color: const Color(0xFF0D47A1), // Blue
                height: 48,
                onTap: _handleUpdate,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: SmallButton(
                label: 'Hủy bỏ',
                color: const Color(0xFFB71C1C), // Red
                height: 48,
                onTap: () => context.pop(),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
