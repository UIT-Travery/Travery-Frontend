import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/receptionist/view/recep_view_checkinout_list_screen.dart';
import 'recep_dashboard_screen.dart';
import 'recep_view_addon_list_screen.dart';
import 'recep_view_hotel_room_screen.dart';
import 'widgets/recep_bottom_nav_bar.dart';

class RecepMainScreen extends StatefulWidget {
  const RecepMainScreen({super.key});

  @override
  State<RecepMainScreen> createState() => _RecepMainScreenState();
}

class _RecepMainScreenState extends State<RecepMainScreen> {
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
        children: const [
          RecepDashboardScreen(),
          RecepViewCheckinoutListScreen(),
          RecepViewHotelRoomScreen(),
          Center(child: Text('Chat')),
          RecepViewAddonListScreen(),
        ],
      ),
      bottomNavigationBar: RecepBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
