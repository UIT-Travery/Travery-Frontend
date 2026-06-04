import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:travery_frontend/data/services/api/model/hotel/hotel_service_response.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/admin/view_model/hotel_service_list_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart';
import 'widgets/small_button.dart';

class ViewHotelServiceListScreen extends StatefulWidget {
  final HotelServiceListViewModel viewModel;
  final String hotelId;

  const ViewHotelServiceListScreen({
    super.key,
    required this.viewModel,
    required this.hotelId,
  });

  @override
  State<ViewHotelServiceListScreen> createState() =>
      _ViewHotelServiceListScreenState();
}

class _ViewHotelServiceListScreenState
    extends State<ViewHotelServiceListScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.loadServices.addListener(_onLoadResult);
    widget.viewModel.loadServices.execute(widget.hotelId);
  }

  @override
  void didUpdateWidget(ViewHotelServiceListScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewModel != widget.viewModel) {
      oldWidget.viewModel.loadServices.removeListener(_onLoadResult);
      widget.viewModel.loadServices.addListener(_onLoadResult);
      widget.viewModel.loadServices.execute(widget.hotelId);
    }
  }

  @override
  void dispose() {
    widget.viewModel.loadServices.removeListener(_onLoadResult);
    super.dispose();
  }

  void _onLoadResult() {
    final cmd = widget.viewModel.loadServices;
    if (cmd.error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Không thể tải danh sách dịch vụ'),
          backgroundColor: Colors.red,
          action: SnackBarAction(
            label: 'Thử lại',
            textColor: Colors.white,
            onPressed: () =>
                widget.viewModel.loadServices.execute(widget.hotelId),
          ),
        ),
      );
    }
  }

  IconData _categoryIcon(HotelServiceCategory cat) {
    switch (cat) {
      case HotelServiceCategory.food:
        return Icons.restaurant_outlined;
      case HotelServiceCategory.spa:
        return Icons.spa_outlined;
      case HotelServiceCategory.laundry:
        return Icons.local_laundry_service_outlined;
      case HotelServiceCategory.other:
        return Icons.miscellaneous_services_outlined;
    }
  }

  Color _categoryColor(HotelServiceCategory cat) {
    switch (cat) {
      case HotelServiceCategory.food:
        return const Color(0xFFFF6B35);
      case HotelServiceCategory.spa:
        return const Color(0xFF9B59B6);
      case HotelServiceCategory.laundry:
        return const Color(0xFF3498DB);
      case HotelServiceCategory.other:
        return const Color(0xFF27AE60);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FB),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Quản lý Dịch vụ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                SmallButton(
                  label: 'Thêm',
                  prefixIcon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                  onTap: () async {
                    await context.push(
                      Routes.adminCreateHotelService,
                      extra: {'hotelId': widget.hotelId},
                    );
                    widget.viewModel.loadServices.execute(widget.hotelId);
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Danh sách các dịch vụ trong khách sạn',
              style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListenableBuilder(
                listenable: widget.viewModel.loadServices,
                builder: (context, _) {
                  final cmd = widget.viewModel.loadServices;

                  if (cmd.running) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (cmd.error) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Color(0xFFCC0000),
                            size: 48,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Không thể tải dữ liệu',
                            style: TextStyle(color: Color(0xFF64748B)),
                          ),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () => widget.viewModel.loadServices
                                .execute(widget.hotelId),
                            child: const Text('Thử lại'),
                          ),
                        ],
                      ),
                    );
                  }

                  final result = cmd.result;
                  final services = result is Ok<List<HotelServiceResponse>>
                      ? result.value
                      : <HotelServiceResponse>[];

                  if (services.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.room_service_outlined,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Chưa có dịch vụ nào',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Nhấn "Thêm" để tạo dịch vụ mới',
                            style:
                                TextStyle(color: Colors.grey[400], fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.separated(
                    itemCount: services.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final svc = services[index];
                      final color = _categoryColor(svc.category);
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: color.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                _categoryIcon(svc.category),
                                color: color,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    svc.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: Color(0xFF1E293B),
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    svc.category.displayName,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF64748B),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  currencyFormat.format(svc.price),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: color,
                                  ),
                                ),
                                Text(
                                  '/ ${svc.unit}',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFF94A3B8),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(
                                Icons.edit_outlined,
                                color: Color(0xFF64748B),
                                size: 20,
                              ),
                              onPressed: () async {
                                await context.push(
                                  Routes.adminUpdateHotelService,
                                  extra: {
                                    'hotelId': widget.hotelId,
                                    'serviceId': svc.id,
                                    'serviceType':
                                        svc.category.displayName,
                                    'serviceName': svc.name,
                                    'unit': svc.unit,
                                    'price': svc.price.toStringAsFixed(0),
                                    'description': svc.description,
                                  },
                                );
                                widget.viewModel.loadServices
                                    .execute(widget.hotelId);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}
