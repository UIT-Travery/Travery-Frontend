import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'account_management_screen.dart';
import 'create_account_screen.dart';
import 'widgets/admin_bottom_nav_bar.dart';
import 'admin_view_profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/ui/admin/view_model/admin_profile_view_model.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onBottomNavTapped(int index) {
    if (index == 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tính năng Chat đang được phát triển'),
          duration: Duration(seconds: 1),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          const DashboardScreen(),
          const AccountManagementScreen(),
          const CreateAccountScreen(),
          const Center(child: Text('Chat')),
          AdminViewProfileScreen(
            viewModel: context.read<AdminProfileViewModel>(),
          ),
        ],
      ),
      bottomNavigationBar: AdminBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
