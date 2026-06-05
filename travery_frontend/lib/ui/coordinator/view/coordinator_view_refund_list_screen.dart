import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:travery_frontend/utils/command.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import '../view_models/coordinator_refund_list_view_model.dart';
import '../../../data/services/api/model/coordinator/refund_response/refund_response.dart';

class CoordinatorViewRefundListScreen extends StatefulWidget {
  final CoordinatorRefundListViewModel viewModel;

  const CoordinatorViewRefundListScreen({
    super.key,
    required this.viewModel,
  });

  @override
  State<CoordinatorViewRefundListScreen> createState() =>
      _CoordinatorViewRefundListScreenState();
}

class _CoordinatorViewRefundListScreenState
    extends State<CoordinatorViewRefundListScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(_onViewModelChange);
  }

  @override
  void dispose() {
    widget.viewModel.removeListener(_onViewModelChange);
    super.dispose();
  }

  void _onViewModelChange() {
    setState(() {});
    
    if (widget.viewModel.processRefund.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(widget.viewModel.processRefund.errorMessage!)),
      );
      widget.viewModel.processRefund.clearResult();
    }
    
    if (widget.viewModel.rejectRefund.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(widget.viewModel.rejectRefund.errorMessage!)),
      );
      widget.viewModel.rejectRefund.clearResult();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 12),
          Expanded(
            child: widget.viewModel.loadRefunds.running
                ? const Center(child: CircularProgressIndicator())
                : widget.viewModel.refunds.isEmpty
                    ? const Center(child: Text('Không có yêu cầu hoàn tiền nào'))
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        itemCount: widget.viewModel.refunds.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final refund = widget.viewModel.refunds[index];
                          return _buildRefundCard(refund);
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, statusBarHeight + 16, 16, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDarkBlackBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            'Danh sách hoàn tiền',
            style: TextStyle(
              fontSize: AppTextTheme.headlineSmall,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRefundCard(RefundResponse refund) {
    final currencyFormatter = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
    final formattedAmount = currencyFormatter.format(refund.requestedAmount);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    refund.userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  formattedAmount,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Email: ${refund.userEmail}'),
            const SizedBox(height: 4),
            Text('Loại: ${refund.bookingType == "TOUR_BOOKING" ? "Tour" : refund.bookingType == "HOTEL_BOOKING" ? "Khách sạn" : "Khác"}'),
            const SizedBox(height: 4),
            Text('Lý do: ${refund.customerReason ?? "Không có"}'),
            if (refund.bankName != null) ...[
              const SizedBox(height: 4),
              Text('Ngân hàng: ${refund.bankName} - ${refund.accountNumber}'),
            ],
            const SizedBox(height: 16),
            if (refund.actualRefunded == null && refund.rejectReason == null)
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                      ),
                      onPressed: widget.viewModel.rejectRefund.running || widget.viewModel.processRefund.running
                          ? null
                          : () => _showRejectDialog(refund),
                      child: const Text('Từ chối'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: widget.viewModel.rejectRefund.running || widget.viewModel.processRefund.running
                          ? null
                          : () => _showProcessDialog(refund),
                      child: const Text('Chấp nhận'),
                    ),
                  ),
                ],
              )
            else if (refund.actualRefunded != null)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Đã hoàn: ${currencyFormatter.format(refund.actualRefunded)}',
                      style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            else if (refund.rejectReason != null)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.cancel, color: Colors.red, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Đã từ chối: ${refund.rejectReason}',
                        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showProcessDialog(RefundResponse refund) {
    final TextEditingController amountController = TextEditingController(text: refund.requestedAmount.toInt().toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Chấp nhận hoàn tiền'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Nhập số tiền thực tế hoàn lại:'),
              const SizedBox(height: 12),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Số tiền',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                final amount = double.tryParse(amountController.text);
                if (amount != null && amount > 0) {
                  Navigator.pop(context);
                  widget.viewModel.processRefund.execute(refund.id, amount);
                }
              },
              child: const Text('Xác nhận'),
            ),
          ],
        );
      },
    );
  }

  void _showRejectDialog(RefundResponse refund) {
    final TextEditingController reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Từ chối hoàn tiền'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Nhập lý do từ chối:'),
              const SizedBox(height: 12),
              TextField(
                controller: reasonController,
                decoration: const InputDecoration(
                  labelText: 'Lý do',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                final reason = reasonController.text.trim();
                if (reason.isNotEmpty) {
                  Navigator.pop(context);
                  widget.viewModel.rejectRefund.execute(refund.id, reason);
                }
              },
              child: const Text('Từ chối'),
            ),
          ],
        );
      },
    );
  }
}
