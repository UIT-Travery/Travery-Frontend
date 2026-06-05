import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';
import 'package:travery_frontend/ui/guide/home/guide_home_view_model.dart';
import 'package:travery_frontend/ui/guide/widgets/guide_bottom_nav_bar.dart';
import 'package:travery_frontend/ui/guide/home/guide_home_screen.dart';
import 'package:travery_frontend/ui/guide/home/guide_chat_screen.dart';
import 'package:travery_frontend/ui/guide/home/guide_profile_screen.dart';
import 'package:travery_frontend/ui/guide/home/guide_mission_screen.dart';

class GuideMainScreen extends StatefulWidget {
  final GuideHomeViewModel viewModel;

  const GuideMainScreen({super.key, required this.viewModel});

  @override
  State<GuideMainScreen> createState() => _GuideMainScreenState();
}

class _GuideMainScreenState extends State<GuideMainScreen> {
  int _selectedNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(
        index: _selectedNavIndex,
        children: [
          GuideHomeScreen(viewModel: widget.viewModel),
          const GuideMissionScreen(),
          const GuideChatScreen(),
          const GuideProfileScreen(),
        ],
      ),
      bottomNavigationBar: GuideBottomNavBar(
        currentIndex: _selectedNavIndex,
        onTap: (index) {
          setState(() => _selectedNavIndex = index);
        },
      ),
    );
  }
}
