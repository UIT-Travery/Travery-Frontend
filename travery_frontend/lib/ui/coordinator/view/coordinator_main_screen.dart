import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_coach_trip_list_view_model.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_tour_list_view_model.dart';
import 'coordinator_view_tour_list_screen.dart';
import 'coordinator_view_coach_list_screen.dart';
import 'coordinator_selection_screen.dart';
import 'coordinator_view_refund_list_screen.dart';
import '../view_models/coordinator_refund_list_view_model.dart';
import 'widgets/coordinator_bottom_navigation_bar.dart';

import 'package:travery_frontend/ui/chat/chat_screen.dart';

class CoordinatorMainScreen extends StatefulWidget {
  const CoordinatorMainScreen({super.key});

  @override
  State<CoordinatorMainScreen> createState() => _CoordinatorMainScreenState();
}

class _CoordinatorMainScreenState extends State<CoordinatorMainScreen> {
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
          CoordinatorTourListScreen(
            viewModel: context.read<CoordinatorTourListViewModel>(),
          ),
          CoordinatorViewCoachListScreen(
            viewModel: context.read<CoordinatorCoachTripListViewModel>(),
          ),
          const CoordinatorSelectionScreen(),
          const ChatScreen(title: 'Tin nhắn', showBackButton: false),
          CoordinatorViewRefundListScreen(
            viewModel: context.read<CoordinatorRefundListViewModel>(),
          ),
        ],
      ),
      bottomNavigationBar: CoordinatorBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
