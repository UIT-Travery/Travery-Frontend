import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';

class GuideChatScreen extends StatelessWidget {
  const GuideChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              decoration: const BoxDecoration(
                color: AppColors.surface,
                border: Border(
                  bottom: BorderSide(color: Color(0xFFE8EAF0), width: 1),
                ),
              ),
              child: const Text(
                'Tin nhắn',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: CometChatConversations(
                title: 'Tin nhắn',
                emptyStateView: (context) => const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.chat_bubble_outline,
                        size: 64,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Chưa có tin nhắn nào',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
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
          ],
        ),
      ),
    );
  }
}
