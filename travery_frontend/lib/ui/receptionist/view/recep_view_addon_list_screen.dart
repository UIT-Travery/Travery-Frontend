import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';

import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_add_on_card.dart';

import 'package:travery_frontend/ui/receptionist/view_models/recep_view_addon_list_view_model.dart';
import 'package:travery_frontend/utils/core_result.dart' as core;
import 'package:travery_frontend/utils/alert.dart';
import 'package:travery_frontend/ui/core/widgets/loading_overlay.dart';

class RecepViewAddonListScreen extends StatefulWidget {
  final RecepViewAddonListViewModel viewModel;

  const RecepViewAddonListScreen({super.key, required this.viewModel});

  @override
  State<RecepViewAddonListScreen> createState() => _RecepViewAddonListScreenState();
}

class _RecepViewAddonListScreenState extends State<RecepViewAddonListScreen> {
  String selectedFilter = 'TẤT CẢ';

  final List<String> filters = [
    'TẤT CẢ',
    'SPA',
    'GIẶT ỦI',
    'ĂN UỐNG',
  ];

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadAddOnOrders.addListener(_onResult);
    widget.viewModel.updateOrderStatus.addListener(_onResult);
    widget.viewModel.loadAddOnOrders.execute();
  }

  @override
  void didUpdateWidget(covariant RecepViewAddonListScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.loadAddOnOrders.removeListener(_onResult);
    oldWidget.viewModel.updateOrderStatus.removeListener(_onResult);
    widget.viewModel.loadAddOnOrders.addListener(_onResult);
    widget.viewModel.updateOrderStatus.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.loadAddOnOrders.removeListener(_onResult);
    widget.viewModel.updateOrderStatus.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    if (widget.viewModel.updateOrderStatus.completed) {
      Utils.showSuccessNotification(context, 'Cập nhật trạng thái thành công');
      widget.viewModel.updateOrderStatus.clearResult();
      widget.viewModel.loadAddOnOrders.execute(); // Reload list
    }
    if (widget.viewModel.updateOrderStatus.error) {
      final result = widget.viewModel.updateOrderStatus.result;
      String errorMessage = 'Cập nhật trạng thái thất bại';
      if (result is core.Error) {
        errorMessage = (result as core.Error).error.toString().replaceAll('HttpException: ', '');
      }
      widget.viewModel.updateOrderStatus.clearResult();
      Utils.showErrorNotification(context, errorMessage);
    }

    if (widget.viewModel.loadAddOnOrders.error) {
      final result = widget.viewModel.loadAddOnOrders.result;
      String errorMessage = 'Tải danh sách tiện ích thất bại';
      if (result is core.Error) {
        errorMessage = (result as core.Error).error.toString().replaceAll('HttpException: ', '');
      }
      widget.viewModel.loadAddOnOrders.clearResult();
      Utils.showErrorNotification(context, errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        widget.viewModel.loadAddOnOrders,
        widget.viewModel.updateOrderStatus,
      ]),
      builder: (context, child) {
        final isLoading = widget.viewModel.loadAddOnOrders.running ||
                          widget.viewModel.updateOrderStatus.running;
        
        final allOrders = widget.viewModel.addOnOrders;
        final filteredOrders = allOrders.where((order) {
          if (selectedFilter == 'TẤT CẢ') return true;
          if (selectedFilter == 'SPA' && order.category.toUpperCase() == 'SPA') return true;
          if (selectedFilter == 'GIẶT ỦI' && order.category.toUpperCase() == 'LAUNDRY') return true;
          if (selectedFilter == 'ĂN UỐNG' && order.category.toUpperCase() == 'FOOD') return true;
          return false;
        }).toList();

        return LoadingOverlay(
          isLoading: isLoading,
          child: Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        title: const Row(
          children: [
            Icon(Icons.home_outlined, color: AppColors.primaryDarkBlackBlue),
            SizedBox(width: 8),
            Text('Lễ tân', style: TextStyle(color: AppColors.primaryDarkBlackBlue, fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () => context.push(Routes.recepProfile),
              child: const CircleAvatar(
                backgroundColor: AppColors.primaryDarkBlackBlue,
                child: Icon(Icons.person, color: Colors.white, size: 20),
              ),
            ),
          )
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Yêu cầu Tiện ích',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Quản lý và cập nhật trạng thái dịch vụ nhanh chóng.',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            // Filter list
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filters.map((filter) {
                  bool isSelected = selectedFilter == filter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryDarkBlackBlue : AppColors.primaryLightWhiteBlue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          filter,
                          style: TextStyle(
                            color: isSelected ? Colors.white : AppColors.textSecondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
            // Addon List
            Expanded(
              child: ListView.builder(
                itemCount: filteredOrders.length,
                itemBuilder: (context, index) {
                  final order = filteredOrders[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: RecepAddOnCard(
                      id: order.id,
                      serviceName: order.serviceName,
                      category: order.category,
                      totalPrice: order.totalPrice,
                      scheduledTime: order.scheduledTime,
                      status: order.status,
                      onStatusUpdate: (id, status) {
                        widget.viewModel.updateOrderStatus.execute((id, status));
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    ),
    );
    },
    );
  }
}
