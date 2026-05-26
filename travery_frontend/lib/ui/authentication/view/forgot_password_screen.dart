import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/utils/alert.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_theme.dart';
import '../../core/widgets/loading_overlay.dart';
import 'package:travery_frontend/utils/core_result.dart' as core;
import 'widgets/auth_button.dart';
import 'widgets/auth_text_field.dart';
import '../view_models/forgot_password_view_model.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key, required this.viewModel});

  final ForgotPasswordViewModel viewModel;

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.forgotPassword.addListener(_onForgotPasswordResult);
  }

  @override
  void didUpdateWidget(covariant ForgotPasswordScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.forgotPassword.removeListener(_onForgotPasswordResult);
    widget.viewModel.forgotPassword.addListener(_onForgotPasswordResult);
  }

  @override
  void dispose() {
    widget.viewModel.forgotPassword.removeListener(_onForgotPasswordResult);
    _contactController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onForgotPasswordResult() {
    if (widget.viewModel.forgotPassword.completed) {
      widget.viewModel.forgotPassword.clearResult();
      Utils.showSuccessNotification(
        context,
        'Đã gửi yêu cầu. Vui lòng kiểm tra email hoặc điện thoại của bạn.',
      );
      context.push(
        Routes.otp,
        extra: {
          'email': _contactController.text,
          'password': _passwordController.text,
          'confirmPassword': _confirmPasswordController.text,
        },
      );
    }
    if (widget.viewModel.forgotPassword.error) {
      final result = widget.viewModel.forgotPassword.result;
      String errorMessage = 'Gửi yêu cầu thất bại';
      if (result is core.Error) {
        errorMessage = result.error.toString().replaceAll(
          'HttpException: ',
          '',
        );
      }
      widget.viewModel.forgotPassword.clearResult();
      Utils.showErrorNotification(context, errorMessage);
    }
  }

  void _handleSendRequest() {
    final contact = _contactController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (contact.isEmpty) {
      Utils.showErrorNotification(
        context,
        'Vui lòng nhập email hoặc số điện thoại',
      );
      return;
    }

    if (password.isEmpty) {
      Utils.showErrorNotification(context, 'Vui lòng nhập mật khẩu');
      return;
    }

    if (password.length < 8) {
      Utils.showErrorNotification(context, 'Mật khẩu phải có ít nhất 8 kí tự');
      return;
    }

    if (confirmPassword.isEmpty) {
      Utils.showErrorNotification(context, 'Vui lòng nhập lại mật khẩu');
      return;
    }

    if (confirmPassword != password) {
      Utils.showErrorNotification(context, 'Mật khẩu không khớp');
      return;
    }

    widget.viewModel.forgotPassword.execute(contact);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel.forgotPassword,
      builder: (context, child) {
        return LoadingOverlay(
          isLoading: widget.viewModel.forgotPassword.running,
          child: Scaffold(
            backgroundColor: AppColors.surface,
            bottomNavigationBar: SafeArea(
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Text(
                    'Chúng tôi sẽ gửi một liên kết đặt lại mật khẩu hoặc mã OTP trực tiếp đến thông tin bạn đã cung cấp.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppTextTheme.bodySmall,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textHint,
                    ),
                  ),
                ),
              ),
            ),

            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => context.pop(),
                      ),

                      const SizedBox(height: 24),

                      // Tiêu đề
                      Text(
                        'Quên mật khẩu?',
                        style: TextStyle(
                          fontSize: AppTextTheme.headlineLarge,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Mô tả
                      Text(
                        'Đừng lo lắng, hãy nhập email hoặc số điện thoại để nhận mã OTP khôi phục.',
                        style: TextStyle(
                          fontSize: AppTextTheme.bodyLarge,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Ô nhập email / số điện thoại
                      AuthTextField(
                        controller: _contactController,
                        title: 'Email',
                        hintText: 'travery@example.com',
                        isPassword: false,
                        prefixIcon: Icons.email_outlined,
                      ),

                      const SizedBox(height: 16),

                      AuthTextField(
                        controller: _passwordController,
                        title: 'Mật khẩu mới',
                        hintText: '••••••••',
                        isPassword: true,
                        prefixIcon: Icons.lock_outline,
                      ),

                      const SizedBox(height: 16),

                      // Ô xác nhận mật khẩu
                      AuthTextField(
                        controller: _confirmPasswordController,
                        title: 'Xác nhận mật khẩu',
                        hintText: '••••••••',
                        isPassword: true,
                        prefixIcon: Icons.lock_reset,
                      ),

                      const SizedBox(height: 24),

                      // Nút gửi yêu cầu
                      AuthButton(
                        title: 'Gửi yêu cầu',
                        onPressed: _handleSendRequest,
                      ),

                      const SizedBox(height: 24),

                      // Divider "HOẶC"
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(color: AppColors.inputBorder),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'HOẶC',
                              style: TextStyle(
                                fontSize: AppTextTheme.bodySmall,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textSecondary,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(color: AppColors.inputBorder),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Link Quay lại Đăng nhập
                      Center(
                        child: InkWell(
                          onTap: () => context.go(Routes.login),
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            child: Text(
                              'Quay lại Đăng nhập',
                              style: TextStyle(
                                fontSize: AppTextTheme.bodyLarge,
                                fontWeight: FontWeight.bold,
                                color: AppColors.link,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
