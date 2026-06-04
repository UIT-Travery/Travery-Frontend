import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/tour/cancel/view_models/cancel_booking_view_model.dart';
import 'package:travery_frontend/ui/user/widgets/user_app_bar.dart';
import 'package:travery_frontend/ui/user/tour/widgets/policy_section.dart';

class CancelBookingScreen extends StatefulWidget {
  const CancelBookingScreen({
    super.key,
    required this.viewModel,
    required this.bookingId,
    this.bookingDetail,
  });

  final CancelBookingViewModel viewModel;
  final String bookingId;
  final dynamic bookingDetail;

  @override
  State<CancelBookingScreen> createState() => _CancelBookingScreenState();
}

class _CancelBookingScreenState extends State<CancelBookingScreen> {
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _accountHolderController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.bookingDetail == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          widget.viewModel.loadBookingDetail(widget.bookingId);
        }
      });
    }
  }

  @override
  void dispose() {
    _reasonController.dispose();
    _bankNameController.dispose();
    _accountNumberController.dispose();
    _accountHolderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFF),
      appBar: const UserAppBar(title: 'Xác nhận hủy tour'),
      body: Consumer<CancelBookingViewModel>(
        builder: (context, vm, _) {
          final booking = widget.bookingDetail ?? vm.bookingDetail;
          final isLoading = widget.bookingDetail == null && vm.isLoading;

          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFDAD6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.warning,
                        size: 32,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Bạn có chắc chắn\nmuốn hủy tour này?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF131B2E),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking?.tourName ?? 'Tour',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF131B2E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: Color(0xFF414755),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _formatDate(booking?.departureDate),
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF414755),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    _RefundRow(
                      label: 'Giá trị đơn hàng',
                      value: _formatPrice(booking?.totalPrice ?? 0),
                    ),
                    const Divider(height: 24),
                    _RefundRow(
                      label: 'Chính sách áp dụng',
                      valueWidget: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Hoàn 100%',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Tổng tiền hoàn trả',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF131B2E),
                          ),
                        ),
                        Text(
                          _formatPrice(booking?.totalPrice ?? 0),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const PolicySection(),

              const SizedBox(height: 24),

              const Text(
                'Lý do hủy *',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF414755),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  controller: _reasonController,
                  maxLines: 4,
                  onChanged: vm.setReason,
                  decoration: const InputDecoration(
                    hintText:
                        'Vui lòng cho chúng tôi biết lý do bạn muốn hủy để chúng tôi có thể phục vụ bạn tốt hơn lần sau...',
                    hintStyle: TextStyle(color: Color(0xFF717786)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.account_balance,
                          size: 18,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Thông tin hoàn tiền',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF131B2E),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Nhập thông tin tài khoản để nhận hoàn tiền',
                      style: TextStyle(fontSize: 12, color: Color(0xFF414755)),
                    ),
                    const SizedBox(height: 16),
                    _BankField(
                      controller: _bankNameController,
                      label: 'Tên ngân hàng',
                      hint: 'VD: Vietcombank',
                      onChanged: vm.setBankName,
                      errorText: vm.bankNameError,
                    ),
                    const SizedBox(height: 12),
                    _BankField(
                      controller: _accountNumberController,
                      label: 'Số tài khoản',
                      hint: 'Nhập số tài khoản',
                      onChanged: vm.setAccountNumber,
                      keyboardType: TextInputType.number,
                      errorText: vm.accountNumberError,
                    ),
                    const SizedBox(height: 12),
                    _BankField(
                      controller: _accountHolderController,
                      label: 'Tên chủ tài khoản',
                      hint: 'Nhập tên chủ tài khoản',
                      onChanged: vm.setAccountHolderName,
                      errorText: vm.accountHolderNameError,
                    ),
                  ],
                ),
              ),

              if (vm.error != null) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEE2E2),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFFECACA)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 18,
                        color: Color(0xFFDC2626),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          vm.error!,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF991B1B),
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              const SizedBox(height: 120),
            ],
          );
        },
      ),
      bottomNavigationBar: Consumer<CancelBookingViewModel>(
        builder: (context, vm, _) {
          return Container(
            padding: EdgeInsets.fromLTRB(
              20,
              16,
              20,
              MediaQuery.of(context).padding.bottom + 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 20,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: vm.isCancelling ? null : () => context.pop(),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Quay lại',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: vm.isCancelling
                        ? null
                        : () => _onCancel(context, vm),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: vm.isCancelling
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : const Text(
                            'Xác nhận hủy',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _onCancel(
    BuildContext context,
    CancelBookingViewModel vm,
  ) async {
    final booking = widget.bookingDetail ?? vm.bookingDetail;
    final bookingStatus = booking?.status ?? 'PENDING';

    if (!vm.canSubmitWithBank(bookingStatus)) {
      String msg;
      if (bookingStatus == 'PAID') {
        if (vm.bankName.trim().isEmpty ||
            vm.accountNumber.trim().isEmpty ||
            vm.accountHolderName.trim().isEmpty) {
          msg =
              'Vui lòng nhập đầy đủ thông tin tài khoản ngân hàng để nhận hoàn tiền';
        } else {
          msg = 'Vui lòng nhập lý do hủy tour (ít nhất 3 ký tự)';
        }
      } else {
        msg = 'Vui lòng nhập lý do hủy tour (ít nhất 3 ký tự)';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: Colors.white,
                size: 14,
              ),
              const SizedBox(width: 8),
              Expanded(child: Text(msg)),
            ],
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.all(10),
        ),
      );
      return;
    }

    final navigator = GoRouter.of(context);
    final success = await vm.submitCancellation(widget.bookingId);

    if (!context.mounted) return;

    if (success) {
      final cancelData = vm.cancelData;
      navigator.pushReplacement(
        Routes.cancellationSuccess,
        extra: {
          'bookingId': widget.bookingId,
          'tourName': booking?.tourName ?? '',
          'refundAmount': cancelData?.refundAmount ?? 0,
          'refundPercentage': cancelData?.refundPercentage ?? 0,
        },
      );
    } else if (vm.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.white, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Text(vm.error!, style: const TextStyle(fontSize: 14)),
              ),
            ],
          ),
          backgroundColor: const Color(0xFFDC2626),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(16),
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }
}

class _RefundRow extends StatelessWidget {
  const _RefundRow({required this.label, this.value, this.valueWidget});

  final String label;
  final String? value;
  final Widget? valueWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Color(0xFF414755)),
        ),
        valueWidget ??
            Text(
              value ?? '',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF131B2E),
              ),
            ),
      ],
    );
  }
}

class _BankField extends StatelessWidget {
  const _BankField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.errorText,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null && errorText!.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: hasError ? Colors.red : const Color(0xFF414755),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: hasError ? Colors.red : const Color(0xFFE8EAF0),
            ),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Color(0xFF9CA3AF),
                fontSize: 13,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
            ),
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: const TextStyle(fontSize: 11, color: Colors.red),
          ),
        ],
      ],
    );
  }
}
