import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/models/hotel/hotel_booking_data.dart';
import 'package:travery_frontend/data/services/hotel/hotel_service.dart';
import 'package:travery_frontend/ui/user/hotel/widgets/hotel_app_bar.dart';
import 'package:travery_frontend/ui/user/hotel/addon_list/view_models/hotel_addon_list_view_model.dart';

class HotelAddonListScreen extends StatelessWidget {
  const HotelAddonListScreen({super.key});

  String _formatPrice(double price) {
    final str = price.toStringAsFixed(0);
    return '${str.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},')}đ';
  }

  String _getCategoryLabel(String category) {
    switch (category.toUpperCase()) {
      case 'FOOD':
        return 'ĐỒ ĂN';
      case 'SPA':
        return 'SPA';
      case 'LAUNDRY':
        return 'GIẶT ỦI';
      case 'OTHER':
        return 'KHÁC';
      default:
        return category;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toUpperCase()) {
      case 'FOOD':
        return Icons.restaurant;
      case 'SPA':
        return Icons.spa;
      case 'LAUNDRY':
        return Icons.local_laundry_service;
      default:
        return Icons.more_horiz;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          HotelAddonListViewModel(hotelService: context.read<HotelService>()),
      child: _HotelAddonListContent(
        formatPrice: _formatPrice,
        getCategoryLabel: _getCategoryLabel,
        getCategoryIcon: _getCategoryIcon,
      ),
    );
  }
}

class _HotelAddonListContent extends StatefulWidget {
  const _HotelAddonListContent({
    required this.formatPrice,
    required this.getCategoryLabel,
    required this.getCategoryIcon,
  });

  final String Function(double) formatPrice;
  final String Function(String) getCategoryLabel;
  final IconData Function(String) getCategoryIcon;

  @override
  State<_HotelAddonListContent> createState() => _HotelAddonListContentState();
}

class _HotelAddonListContentState extends State<_HotelAddonListContent> {
  String? _bookingId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
      final bookingId = extra?['bookingId'] as String?;
      if (bookingId != null) {
        _bookingId = bookingId;
        context.read<HotelAddonListViewModel>().loadServices(bookingId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HotelAddonListViewModel>(
      builder: (context, vm, _) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFF),
          appBar: const HotelAppBar(title: 'Thêm dịch vụ'),
          body: Column(
            children: [
              _buildTabs(vm),
              Expanded(child: _buildBody(vm)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabs(HotelAddonListViewModel vm) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(vm.tabs.length, (index) {
            final isActive = index == vm.selectedTab;
            final count = vm.getTabCount(index);
            return GestureDetector(
              onTap: () => vm.setTab(index),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isActive
                          ? const Color(0xFF0056B3)
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      vm.tabs[index],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: isActive
                            ? FontWeight.bold
                            : FontWeight.w500,
                        color: isActive
                            ? const Color(0xFF0056B3)
                            : const Color(0xFF6B7280),
                      ),
                    ),
                    if (count > 0) ...[
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: isActive
                              ? const Color(0xFF0056B3).withValues(alpha: 0.1)
                              : const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '$count',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: isActive
                                ? const Color(0xFF0056B3)
                                : const Color(0xFF6B7280),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildBody(HotelAddonListViewModel vm) {
    if (vm.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (vm.error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(vm.error!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_bookingId != null) {
                  vm.loadServices(_bookingId!);
                }
              },
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    final services = vm.filteredServices;
    if (services.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inbox, size: 48, color: Color(0xFF9CA3AF)),
            SizedBox(height: 16),
            Text(
              'Không có dịch vụ nào',
              style: TextStyle(color: Color(0xFF6B7280)),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: services.length,
      separatorBuilder: (_, _) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final service = services[index];
        return _ServiceCard(
          service: service,
          vm: vm,
          formatPrice: widget.formatPrice,
          getCategoryLabel: widget.getCategoryLabel,
          getCategoryIcon: widget.getCategoryIcon,
        );
      },
    );
  }
}

class _ServiceCard extends StatefulWidget {
  const _ServiceCard({
    required this.service,
    required this.vm,
    required this.formatPrice,
    required this.getCategoryLabel,
    required this.getCategoryIcon,
  });

  final HotelAddOnServiceData service;
  final HotelAddonListViewModel vm;
  final String Function(double) formatPrice;
  final String Function(String) getCategoryLabel;
  final IconData Function(String) getCategoryIcon;

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0056B3).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    widget.getCategoryIcon(widget.service.category),
                    size: 24,
                    color: const Color(0xFF0056B3),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.service.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          widget.getCategoryLabel(widget.service.category),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0056B3),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.formatPrice(widget.service.price),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0056B3),
                      ),
                    ),
                    if (widget.service.unit != null &&
                        widget.service.unit!.isNotEmpty)
                      Text(
                        '/${widget.service.unit}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (widget.service.description != null &&
              widget.service.description!.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.service.description!,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF6B7280),
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 12),
          ],
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFFFAFBFC),
              border: Border(top: BorderSide(color: Color(0xFFF3F4F6))),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _TimePicker(
                    serviceId: widget.service.id,
                    initialTime: widget.vm.getScheduledTime(widget.service.id),
                    onTimeChanged: (time) {
                      widget.vm.setScheduledTime(widget.service.id, time);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                _QuantitySelector(
                  quantity: widget.vm.getQuantity(widget.service.id),
                  onChanged: (qty) =>
                      widget.vm.setQuantity(widget.service.id, qty),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: widget.vm.isOrdering
                        ? null
                        : () => _orderService(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0056B3),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: widget.vm.isOrdering
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Đặt',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _orderService(BuildContext context) async {
    final time = widget.vm.getScheduledTime(widget.service.id);
    final quantity = widget.vm.getQuantity(widget.service.id);

    final order = await widget.vm.orderService(
      widget.service.id,
      quantity: quantity,
      scheduledTime: time,
    );

    if (order != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã đặt "${widget.service.name}" thành công!'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else if (widget.vm.error != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(widget.vm.error!),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}

class _TimePicker extends StatelessWidget {
  const _TimePicker({
    required this.serviceId,
    required this.initialTime,
    required this.onTimeChanged,
  });

  final String serviceId;
  final DateTime initialTime;
  final ValueChanged<DateTime> onTimeChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDateTimePicker(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: [
            const Icon(Icons.schedule, size: 18, color: Color(0xFF6B7280)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                _formatDateTime(initialTime),
                style: const TextStyle(fontSize: 13, color: Color(0xFF1F2937)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dt) {
    final hour = dt.hour.toString().padLeft(2, '0');
    final minute = dt.minute.toString().padLeft(2, '0');
    return '${dt.day}/${dt.month} $hour:$minute';
  }

  Future<void> _showDateTimePicker(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: initialTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );

    if (date != null && context.mounted) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialTime),
      );

      if (time != null) {
        final newDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
        onTimeChanged(newDateTime);
      }
    }
  }
}

class _QuantitySelector extends StatelessWidget {
  const _QuantitySelector({required this.quantity, required this.onChanged});

  final int quantity;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              if (quantity > 1) onChanged(quantity - 1);
            },
            child: Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              child: Icon(
                Icons.remove,
                size: 16,
                color: quantity > 1
                    ? const Color(0xFF0056B3)
                    : const Color(0xFFD1D5DB),
              ),
            ),
          ),
          SizedBox(
            width: 32,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onChanged(quantity + 1),
            child: Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              child: const Icon(Icons.add, size: 16, color: Color(0xFF0056B3)),
            ),
          ),
        ],
      ),
    );
  }
}
