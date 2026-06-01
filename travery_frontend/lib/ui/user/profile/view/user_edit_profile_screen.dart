import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/profile/view_model/profile_view_model.dart';

class UserEditProfileScreen extends StatefulWidget {
  const UserEditProfileScreen({super.key});

  @override
  State<UserEditProfileScreen> createState() => _UserEditProfileScreenState();
}

class _UserEditProfileScreenState extends State<UserEditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passportController = TextEditingController();
  final _dobController = TextEditingController();
  String _selectedGender = 'MALE';
  String? _avatarPath;
  final _picker = ImagePicker();
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<ProfileViewModel>();
      viewModel.loadProfile.execute();
    });
  }

  void _initializeControllers(ProfileViewModel viewModel) {
    if (!_isInitialized && viewModel.profile != null) {
      _nameController.text = viewModel.profile!.fullName;
      _phoneController.text = viewModel.profile!.phoneNumber;
      _passportController.text = viewModel.profile!.passportNumber ?? '';
      if (viewModel.profile!.dateOfBirth != null) {
        _dobController.text = viewModel.profile!.dateOfBirth!;
      }
      if (viewModel.profile!.gender != null) {
        _selectedGender = viewModel.profile!.gender!;
      }
      _isInitialized = true;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passportController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _avatarPath = pickedFile.path;
      });
      if (mounted) {
        context.read<ProfileViewModel>().updateAvatarFile(pickedFile.path);
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime(1990);
    if (_dobController.text.isNotEmpty) {
      try {
        final parts = _dobController.text.split('-');
        if (parts.length == 3) {
          initialDate = DateTime(
            int.parse(parts[0]),
            int.parse(parts[1]),
            int.parse(parts[2]),
          );
        }
      } catch (_) {}
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dobController.text =
            '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      });
    }
  }

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      final viewModel = context.read<ProfileViewModel>();
      viewModel.setFullName(_nameController.text);
      viewModel.setPhoneNumber(_phoneController.text);
      viewModel.setPassportNumber(_passportController.text);
      viewModel.setDateOfBirth(_dobController.text);
      viewModel.setGender(_selectedGender);
      viewModel.updateProfile.execute();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Chỉnh sửa hồ sơ',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<ProfileViewModel>(
        builder: (context, viewModel, child) {
          _initializeControllers(viewModel);

          // Handle update success
          if (viewModel.isUpdateSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Cập nhật thành công'),
                  backgroundColor: AppColors.success,
                ),
              );
              viewModel.clearMessages();
              context.pop();
            });
          }

          // Handle error
          if (viewModel.errorMessage != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(viewModel.errorMessage!),
                  backgroundColor: AppColors.error,
                ),
              );
              viewModel.clearMessages();
            });
          }

          // Show loading while profile is being loaded
          if (viewModel.loadProfile.running || viewModel.profile == null) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          return Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 24),

                      // Avatar Section
                      _buildAvatarSection(viewModel),

                      const SizedBox(height: 32),

                      // Full Name
                      _buildTextField(
                        label: 'Họ và tên',
                        controller: _nameController,
                        hint: 'Nhập họ tên',
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập họ tên';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // Phone Number
                      _buildTextField(
                        label: 'Số điện thoại',
                        controller: _phoneController,
                        hint: 'Nhập số điện thoại',
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập số điện thoại';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // Date of Birth & Gender
                      Row(
                        children: [
                          Expanded(child: _buildDateField()),
                          const SizedBox(width: 16),
                          Expanded(child: _buildGenderField()),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Passport Number
                      _buildTextField(
                        label: 'Số hộ chiếu (Passport)',
                        controller: _passportController,
                        hint: 'Nhập số hộ chiếu',
                        keyboardType: TextInputType.text,
                      ),

                      const SizedBox(height: 16),

                      // Email (Read-only)
                      _buildReadOnlyField(
                        label: 'Email',
                        value: viewModel.profile?.email ?? '',
                      ),

                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),

              // Fixed Bottom Button
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.surface.withValues(alpha: 0.8),
                  ),
                  child: SafeArea(
                    child: ElevatedButton(
                      onPressed: viewModel.updateProfile.running
                          ? null
                          : _handleSave,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: viewModel.updateProfile.running
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'Lưu thay đổi',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAvatarSection(ProfileViewModel viewModel) {
    final avatarUrl = viewModel.profile?.avatarUrl ?? '';
    final hasLocalAvatar = _avatarPath != null;

    return Column(
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: Stack(
            children: [
              Container(
                width: 112,
                height: 112,
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
                  child: hasLocalAvatar
                      ? Image.file(File(_avatarPath!), fit: BoxFit.cover)
                      : avatarUrl.isNotEmpty
                      ? Image.network(
                          avatarUrl,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) =>
                              _buildDefaultAvatar(),
                        )
                      : _buildDefaultAvatar(),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Thay đổi ảnh đại diện',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
            letterSpacing: 0.05,
          ),
        ),
      ],
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      color: AppColors.surfaceGray,
      child: const Icon(Icons.person, size: 56, color: AppColors.primary),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
            letterSpacing: 0.05,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.outlineVariant),
            filled: true,
            fillColor: AppColors.surfaceGray,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.error, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.error, width: 2),
            ),
          ),
          style: const TextStyle(fontSize: 14, color: AppColors.textPrimary),
        ),
      ],
    );
  }

  Widget _buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ngày sinh',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
            letterSpacing: 0.05,
          ),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: AbsorbPointer(
            child: TextFormField(
              controller: _dobController,
              decoration: InputDecoration(
                hintText: 'Chọn ngày sinh',
                hintStyle: const TextStyle(color: AppColors.outlineVariant),
                filled: true,
                fillColor: AppColors.surfaceGray,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                suffixIcon: const Icon(
                  Icons.calendar_today,
                  color: AppColors.secondary,
                  size: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Giới tính',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
            letterSpacing: 0.05,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.surfaceGray,
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedGender,
              isExpanded: true,
              icon: const Icon(Icons.expand_more, color: AppColors.secondary),
              items: const [
                DropdownMenuItem(value: 'MALE', child: Text('Nam')),
                DropdownMenuItem(value: 'FEMALE', child: Text('Nữ')),
                DropdownMenuItem(value: 'OTHER', child: Text('Khác')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedGender = value ?? 'MALE';
                });
              },
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textPrimary,
              ),
              dropdownColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReadOnlyField({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.secondary,
            letterSpacing: 0.05,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          initialValue: value,
          readOnly: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.surfaceContainerLow,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            suffixIcon: const Icon(
              Icons.lock,
              color: AppColors.outline,
              size: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          style: const TextStyle(fontSize: 14, color: AppColors.secondary),
        ),
        const SizedBox(height: 4),
        const Text(
          'Email không thể thay đổi để đảm bảo bảo mật tài khoản.',
          style: TextStyle(fontSize: 11, color: AppColors.secondary),
        ),
      ],
    );
  }
}
