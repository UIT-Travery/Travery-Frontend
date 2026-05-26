import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/admin/view/widgets/input_text_field.dart';
import 'package:travery_frontend/ui/admin/view/widgets/small_button.dart';
import 'package:travery_frontend/ui/admin/view_model/admin_profile_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CoordinatorUpdateProfileScreen extends StatefulWidget {
  const CoordinatorUpdateProfileScreen({super.key, required this.viewModel});
  final AdminProfileViewModel viewModel;

  @override
  State<CoordinatorUpdateProfileScreen> createState() =>
      _CoordinatorUpdateProfileScreenState();
}

class _CoordinatorUpdateProfileScreenState
    extends State<CoordinatorUpdateProfileScreen> {
  final TextEditingController _emailController = TextEditingController(
    text: 'coordinator20@gmail.com',
  );
  final TextEditingController _nameController = TextEditingController(
    text: 'Nguyen Van A',
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '0942555321',
  );
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Add listener if there is an update command in future
  }

  @override
  void didUpdateWidget(covariant CoordinatorUpdateProfileScreen oldWidget) {
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

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
      );
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
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
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: statusBarHeight + 16, bottom: 24),
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
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
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
                      const SizedBox(width: 65), // To balance the back button
                    ],
                  ),
                  const SizedBox(height: 16),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: _imageFile != null
                              ? Image.file(
                                  _imageFile!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/placeholder_avatar.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                        width: 100,
                                        height: 100,
                                        color: Colors.white.withValues(
                                          alpha: 0.2,
                                        ),
                                        child: const Icon(
                                          Icons.person,
                                          size: 50,
                                          color: Colors.white,
                                        ),
                                      ),
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: -4,
                        right: -4,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            padding: const EdgeInsets.all(6),
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
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
          ],
        ),
      ),
    );
  }
}
