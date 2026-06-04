import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travery_frontend/data/services/api/model/receptionist/check_out_preview_response.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/widgets/loading_overlay.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_large_button.dart';
import 'package:travery_frontend/ui/receptionist/view_models/recep_view_detail_booking_view_model.dart';

class RecepViewBookingBillScreen extends StatefulWidget {
  final CheckOutPreviewResponse? checkOutPreviewData;
  final RecepViewDetailBookingViewModel? viewModel;

  const RecepViewBookingBillScreen({
    super.key,
    this.checkOutPreviewData,
    this.viewModel,
  });

  @override
  State<RecepViewBookingBillScreen> createState() =>
      _RecepViewBookingBillScreenState();
}

class _RecepViewBookingBillScreenState extends State<RecepViewBookingBillScreen> {
  final currencyFormatter = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');

  @override
  void initState() {
    super.initState();
    widget.viewModel?.confirmCheckOut.addListener(_onConfirmResult);
  }

  @override
  void dispose() {
    widget.viewModel?.confirmCheckOut.removeListener(_onConfirmResult);
    super.dispose();
  }

  void _onConfirmResult() {
    if (widget.viewModel?.confirmCheckOut.error == true) {
      // Handled by detail screen if it's still alive? Actually better to handle here.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.viewModel?.confirmCheckOut.errorMessage ?? 'Có lỗi xảy ra',
          ),
        ),
      );
    } else if (widget.viewModel?.confirmCheckOut.completed == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Hoàn tất trả phòng thành công!')),
      );
      Navigator.pop(context); // Go back to detail
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.checkOutPreviewData;

    if (data == null || widget.viewModel == null) {
      return const Scaffold(
        body: Center(child: Text('Không có dữ liệu hóa đơn')),
      );
    }

    return ListenableBuilder(
      listenable: widget.viewModel!.confirmCheckOut,
      builder: (context, child) {
        return LoadingOverlay(
          isLoading: widget.viewModel!.confirmCheckOut.running,
          child: Scaffold(
            backgroundColor: AppColors.surface,
            appBar: AppBar(
              backgroundColor: AppColors.surface,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                onPressed: () => Navigator.pop(context),
              ),
              title: const Text(
                'Hóa đơn tạm tính',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSummaryCard(data),
                          const SizedBox(height: 24),
                          if (data.unpaidAddOns.isNotEmpty) ...[
                            const Text(
                              'Dịch vụ chưa thanh toán',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data.unpaidAddOns.length,
                              separatorBuilder: (context, index) => const Divider(),
                              itemBuilder: (context, index) {
                                final addOn = data.unpaidAddOns[index];
                                return _buildAddOnItem(
                                  addOn.serviceName,
                                  addOn.quantity,
                                  addOn.unitPrice,
                                  addOn.totalPrice,
                                );
                              },
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  RecepLargeButton(
                    label: 'Xác nhận Checkout',
                    onTap: () {
                      widget.viewModel!.confirmCheckOut.execute(data.bookingId);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSummaryCard(CheckOutPreviewResponse data) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tổng kết chi phí',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          _buildRow('Tiền phòng', data.roomCharges),
          const SizedBox(height: 8),
          _buildRow('Tiền dịch vụ (chưa trả)', data.addOnCharges),
          const SizedBox(height: 8),
          _buildRow('Phí trễ giờ (Late fees)', data.lateFees),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tổng cần thanh toán',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                currencyFormatter.format(data.totalBill),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.error,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, num value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          currencyFormatter.format(value),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildAddOnItem(
      String serviceName, int quantity, num unitPrice, num totalPrice) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  serviceName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${currencyFormatter.format(unitPrice)} x $quantity',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            currencyFormatter.format(totalPrice),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
