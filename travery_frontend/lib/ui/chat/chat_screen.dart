import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/widgets/app_bar_widget.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/data/services/security_storage_service.dart';
import 'package:travery_frontend/data/services/chat/chat_service.dart';
import 'package:travery_frontend/ui/chat/view_models/chat_view_model.dart';
import 'package:travery_frontend/data/repositories/profile/profile_repository.dart';
import 'package:travery_frontend/data/services/api/model/profile/profile_response/profile_response.dart';
import 'package:travery_frontend/utils/core_result.dart';

class ChatScreen extends StatefulWidget {
  final String? uid;
  final String? guid;
  final String title;
  final bool showBackButton;

  const ChatScreen({
    super.key,
    this.uid,
    this.guid,
    required this.title,
    this.showBackButton = true,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Future<(User?, String?)> _initFuture;

  @override
  void initState() {
    super.initState();
    _initFuture = _initialize();
  }

  Future<(User?, String?)> _initialize() async {
    final storage = context.read<SecurityStorageService>();
    final user = await _checkAndEnsureLogin();
    final role = await storage.getUserRole();
    return (user, role);
  }

  Future<User?> _checkAndEnsureLogin() async {
    final storage = context.read<SecurityStorageService>();
    final chatService = context.read<ChatService>();
    final profileRepository = context.read<ProfileRepository>();

    // Lấy UID mong muốn từ storage trước
    String? cometchatUid = await storage.getCometchatUid();

    if (cometchatUid == null) {
      // Fallback: Lấy từ profile nếu thiếu
      final profileResult = await profileRepository.getMyProfile();
      if (profileResult is Ok<ProfileData>) {
        cometchatUid = profileResult.value.id;
        // Lưu lại để dùng cho lần sau
        await storage.saveCometchatUid(cometchatUid);
      }
    }

    if (cometchatUid == null) {
      throw Exception("Chưa có thông tin cometchat_uid. Vui lòng đăng nhập lại.");
    }

    // Kiểm tra xem đã đăng nhập đúng user chưa
    User? loggedInUser = await CometChat.getLoggedInUser();
    if (loggedInUser != null) {
      if (loggedInUser.uid == cometchatUid) {
        return loggedInUser;
      } else {
        debugPrint("ChatScreen: Đang đăng nhập sai user (${loggedInUser.uid} != $cometchatUid). Đang logout...");
        await chatService.logout();
      }
    }

    // Tiến hành login
    try {
      await chatService.login(cometchatUid);
      return await CometChat.getLoggedInUser();
    } catch (e) {
      debugPrint("ChatScreen: Auto-login failed: $e");
      throw Exception("Lỗi đăng nhập CometChat: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    String displayTitle = widget.title.isEmpty 
        ? (widget.uid ?? widget.guid ?? 'Trò chuyện') 
        : widget.title;

    return FutureBuilder<(User?, String?)>(
      future: _initFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBarWidget(title: displayTitle),
            body: const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }

        final user = snapshot.data?.$1;
        final role = snapshot.data?.$2;

        if (snapshot.hasError || user == null) {
          return Scaffold(
            appBar: AppBarWidget(title: displayTitle),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: AppColors.error),
                  const SizedBox(height: 16),
                  const Text('Không thể kết nối với hệ thống chat.'),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      snapshot.hasError 
                          ? snapshot.error.toString()
                          : 'Vui lòng kiểm tra cấu hình hoặc đăng nhập lại.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _initFuture = _initialize();
                      });
                    },
                    child: const Text('Thử lại'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/');
                      }
                    },
                    child: const Text('Quay lại'),
                  ),
                ],
              ),
            ),
          );
        }
        
        // User is logged in, show the chat UI
        if (widget.uid == null && widget.guid == null) {
          return Scaffold(
            body: CometChatConversations(
              title: 'Tin nhắn',
              showBackButton: widget.showBackButton,
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

                if (conversation.conversationType == ReceiverTypeConstants.user) {
                  final user = conversation.conversationWith as User;
                  targetUid = user.uid;
                  targetTitle = user.name;
                } else {
                  final group = conversation.conversationWith as Group;
                  targetGuid = group.guid;
                  targetTitle = group.name;
                }

                context.push(Routes.chat, extra: {
                  'uid': targetUid,
                  'guid': targetGuid,
                  'title': targetTitle,
                });
              },
            ),
          );
        }

        final bool isCoordinator = role == 'COORDINATOR';

        return Scaffold(
          body: Column(
            children: [
              Stack(
                children: [
                  CometChatMessageHeader(
                    user: widget.uid != null ? User(uid: widget.uid!, name: displayTitle) : null,
                    group: widget.guid != null ? Group(guid: widget.guid!, name: displayTitle, type: GroupTypeConstants.public) : null,
                    hideVideoCallButton: true,
                    hideVoiceCallButton: true,
                  ),
                  if (isCoordinator && widget.guid != null)
                    Positioned(
                      right: 8,
                      top: MediaQuery.of(context).padding.top + 4,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.red),
                        onPressed: () => _showCloseChatDialog(context, widget.guid!),
                        tooltip: 'Đóng cuộc trò chuyện',
                      ),
                    ),
                ],
              ),
              Expanded(
                child: CometChatMessageList(
                  user: widget.uid != null ? User(uid: widget.uid!, name: displayTitle) : null,
                  group: widget.guid != null ? Group(guid: widget.guid!, name: displayTitle, type: GroupTypeConstants.public) : null,
                  hideStickyDate: true,
                  alignment: ChatAlignment.standard,
                  style: const CometChatMessageListStyle(
                    backgroundColor: Colors.white,
                  ),
                  dateSeparatorStyle: const CometChatDateStyle(
                    backgroundColor: Colors.white,
                    textColor: Colors.grey,
                  ),
                  loadingStateView: (context) => Container(
                    color: Colors.white,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  emptyStateView: (context) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withAlpha(25),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.support_agent_rounded,
                              size: 64,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Thiết kế Tour riêng',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Hãy nhắn tin để bắt đầu thiết kế Tour riêng cho mình. Vui lòng chờ đợi để một Điều phối viên vào tư vấn cho bạn.',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              CometChatMessageComposer(   
                user: widget.uid != null ? User(uid: widget.uid!, name: displayTitle) : null,
                group: widget.guid != null ? Group(guid: widget.guid!, name: displayTitle, type: GroupTypeConstants.public) : null,
                hideVoiceRecordingButton: true,
                hideVideoAttachmentOption: true,
                hideAudioAttachmentOption: true,
                hidePollsOption: true,
                hideCollaborativeDocumentOption: true,
                hideCollaborativeWhiteboardOption: true,
                customSoundForMessage: 'assets/sound/beep.mp3',
                customSoundForMessagePackage: 'cometchat_chat_uikit',
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCloseChatDialog(BuildContext context, String guid) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Đóng cuộc trò chuyện?'),
        content: const Text('Bạn có chắc chắn muốn đóng cuộc trò chuyện này không?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              final chatVm = context.read<ChatViewModel>();
              
              bool success;
              if (guid.startsWith('consult_')) {
                success = await chatVm.requestCloseChat(guid);
              } else {
                // For tour_instance_guid, we need the instanceId. 
                // GUID is tour_instance_{instanceId}
                final instanceId = guid.replaceFirst('tour_instance_', '');
                success = await chatVm.closeInstanceChat(instanceId);
              }

              if (success && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đã đóng cuộc trò chuyện')),
                );
                context.pop();
              } else if (context.mounted && chatVm.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(chatVm.errorMessage!)),
                );
              }
            },
            child: const Text('Đóng', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
