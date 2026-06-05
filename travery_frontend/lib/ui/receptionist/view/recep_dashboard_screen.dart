import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/common/notification/view/widgets/notification_badge.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_dashboard_info_box.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_dashboard_checkin_list.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_dashboard_checkout_list.dart';
import 'package:travery_frontend/ui/receptionist/view_models/recep_dashboard_view_model.dart';
import 'package:travery_frontend/ui/admin/view_model/admin_profile_view_model.dart';
import 'package:travery_frontend/utils/alert.dart';
import 'package:travery_frontend/ui/core/widgets/loading_overlay.dart';
import 'package:travery_frontend/ui/receptionist/view/widgets/recep_app_bar_avatar.dart';

class RecepDashboardScreen extends StatefulWidget {
  const RecepDashboardScreen({super.key});

  @override
  State<RecepDashboardScreen> createState() => _RecepDashboardScreenState();
}

class _RecepDashboardScreenState extends State<RecepDashboardScreen> {
  late RecepDashboardViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = context.read<RecepDashboardViewModel>();
    _viewModel.loadDashboard.addListener(_onResult);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.loadDashboard.execute();
      context.read<AdminProfileViewModel>().loadProfile.execute();
    });
  }

  @override
  void didUpdateWidget(covariant RecepDashboardScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _viewModel.loadDashboard.removeListener(_onResult);
    _viewModel = context.read<RecepDashboardViewModel>();
    _viewModel.loadDashboard.addListener(_onResult);
  }

  @override
  void dispose() {
    _viewModel.loadDashboard.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    if (_viewModel.loadDashboard.error) {
      Utils.showErrorNotification(
        context,
        'Không thể tải dữ liệu bảng điều khiển',
      );
      _viewModel.loadDashboard.clearResult();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel.loadDashboard,
      builder: (context, child) {
        final data = _viewModel.dashboardData;
        final now = DateTime.now();
        final formattedDate = DateFormat('HH:mm, dd/MM/yyyy').format(now);

        return LoadingOverlay(
          isLoading: _viewModel.loadDashboard.running,
          child: Scaffold(
            backgroundColor: const Color(0xFFF8F9FB),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color(0xFFF8F9FB),
              elevation: 0,
              title: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(
                      Icons.home_outlined,
                      color: Color(0xFF1E3A8A),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Lễ tân',
                    style: TextStyle(
                      color: Color(0xFF1E3A8A),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: GestureDetector(
                    onTap: () => context.push(Routes.recepProfile),
                    child: const RecepAppBarAvatar(),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bảng Điều Khiển',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E232C),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formattedDate,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: RecepDashboardInfoBox(
                          label: 'Sẵn sàng',
                          quantity: '${data?.availableRooms ?? 0}',
                          status: 'Trống',
                          color: 'green',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: RecepDashboardInfoBox(
                          label: 'Đang ở',
                          quantity: '${data?.occupiedRooms ?? 0}',
                          status: 'Chiếm',
                          color: 'blue',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: RecepDashboardInfoBox(
                          label: 'Đang dọn',
                          quantity: '${data?.cleaningRooms ?? 0}',
                          status: 'Vệ sinh',
                          color: 'yellow',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: RecepDashboardInfoBox(
                          label: 'Bảo trì',
                          quantity: '${data?.maintenanceRooms ?? 0}',
                          status: 'Sửa',
                          color: 'red',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  RecepDashboardCheckinList(queue: data?.checkInQueue),
                  const SizedBox(height: 24),
                  RecepDashboardCheckoutList(queue: data?.checkOutQueue),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
