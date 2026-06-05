import 'dart:async';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:flutter/foundation.dart';
import 'package:travery_frontend/config/app_config.dart';

class ChatService {
  Future<void> init() async {
    if (AppConfig.cometChatAppId.isEmpty || AppConfig.cometChatAuthKey.isEmpty) {
      debugPrint("WARNING: CometChat configuration is missing! Check your --dart-define parameters.");
      return;
    }

    UIKitSettings uiKitSettings = (UIKitSettingsBuilder()
          ..subscriptionType = CometChatSubscriptionType.allUsers
          ..region = AppConfig.cometChatRegion
          ..appId = AppConfig.cometChatAppId
          ..authKey = AppConfig.cometChatAuthKey)
        .build();

    await CometChatUIKit.init(
      uiKitSettings: uiKitSettings,
      onSuccess: (successMessage) {
        debugPrint("CometChat V6 Initialized: $successMessage");
      },
      onError: (error) {
        debugPrint("CometChat Initialization Error: ${error.message}");
      },
    );
  }

  Future<void> login(String uid) async {
    // Check if user is already logged in to avoid redundant calls
    User? loggedInUser = await CometChat.getLoggedInUser();
    if (loggedInUser != null && loggedInUser.uid == uid) {
      debugPrint("CometChat: User $uid already logged in.");
      return;
    }

    // If a different user is logged in, logout first
    if (loggedInUser != null) {
      debugPrint("CometChat: Different user ${loggedInUser.uid} logged in. Logging out...");
      await logout();
    }

    final completer = Completer<void>();

    CometChat.login(
      uid,
      AppConfig.cometChatAuthKey,
      onSuccess: (User user) {
        debugPrint("CometChat Login Success: ${user.name} (${user.uid})");
        if (!completer.isCompleted) completer.complete();
      },
      onError: (CometChatException error) {
        debugPrint("CometChat Login Error: [${error.code}] ${error.message}");
        if (!completer.isCompleted) completer.completeError(error);
      },
    );

    return completer.future;
  }

  Future<void> logout() async {
    final completer = Completer<void>();
    await CometChatUIKit.logout(
      onSuccess: (String message) {
        debugPrint("CometChat Logout Success: $message");
        if (!completer.isCompleted) completer.complete();
      },
      onError: (CometChatException error) {
        debugPrint("CometChat Logout Error: ${error.message}");
        if (!completer.isCompleted) completer.complete(); // Complete anyway
      },
    );
    return completer.future;
  }
}
