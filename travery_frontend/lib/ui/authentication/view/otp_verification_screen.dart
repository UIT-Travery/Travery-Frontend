import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/utils/alert.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_theme.dart';
import '../../core/widgets/loading_overlay.dart';
import 'package:travery_frontend/utils/core_result.dart' as core;
import 'widgets/auth_button.dart';
import '../view_models/otp_verification_view_model.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({
    super.key,
    required this.viewModel,
    required this.email,
    this.password,
    this.confirmPassword,
  });

  final OtpVerificationViewModel viewModel;
  final String email;
  final String? password;
  final String? confirmPassword;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.verifyOtp.addListener(_onVerifyOtpResult);
    widget.viewModel.resendOtp.addListener(_onResendOtpResult);
    widget.viewModel.confirmPassword.addListener(_onConfirmPasswordResult);
  }

  @override
  void didUpdateWidget(covariant OtpVerificationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.verifyOtp.removeListener(_onVerifyOtpResult);
    oldWidget.viewModel.resendOtp.removeListener(_onResendOtpResult);
    oldWidget.viewModel.confirmPassword.removeListener(
      _onConfirmPasswordResult,
    );
    widget.viewModel.verifyOtp.addListener(_onVerifyOtpResult);
    widget.viewModel.resendOtp.addListener(_onResendOtpResult);
    widget.viewModel.confirmPassword.addListener(_onConfirmPasswordResult);
  }

  @override
  void dispose() {
    widget.viewModel.verifyOtp.removeListener(_onVerifyOtpResult);
    widget.viewModel.resendOtp.removeListener(_onResendOtpResult);
    widget.viewModel.confirmPassword.removeListener(_onConfirmPasswordResult);
    _otpController.dispose();
    super.dispose();
  }

  void _onVerifyOtpResult() {
    if (widget.viewModel.verifyOtp.completed) {
      widget.viewModel.verifyOtp.clearResult();
      Utils.showSuccessNotification(context, 'Xác thực OTP thành công');
      context.push(Routes.login);
    }
    if (widget.viewModel.verifyOtp.error) {
      final result = widget.viewModel.verifyOtp.result;
      String errorMessage = 'Xác thực OTP thất bại';
      if (result is core.Error) {
        errorMessage = (result).error.toString().replaceAll(
          'HttpException: ',
          '',
        );
      }
      widget.viewModel.verifyOtp.clearResult();
      Utils.showErrorNotification(context, errorMessage);
    }
  }

  void _onResendOtpResult() {
    if (widget.viewModel.resendOtp.completed) {
      widget.viewModel.resendOtp.clearResult();
      Utils.showSuccessNotification(context, 'Đã gửi lại mã OTP');
    }
    if (widget.viewModel.resendOtp.error) {
      final result = widget.viewModel.resendOtp.result;
      String errorMessage = 'Gửi lại OTP thất bại';
      if (result is core.Error) {
        errorMessage = result.error.toString().replaceAll(
          'HttpException: ',
          '',
        );
      }
      widget.viewModel.resendOtp.clearResult();
      Utils.showErrorNotification(context, errorMessage);
    }
  }

  void _onConfirmPasswordResult() {
    if (widget.viewModel.confirmPassword.completed) {
      widget.viewModel.confirmPassword.clearResult();
      Utils.showSuccessNotification(context, 'Xác thực OTP thành công');
      context.push(Routes.login);
    }
    if (widget.viewModel.confirmPassword.error) {
      final result = widget.viewModel.confirmPassword.result;
      String errorMessage = 'Xác thực OTP thất bại';
      if (result is core.Error) {
        errorMessage = result.error.toString().replaceAll(
          'HttpException: ',
          '',
        );
      }
      widget.viewModel.confirmPassword.clearResult();
      Utils.showErrorNotification(context, errorMessage);
    }
  }

  void _handleVerifyOtp() {
    final otp = _otpController.text.trim();
    if (otp.length != 6) {
      Utils.showErrorNotification(context, 'Vui lòng nhập đủ 6 số OTP');
      return;
    }
    widget.viewModel.verifyOtp.execute((widget.email, otp));
  }

  void _handleResendOtp() {
    widget.viewModel.resendOtp.execute(widget.email);
  }

  void _handleConfirmPassword() {
    final otp = _otpController.text.trim();
    if (otp.length != 6) {
      Utils.showErrorNotification(context, 'Vui lòng nhập đủ 6 số OTP');
      return;
    }
    widget.viewModel.confirmPassword.execute((
      widget.email,
      otp,
      widget.confirmPassword!,
      widget.password!,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        widget.viewModel.verifyOtp,
        widget.viewModel.resendOtp,
        widget.viewModel.confirmPassword,
      ]),
      builder: (context, child) {
        return LoadingOverlay(
          isLoading:
              widget.viewModel.verifyOtp.running ||
              widget.viewModel.resendOtp.running ||
              widget.viewModel.confirmPassword.running,
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
                        'Bạn chưa nhận được mã? ',
                        style: TextStyle(
                          fontSize: AppTextTheme.bodyLarge,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      InkWell(
                        onTap: _handleResendOtp,
                        child: Text(
                          'Gửi lại mã',
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
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => context.pop(),
                      ),

                      Text(
                        'Xác thực OTP',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Nhập mã OTP đã được gửi đến email:\n${widget.email}',
                        style: TextStyle(
                          fontSize: AppTextTheme.bodyLarge,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ),

                      const SizedBox(height: 24),

                      Center(
                        child: Pinput(
                          controller: _otpController,
                          length: 6,
                          keyboardType: TextInputType.number,
                          pinAnimationType: PinAnimationType.fade,
                          defaultPinTheme: PinTheme(
                            width: 56,
                            height: 56,
                            textStyle: TextStyle(
                              fontSize: AppTextTheme.headlineLarge,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.inputBackground,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.inputBorder),
                            ),
                          ),
                          focusedPinTheme: PinTheme(
                            width: 56,
                            height: 56,
                            textStyle: TextStyle(
                              fontSize: AppTextTheme.headlineLarge,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.inputBackground,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.inputBorderFocused,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      AuthButton(
                        title: 'Xác thực',
                        onPressed: widget.password != null
                            ? _handleConfirmPassword
                            : _handleVerifyOtp,
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
