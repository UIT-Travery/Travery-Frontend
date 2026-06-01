import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/admin/view/admin_view_profile_screen.dart';
import 'package:travery_frontend/ui/admin/view_model/account_management_view_model.dart';
import 'package:travery_frontend/ui/admin/view_model/dashboard_view_model.dart';
import 'package:travery_frontend/ui/admin/view_model/hotel_management_view_model.dart';
import 'package:travery_frontend/ui/admin/view_model/tour_management_view_model.dart';
import 'package:travery_frontend/ui/admin/view_model/vehicle_management_view_model.dart';
import 'package:travery_frontend/ui/admin/view_model/admin_profile_view_model.dart';
import 'dashboard_screen.dart';
import 'account_management_screen.dart';
import 'hotel_management_screen.dart';
import 'tour_management_screen.dart';
import 'vehicle_management_screen.dart';
import 'roomtype_mangagement_screen.dart';
import 'amenity_management_screen.dart';
import 'widgets/admin_sidebar.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  int _currentIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onSidebarTap(int index) {
    // Đóng drawer trước
    Navigator.of(context).pop();

    if (index == 7) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tính năng Hộp thoại đang được phát triển'),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() {
      _currentIndex = index;
    });
  }

  void _onLogout() {
    context.read<AdminProfileViewModel>().logout.execute();
    context.go(Routes.login);
  }

  Widget _buildContent() {
    switch (_currentIndex) {
      case 0:
        return DashboardScreen(viewModel: context.read<DashboardViewModel>());
      case 1:
        return TourManagementScreen(
          viewModel: context.read<TourManagementViewModel>(),
        );
      case 2:
        return VehicleManagementScreen(
          viewModel: context.read<VehicleManagementViewModel>(),
        );
      case 3:
        return AccountManagementScreen(
          viewModel: context.read<AccountManagementViewModel>(),
        );
      case 4:
        return HotelManagementScreen(
          viewModel: context.read<HotelManagementViewModel>(),
        );
      case 5:
        return const RoomtypeManagementScreen();
      case 6:
        return const AmenityManagementScreen();
      case 8:
        return AdminViewProfileScreen(
          viewModel: context.read<AdminProfileViewModel>(),
        );
      default:
        return DashboardScreen(viewModel: context.read<DashboardViewModel>());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => _scaffoldKey.currentState?.openDrawer(),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0055C3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.grid_view_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Travery Admin',
                style: TextStyle(
                  color: Color(0xFF0055C3),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey.shade200, height: 1),
        ),
      ),
      drawer: AdminSidebar(
        currentIndex: _currentIndex,
        onTap: _onSidebarTap,
        onLogout: _onLogout,
      ),
      body: _buildContent(),
    );
  }
}
