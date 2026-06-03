import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/ui/admin/view_model/create_account_view_model.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_theme.dart';
import 'widgets/account_input_field.dart';
import 'widgets/role_selector.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Default role options
// ─────────────────────────────────────────────────────────────────────────────

final _roleOptions = [
  const RoleOption(
    value: 'guide',
    label: 'Hướng dẫn viên',
    icon: Icons.explore_outlined,
  ),
  const RoleOption(
    value: 'coordinator',
    label: 'Điều phối viên',
    icon: Icons.hub_outlined,
  ),
  const RoleOption(
    value: 'receptionist',
    label: 'Lễ tân',
    icon: Icons.desk_outlined,
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// Screen
// ─────────────────────────────────────────────────────────────────────────────

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key, required this.viewModel});
  final CreateAccountViewModel viewModel;

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _employeeIdController = TextEditingController();

  // State
  bool _isActive = true;
  String? _selectedRole;

  @override
  void initState() {
    super.initState();
    // Listen to command result to navigate on success
    widget.viewModel.createAccount.addListener(_onCommandChanged);
  }

  @override
  void dispose() {
    widget.viewModel.createAccount.removeListener(_onCommandChanged);
    _nameController.dispose();
    _emailController.dispose();
    _employeeIdController.dispose();
    super.dispose();
  }

  void _onCommandChanged() {
    final cmd = widget.viewModel.createAccount;
    if (cmd.completed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã tạo tài khoản: ${_nameController.text}'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      context.pop();
    } else if (cmd.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Không thể tạo tài khoản. Vui lòng thử lại.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _onSave() {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedRole == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng chọn vai trò cho tài khoản'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    widget.viewModel.createAccount.execute((
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      employeeId: _employeeIdController.text.trim(),
      role: _selectedRole!,
      isActive: _isActive,
    ));
  }

  void _onCancel() => context.pop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── App bar ────────────────────────────────────────────────
                _buildAppBar(),

                const SizedBox(height: 20),

                // ── Page header ────────────────────────────────────────────
                Text(
                  'ADMINISTRATION CONSOLE',
                  style: TextStyle(
                    fontSize: AppTextTheme.bodySmall,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textSecondary,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tạo tài khoản',
                  style: TextStyle(
                    fontSize: AppTextTheme.headlineLarge,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 12),

                // ── Account status toggle ──────────────────────────────────
                _buildStatusToggle(),

                const SizedBox(height: 20),

                // ── Basic info card ────────────────────────────────────────
                _buildBasicInfoCard(),

                const SizedBox(height: 20),

                // ── Role selector card ─────────────────────────────────────
                RoleSelector(
                  options: _roleOptions,
                  selectedValue: _selectedRole,
                  onChanged: (value) => setState(() => _selectedRole = value),
                ),

                const SizedBox(height: 24),

                _buildBottomBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── App bar ────────────────────────────────────────────────────────────────
  Widget _buildAppBar() {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.grid_view_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'Travery Admin',
          style: TextStyle(
            fontSize: AppTextTheme.headlineMedium,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  // ── Status toggle row ──────────────────────────────────────────────────────
  Widget _buildStatusToggle() {
    return Row(
      children: [
        Text(
          'Trạng thái tài khoản',
          style: TextStyle(
            fontSize: AppTextTheme.bodyMedium,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 10),
        Switch(
          value: _isActive,
          onChanged: (value) => setState(() => _isActive = value),
          activeTrackColor: AppColors.primaryDarkBlackBlue,
          thumbColor: WidgetStateProperty.all(Colors.white),
        ),
        const SizedBox(width: 6),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            fontSize: AppTextTheme.bodySmall,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
            color: _isActive
                ? AppColors.primaryDarkBlackBlue
                : AppColors.textSecondary,
          ),
          child: Text(_isActive ? 'ĐANG HOẠT ĐỘNG' : 'NGỪNG HOẠT ĐỘNG'),
        ),
      ],
    );
  }

  // ── Basic info card ────────────────────────────────────────────────────────
  Widget _buildBasicInfoCard() {
    return Container(
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
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Row(
            children: [
              const Icon(
                Icons.description_outlined,
                size: 20,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Thông tin cơ bản',
                style: TextStyle(
                  fontSize: AppTextTheme.bodyLarge,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Full name
          AccountInputField(
            label: 'Họ và tên',
            hint: 'Nhập họ và tên...',
            controller: _nameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: (v) => (v == null || v.trim().isEmpty)
                ? 'Vui lòng nhập họ và tên'
                : null,
          ),

          const SizedBox(height: 16),

          // Email
          AccountInputField(
            label: 'Địa chỉ Email',
            hint: 'Nhập email...',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'Vui lòng nhập email';
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) {
                return 'Email không hợp lệ';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // Employee ID
          AccountInputField(
            label: 'Mã nhân viên',
            hint: 'VD: TRV-2024-001',
            controller: _employeeIdController,
            textInputAction: TextInputAction.done,
            validator: (v) => (v == null || v.trim().isEmpty)
                ? 'Vui lòng nhập mã nhân viên'
                : null,
          ),
        ],
      ),
    );
  }

  // ── Bottom action bar ──────────────────────────────────────────────────────
  Widget _buildBottomBar() {
    return ListenableBuilder(
      listenable: widget.viewModel.createAccount,
      builder: (context, _) {
        final isRunning = widget.viewModel.createAccount.running;
        return Container(
          color: AppColors.surface,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ).copyWith(bottom: 14 + MediaQuery.of(context).padding.bottom),
          child: Row(
            children: [
              // Cancel
              Expanded(
                child: TextButton(
                  onPressed: isRunning ? null : _onCancel,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    'Hủy bỏ',
                    style: TextStyle(
                      fontSize: AppTextTheme.bodyLarge,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryDarkBlackBlue,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Save
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: isRunning ? null : _onSave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDarkBlackBlue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  child: isRunning
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          'Lưu thay đổi',
                          style: TextStyle(
                            fontSize: AppTextTheme.bodyLarge,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
