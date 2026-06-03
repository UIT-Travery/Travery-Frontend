import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/coordinator/view_models/coordinator_tour_list_view_model.dart';
import 'coordinator_view_tour_list_screen.dart';
import 'coordinator_view_coach_list_screen.dart';
import 'coordinator_selection_screen.dart';
import 'coordinator_view_ended_tour_screen.dart';
import 'widgets/coordinator_bottom_navigation_bar.dart';

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
          CoordinatorTourListScreen(
            viewModel: context.read<CoordinatorTourListViewModel>(),
          ),
          const CoordinatorViewCoachListScreen(),
          CoordinatorSelectionScreen(),
          Scaffold(
            body: CometChatConversations(
              title: 'Tin nhắn',
              emptyStateView: (context) => const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.chat_bubble_outline, size: 48, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'Không có cuộc trò chuyện nào',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              loadingStateView: (context) => Container(
                color: Colors.white,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              onItemTap: (conversation) {
                String? targetUid;
                String? targetGuid;
                String targetTitle = "";

                if (conversation.conversationType ==
                    ReceiverTypeConstants.user) {
                  final user = conversation.conversationWith as User;
                  targetUid = user.uid;
                  targetTitle = user.name;
                } else {
                  final group = conversation.conversationWith as Group;
                  targetGuid = group.guid;
                  targetTitle = group.name;
                }

                context.push(
                  Routes.chat,
                  extra: {
                    'uid': targetUid,
                    'guid': targetGuid,
                    'title': targetTitle,
                  },
                );
              },
            ),
          ),
          const CoordinatorViewEndedTourScreen(),
        ],
      ),
      bottomNavigationBar: CoordinatorBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
