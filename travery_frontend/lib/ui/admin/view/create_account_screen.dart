import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/ui/admin/view_model/create_account_view_model.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_theme.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
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

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _guideLicenseController = TextEditingController();

  // State
  bool _isActive = true;
  String? _selectedRole;
  String? _selectedHotelId;
  String? _avatarPath;

  @override
  void initState() {
    super.initState();
    // Listen to command result to navigate on success
    widget.viewModel.createAccount.addListener(_onCommandChanged);
    widget.viewModel.loadHotels.execute();
  }

  @override
  void dispose() {
    widget.viewModel.createAccount.removeListener(_onCommandChanged);
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _guideLicenseController.dispose();
    super.dispose();
  }

  Future<void> _pickAvatar() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _avatarPath = pickedFile.path;
      });
    }
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
      context.pop(true);
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

    if (_selectedRole == 'receptionist' && _selectedHotelId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng chọn khách sạn'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    widget.viewModel.createAccount.execute((
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      role: _selectedRole!,
      isActive: _isActive,
      guideLicense: _selectedRole == 'guide'
          ? _guideLicenseController.text.trim()
          : null,
      hotelId: _selectedRole == 'receptionist' ? _selectedHotelId : null,
      avatarPath: _avatarPath,
    ));
  }

  void _onCancel() => context.pop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Page header ────────────────────────────────────────────

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

                // ── Avatar picker ──────────────────────────────────────────
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.2),
                            width: 2,
                          ),
                          image: _avatarPath != null
                              ? DecorationImage(
                                  image: FileImage(File(_avatarPath!)),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: _avatarPath == null
                            ? const Icon(
                                Icons.person,
                                size: 50,
                                color: AppColors.textSecondary,
                              )
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: _pickAvatar,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // ── Account status toggle ──────────────────────────────────
                _buildStatusToggle(),

                const SizedBox(height: 20),

                // ── Role selector card ─────────────────────────────────────
                RoleSelector(
                  options: _roleOptions,
                  selectedValue: _selectedRole,
                  onChanged: (value) => setState(() {
                    _selectedRole = value;
                    if (value != 'guide') _guideLicenseController.clear();
                    if (value != 'receptionist') _selectedHotelId = null;
                  }),
                ),

                const SizedBox(height: 20),

                // ── Basic info card ────────────────────────────────────────
                ListenableBuilder(
                  listenable: widget.viewModel.loadHotels,
                  builder: (context, _) {
                    return _buildBasicInfoCard();
                  },
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

          // Password
          AccountInputField(
            label: 'Mật khẩu',
            hint: 'Nhập mật khẩu...',
            controller: _passwordController,
            textInputAction: TextInputAction.done,
            obscureText: true,
            validator: (v) => (v == null || v.trim().isEmpty)
                ? 'Vui lòng nhập mật khẩu'
                : null,
          ),

          if (_selectedRole == 'guide') ...[
            const SizedBox(height: 16),
            AccountInputField(
              label: 'Giấy phép hướng dẫn viên',
              hint: 'Nhập số giấy phép...',
              controller: _guideLicenseController,
              textInputAction: TextInputAction.done,
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Vui lòng nhập giấy phép'
                  : null,
            ),
          ],

          if (_selectedRole == 'receptionist') ...[
            const SizedBox(height: 16),
            Text(
              'Khách sạn',
              style: TextStyle(
                fontSize: AppTextTheme.bodyMedium,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: _selectedHotelId,
              hint: widget.viewModel.loadHotels.running
                  ? const Text('Đang tải danh sách...')
                  : const Text('Chọn khách sạn'),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.inputBorder),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.inputBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
              ),
              items: widget.viewModel.hotels.map((h) {
                return DropdownMenuItem<String>(
                  value: h.id,
                  child: Text(
                    h.name,
                    style: TextStyle(color: AppColors.textPrimary),
                  ),
                );
              }).toList(),
              onChanged: (val) => setState(() => _selectedHotelId = val),
              validator: (v) => v == null ? 'Vui lòng chọn khách sạn' : null,
            ),
          ],
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
