import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travery_frontend/data/services/api/model/profile/profile_response/profile_response.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/admin/view/widgets/input_text_field.dart';
import 'package:travery_frontend/ui/admin/view/widgets/small_button.dart';
import 'package:travery_frontend/ui/admin/view_model/admin_profile_view_model.dart';
import 'package:travery_frontend/utils/alert.dart';
import 'package:travery_frontend/utils/core_result.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key, required this.viewModel});
  final AdminProfileViewModel viewModel;

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadProfile.addListener(_onResult);
    widget.viewModel.updateProfile.addListener(_onResult);
    widget.viewModel.updateAvatar.addListener(_onResult);
    widget.viewModel.loadProfile.execute();
  }

  @override
  void didUpdateWidget(covariant UpdateProfileScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.loadProfile.removeListener(_onResult);
      oldWidget.viewModel.updateProfile.removeListener(_onResult);
      oldWidget.viewModel.updateAvatar.removeListener(_onResult);
      widget.viewModel.loadProfile.addListener(_onResult);
      widget.viewModel.updateProfile.addListener(_onResult);
      widget.viewModel.updateAvatar.addListener(_onResult);
    }
  }

  @override
  void dispose() {
    widget.viewModel.loadProfile.removeListener(_onResult);
    widget.viewModel.updateProfile.removeListener(_onResult);
    widget.viewModel.updateAvatar.removeListener(_onResult);
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onResult() {
    if (!mounted) return;

    final loadResult = widget.viewModel.loadProfile.result;
    if (loadResult is Ok<ProfileData>) {
      if (_emailController.text.isEmpty) {
        _emailController.text = loadResult.value.email;
        _nameController.text = loadResult.value.fullName;
        _phoneController.text = loadResult.value.phoneNumber;
      }
    }

    final updateResult = widget.viewModel.updateProfile.result;
    if (updateResult != null) {
      if (updateResult is Ok<ProfileData>) {
        Utils.showSuccessNotification(context, 'Cập nhật thành công');
        widget.viewModel.updateProfile.clearResult();
        context.pop();
      } else if (updateResult is Error<ProfileData>) {
        Utils.showErrorNotification(
          context,
          updateResult.error.toString(),
        );
        widget.viewModel.updateProfile.clearResult();
      }
    }

    final avatarResult = widget.viewModel.updateAvatar.result;
    if (avatarResult != null) {
      if (avatarResult is Ok<ProfileData>) {
        Utils.showSuccessNotification(context, 'Cập nhật thành công');
        widget.viewModel.updateAvatar.clearResult();
      } else if (avatarResult is Error<ProfileData>) {
        Utils.showErrorNotification(
          context,
          avatarResult.error.toString(),
        );
        widget.viewModel.updateAvatar.clearResult();
      }
    }
  }

  void _handleUpdate() {
    final phoneError = widget.viewModel.validatePhoneNumber(
      _phoneController.text,
    );

    if (phoneError != null) {
      Utils.showErrorNotification(context, phoneError);
      return;
    }

    widget.viewModel.updateProfile.execute((
      fullName: _nameController.text,
      phoneNumber: _phoneController.text,
    ));
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      widget.viewModel.updateAvatar.execute(image.path);
    }
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
      body: ListenableBuilder(
        listenable: widget.viewModel.loadProfile,
        builder: (context, _) {
          final running = widget.viewModel.loadProfile.running ||
              widget.viewModel.updateProfile.running ||
              widget.viewModel.updateAvatar.running;

          String? avatarUrl;
          final loadResult = widget.viewModel.loadProfile.result;
          if (loadResult is Ok<ProfileData>) {
            avatarUrl = loadResult.value.avatarUrl;
          }

          return Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: _pickImage,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: avatarUrl != null && avatarUrl.isNotEmpty
                                ? Image.network(
                                    avatarUrl,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        Container(
                                      width: 100,
                                      height: 100,
                                      color: AppColors.primary.withValues(
                                          alpha: 0.1),
                                      child: const Icon(
                                        Icons.person,
                                        size: 50,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 100,
                                    height: 100,
                                    color:
                                        AppColors.primary.withValues(alpha: 0.1),
                                    child: const Icon(
                                      Icons.person,
                                      size: 50,
                                      color: AppColors.primary,
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
      if (running)
        Container(
          color: Colors.black12,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
    ],
          );
        },
      ),
    );
  }
}
