import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/profile/view_model/profile_view_model.dart';

class UserChangePasswordScreen extends StatefulWidget {
  const UserChangePasswordScreen({super.key});

  @override
  State<UserChangePasswordScreen> createState() =>
      _UserChangePasswordScreenState();
}

class _UserChangePasswordScreenState extends State<UserChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  int _passwordStrength = 0; // 0-3

  @override
  void initState() {
    super.initState();
    _newPasswordController.addListener(_updatePasswordStrength);
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _updatePasswordStrength() {
    final password = _newPasswordController.text;
    int strength = 0;

    if (password.isEmpty) {
      strength = 0;
    } else if (password.length < 6) {
      strength = 1; // Weak
    } else if (password.length < 10) {
      strength = 2; // Medium
    } else {
      strength = 3; // Strong
    }

    setState(() {
      _passwordStrength = strength;
    });
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final viewModel = context.read<ProfileViewModel>();
      viewModel.setCurrentPassword(_currentPasswordController.text);
      viewModel.setNewPassword(_newPasswordController.text);
      viewModel.setConfirmPassword(_confirmPasswordController.text);
      viewModel.changePassword.execute();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Đổi mật khẩu',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<ProfileViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Mật khẩu đã được cập nhật'),
                  backgroundColor: AppColors.success,
                ),
              );
              viewModel.clearMessages();
              context.pop();
            });
          }

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

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 32),

                  // Lock Icon
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.lock_reset,
                      color: AppColors.primary,
                      size: 48,
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Vui lòng nhập mật khẩu hiện tại và mật khẩu mới để thay đổi.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: AppColors.secondary),
                  ),

                  const SizedBox(height: 32),

                  // Current Password
                  _buildPasswordField(
                    controller: _currentPasswordController,
                    label: 'Mật khẩu hiện tại',
                    hint: '••••••••',
                    obscureText: _obscureCurrentPassword,
                    toggleObscure: () {
                      setState(() {
                        _obscureCurrentPassword = !_obscureCurrentPassword;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập mật khẩu hiện tại';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  // New Password
                  _buildPasswordField(
                    controller: _newPasswordController,
                    label: 'Mật khẩu mới',
                    hint: '••••••••',
                    obscureText: _obscureNewPassword,
                    toggleObscure: () {
                      setState(() {
                        _obscureNewPassword = !_obscureNewPassword;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập mật khẩu mới';
                      }
                      if (value.length < 8) {
                        return 'Mật khẩu phải có ít nhất 8 ký tự';
                      }
                      return null;
                    },
                    showStrengthIndicator: true,
                  ),

                  // Password Strength Indicator
                  if (_newPasswordController.text.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    _buildStrengthIndicator(),
                  ],

                  const SizedBox(height: 24),

                  // Confirm Password
                  _buildPasswordField(
                    controller: _confirmPasswordController,
                    label: 'Xác nhận mật khẩu mới',
                    hint: '••••••••',
                    obscureText: _obscureConfirmPassword,
                    toggleObscure: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng xác nhận mật khẩu mới';
                      }
                      if (value != _newPasswordController.text) {
                        return 'Mật khẩu xác nhận không khớp';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 32),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: viewModel.isLoading ? null : _handleSubmit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: viewModel.isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Cập nhật mật khẩu',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.sync, size: 20),
                              ],
                            ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Security Message
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceBlue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.shield,
                          color: AppColors.primary,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Bảo mật tài khoản',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Sử dụng mật khẩu mạnh bao gồm chữ cái, số và ký tự đặc biệt để bảo vệ tài khoản của bạn.',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textPrimary.withValues(
                                    alpha: 0.8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required bool obscureText,
    required VoidCallback toggleObscure,
    required String? Function(String?) validator,
    bool showStrengthIndicator = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
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
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
                color: AppColors.outline,
                size: 20,
              ),
              onPressed: toggleObscure,
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
              borderSide: BorderSide(color: AppColors.primary, width: 2),
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

  Widget _buildStrengthIndicator() {
    Color color1 = AppColors.surfaceContainerHighest;
    Color color2 = AppColors.surfaceContainerHighest;
    Color color3 = AppColors.surfaceContainerHighest;

    if (_passwordStrength >= 1) {
      color1 = AppColors.error;
    }
    if (_passwordStrength >= 2) {
      color1 = AppColors.warning;
      color2 = AppColors.warning;
    }
    if (_passwordStrength >= 3) {
      color1 = AppColors.success;
      color2 = AppColors.success;
      color3 = AppColors.success;
    }

    return Row(
      children: [
        Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 4,
            decoration: BoxDecoration(
              color: color1,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 4,
            decoration: BoxDecoration(
              color: color2,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 4,
            decoration: BoxDecoration(
              color: color3,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ],
    );
  }
}
