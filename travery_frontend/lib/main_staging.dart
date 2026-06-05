import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';
import 'package:go_router/go_router.dart';
import 'package:app_links/app_links.dart';

import 'package:travery_frontend/config/dependencies.dart';
import 'package:travery_frontend/data/services/deep_link_service.dart';
import 'package:travery_frontend/data/services/chat/chat_service.dart';
import 'package:travery_frontend/data/services/security_storage_service.dart';
import 'main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.root.level = Level.ALL;

  // Initialize ChatService
  final chatService = ChatService();
  await chatService.init();

  // Try to login if we have a saved CometChat UID
  final storage = SecurityStorageService();
  final cometchatUid = await storage.getCometchatUid();
  if (cometchatUid != null) {
    try {
      await chatService.login(cometchatUid);
    } catch (e) {
      debugPrint("Startup CometChat login failed: $e");
    }
  }

  final appLinks = AppLinks();
  final deepLinkService = DeepLinkService.instance;

  runApp(
    MultiProvider(
      providers: providers,
      child: Builder(
        builder: (context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            deepLinkService.registerRouter(GoRouter.of(context));
          });
          return const MyApp();
        },
      ),
    ),
  );

  appLinks.uriLinkStream.listen((uri) {
    deepLinkService.handleUri(uri);
  });
}
