import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/user/hotel/checkout/view_models/hotel_checkout_view_model.dart';
import 'package:travery_frontend/ui/user/hotel/widgets/hotel_app_bar.dart';

class HotelCheckoutScreen extends StatefulWidget {
  const HotelCheckoutScreen({super.key});

  @override
  State<HotelCheckoutScreen> createState() => _HotelCheckoutScreenState();
}

class _HotelCheckoutScreenState extends State<HotelCheckoutScreen> {
  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }

  String _formatDateTime(String? dateStr) {
    if (dateStr == null) return '';
    try {
      final dt = DateTime.parse(dateStr);
      return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')} ${dt.day}/${dt.month}';
    } catch (_) {
      return dateStr;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HotelCheckoutViewModel>(
      builder: (context, vm, _) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: const HotelAppBar(title: 'Đặt dịch vụ'),
          body: vm.isLoadingServices && vm.availableServices.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: () async {
                    await vm.loadServices();
                    await vm.loadBill();
                  },
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildBillCard(vm),
                      const SizedBox(height: 16),
                      _buildServicesHeader(vm),
                      const SizedBox(height: 12),
                      ...vm.availableServices.map(
                        (service) => _ServiceCard(
                          service: service,
                          quantity: vm.getQuantity(service.id),
                          formatPrice: _formatPrice,
                          onQuantityChanged: (qty) =>
                              vm.setQuantity(service.id, qty),
                        ),
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
          bottomNavigationBar: _buildBottomBar(context, vm),
        );
      },
    );
  }

  Widget _buildBillCard(HotelCheckoutViewModel vm) {
    final bill = vm.bill;
    final orders = bill?.addOnOrders ?? [];
    final totalCharges = bill?.totalAddOnCharges ?? 0;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.receipt_long,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Hóa đơn dịch vụ',
                style: TextStyle(
                  fontSize: AppTextTheme.headlineSmall,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              if (orders.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${orders.length} món',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          if (vm.isLoadingBill)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          else if (orders.isEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.info_outline, size: 16, color: Color(0xFF9CA3AF)),
                  SizedBox(width: 8),
                  Text(
                    'Chưa có dịch vụ nào',
                    style: TextStyle(fontSize: 13, color: Color(0xFF9CA3AF)),
                  ),
                ],
              ),
            )
          else
            ...orders.map((order) => _buildOrderItem(order, vm)),
          if (orders.isNotEmpty) ...[
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tổng dịch vụ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  _formatPrice(totalCharges),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildOrderItem(dynamic order, HotelCheckoutViewModel vm) {
    final isPending = order.status?.toUpperCase() == 'PENDING';
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isPending
                  ? AppColors.primary.withValues(alpha: 0.1)
                  : const Color(0xFF22C55E).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isPending ? Icons.access_time : Icons.check,
              size: 14,
              color: isPending ? AppColors.primary : const Color(0xFF22C55E),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.serviceName,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  '${order.quantity}x · ${_formatPrice(order.unitPrice)} · ${_formatDateTime(order.scheduledTime)}',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),
          ),
          Text(
            _formatPrice(order.totalPrice),
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          if (isPending) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => _confirmCancelOrder(context, vm, order.id),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEE2E2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.close,
                  size: 14,
                  color: Color(0xFFEF4444),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _confirmCancelOrder(
    BuildContext context,
    HotelCheckoutViewModel vm,
    String orderId,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hủy dịch vụ'),
        content: const Text('Bạn có chắc muốn hủy dịch vụ này?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Không'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              vm.cancelOrder(orderId);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Hủy'),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesHeader(HotelCheckoutViewModel vm) {
    return Row(
      children: [
        const Text(
          'Dịch vụ có sẵn',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const Spacer(),
        if (vm.error != null)
          GestureDetector(
            onTap: () => vm.loadServices(),
            child: const Text(
              'Thử lại',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context, HotelCheckoutViewModel vm) {
    final cartTotal = vm.cartTotal;
    final hasItems = vm.hasCartItems;

    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        12,
        16,
        MediaQuery.of(context).padding.bottom + 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: const Border(top: BorderSide(color: Color(0xFFE5E7EB))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: hasItems && !vm.isOrdering
                ? () => _handleSubmit(context, vm)
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.5),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: vm.isOrdering
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add_shopping_cart, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        hasItems
                            ? 'Đặt dịch vụ (${_formatPrice(cartTotal)})'
                            : 'Thêm dịch vụ',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleSubmit(
    BuildContext context,
    HotelCheckoutViewModel vm,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final success = await vm.submitOrder();

    if (!mounted) return;

    if (success) {
      messenger.showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white, size: 20),
              SizedBox(width: 10),
              Text('Đặt dịch vụ thành công!'),
            ],
          ),
          backgroundColor: const Color(0xFF22C55E),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );
    } else if (vm.error != null) {
      messenger.showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.white, size: 20),
              const SizedBox(width: 10),
              Expanded(child: Text(vm.error!)),
            ],
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );
    }
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({
    required this.service,
    required this.quantity,
    required this.formatPrice,
    required this.onQuantityChanged,
  });

  final dynamic service;
  final int quantity;
  final String Function(double) formatPrice;
  final ValueChanged<int> onQuantityChanged;

  bool get isActive => service.isActive != false;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isActive ? 1.0 : 0.5,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive ? const Color(0xFFE5E7EB) : const Color(0xFFD1D5DB),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              Text(
                service.name ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              // Description
              if (service.description != null &&
                  service.description!.isNotEmpty) ...[
                const SizedBox(height: 6),
                Text(
                  service.description!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF6B7280),
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 12),
              // Price + Unit + Quantity selector row
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formatPrice(service.price),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        if (service.unit != null && service.unit!.isNotEmpty)
                          Text(
                            '/ ${service.unit}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF9CA3AF),
                            ),
                          ),
                      ],
                    ),
                  ),
                  _QuantitySelector(
                    quantity: quantity,
                    onChanged: isActive ? onQuantityChanged : null,
                    enabled: isActive,
                  ),
                ],
              ),
              // Inactive badge
              if (!isActive) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Tạm ngưng phục vụ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _QuantitySelector extends StatelessWidget {
  const _QuantitySelector({
    required this.quantity,
    required this.onChanged,
    this.enabled = true,
  });

  final int quantity;
  final ValueChanged<int>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildButton(
            icon: Icons.remove,
            onTap: enabled && quantity > 0
                ? () => onChanged?.call(quantity - 1)
                : null,
          ),
          Container(
            width: 36,
            alignment: Alignment.center,
            child: Text(
              '$quantity',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          _buildButton(
            icon: Icons.add,
            onTap: enabled ? () => onChanged?.call(quantity + 1) : null,
          ),
        ],
      ),
    );
  }

  Widget _buildButton({required IconData icon, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 18,
          color: onTap != null ? AppColors.primary : const Color(0xFFD1D5DB),
        ),
      ),
    );
  }
}
