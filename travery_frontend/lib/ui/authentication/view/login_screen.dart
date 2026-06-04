import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/core/widgets/loading_overlay.dart';
import 'package:travery_frontend/utils/core_result.dart' as core;
import 'widgets/auth_text_field.dart';
import 'widgets/auth_button.dart';
import 'package:travery_frontend/utils/alert.dart';
import 'package:travery_frontend/ui/authentication/view_models/login_view_model.dart';
import 'package:travery_frontend/routing/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.viewModel});
  final LoginViewModel viewModel;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.loginViaEmail.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant LoginScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.loginViaEmail.removeListener(_onResult);
    widget.viewModel.loginViaEmail.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.loginViaEmail.removeListener(_onResult);
    super.dispose();
  }

  void _navigateToRegister() {
    context.push(Routes.register);
  }

  void _onResult() {
    if (!mounted) return;

    final command = widget.viewModel.loginViaEmail;
    
    if (command.completed) {
      final role = widget.viewModel.userRole;
      debugPrint("LoginScreen: Login completed successfully. Role: $role");
      
      // Clear result and remove listener immediately to prevent any further callbacks
      // during the navigation process
      command.clearResult();
      command.removeListener(_onResult);
      
      if (mounted) {
        Utils.showSuccessNotification(context, 'Đăng nhập thành công');
        _navigateByRole(role);
      }
    }
    
    if (command.error) {
      final result = command.result;
      debugPrint("LoginScreen: Login failed. Result: $result");
      
      String errorMessage = 'Đăng nhập thất bại';
      if (result is core.Error) {
        errorMessage = result.error.toString().replaceAll(
          'HttpException: ',
          '',
        );
      }
      
      command.clearResult();
      
      if (mounted) {
        Utils.showErrorNotification(context, errorMessage);
      }
    }
  }

  void _navigateByRole(String? role) {
    debugPrint("LoginScreen: Navigating by role: $role");
    
    if (!mounted) return;

    final targetRoute = _getRouteForRole(role);
    debugPrint("LoginScreen: Target route: $targetRoute");
    
    context.go(targetRoute);
  }

  String _getRouteForRole(String? role) {
    switch (role) {
      case 'ROLE_ADMIN':
        return Routes.adminMain;
      case 'ROLE_COORDINATOR':
        return Routes.coordinatorMain;
      case 'ROLE_GUIDE':
        return Routes.guideHome;
      case 'ROLE_TOURIST':
      default:
        return Routes.tourHome;
    }
  }

  Future<void> _handleLogin() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty) {
      Utils.showErrorNotification(context, 'Vui lòng nhập email');
      return;
    }

    if (password.isEmpty) {
      Utils.showErrorNotification(context, 'Vui lòng nhập mật khẩu');
      return;
    }

    if (password.length < 8) {
      Utils.showErrorNotification(context, 'Mật khẩu phải có ít nhất 8 ký tự');
      return;
    }

    // Re-add listener in case it was removed by a previous attempt or result
    widget.viewModel.loginViaEmail.removeListener(_onResult);
    widget.viewModel.loginViaEmail.addListener(_onResult);
    
    widget.viewModel.loginViaEmail.execute((email, password));
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel.loginViaEmail,
      builder: (context, child) {
        return LoadingOverlay(
          isLoading: widget.viewModel.loginViaEmail.running,
          child: Scaffold(
            backgroundColor: AppColors.surface,
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 48,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bạn chưa có tài khoản? ',
                        style: TextStyle(
                          fontSize: AppTextTheme.bodyLarge,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      InkWell(
                        onTap: _navigateToRegister,
                        child: Text(
                          'Đăng ký',
                          style: TextStyle(
                            fontSize: AppTextTheme.bodyLarge,
                            fontWeight: FontWeight.bold,
                            color: AppColors.link,
                          ),
                        ),
                      ),
                    ],
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
                      const SizedBox(height: 80),
                      Text(
                        'Travery',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Chào mừng trở lại',
                        style: TextStyle(
                          fontSize: AppTextTheme.headlineLarge,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Bắt đầu cuộc hành trình khám phá thế giới của riêng bạn.',
                        style: TextStyle(
                          fontSize: AppTextTheme.bodyLarge,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ),

                      const SizedBox(height: 24),
                      AuthTextField(
                        title: 'Email',
                        hintText: 'Nhập email của bạn',
                        isPassword: false,
                        prefixIcon: Icons.email,
                        controller: emailController,
                      ),

                      const SizedBox(height: 16),
                      AuthTextField(
                        title: 'Mật khẩu',
                        hintText: 'Nhập mật khẩu của bạn',
                        isPassword: true,
                        prefixIcon: Icons.lock,
                        controller: passwordController,
                      ),

                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => context.push(Routes.forgotPassword),
                            child: Text(
                              'Quên mật khẩu?',
                              style: TextStyle(
                                color: AppColors.link,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      AuthButton(title: 'Đăng nhập', onPressed: _handleLogin),
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
