import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';
import 'package:app_links/app_links.dart';

import 'package:travery_frontend/config/dependencies.dart';
import 'package:travery_frontend/data/services/deep_link_service.dart';
import 'package:travery_frontend/data/services/chat/chat_service.dart';
import 'package:travery_frontend/data/services/security_storage_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';
import 'main.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  debugPrint("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.root.level = Level.ALL;

  // Initialize Firebase & FCM
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  debugPrint('User granted permission: ${settings.authorizationStatus}');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint('Got a message whilst in the foreground!');
    debugPrint('Message data: ${message.data}');

    if (message.notification != null) {
      debugPrint('Message also contained a notification: ${message.notification}');
    }
  });

  final storage = SecurityStorageService();
  try {
    String? fcmToken = await messaging.getToken();
    if (fcmToken != null) {
      debugPrint('FCM Registration Token: $fcmToken');
      await storage.saveFcmToken(fcmToken);
    }
  } catch (e) {
    debugPrint("Failed to get FCM token: $e");
  }

  // Initialize ChatService
  final chatService = ChatService();
  await chatService.init();

  // Try to login if we have a saved CometChat UID
  final cometchatUid = await storage.getCometchatUid();
  if (cometchatUid != null) {
    try {
      await chatService.login(cometchatUid);
    } catch (e) {
      debugPrint("Startup CometChat login failed: $e");
    }
  }
  final deepLinkService = DeepLinkService.instance;
  final appLinks = AppLinks();

  runApp(
    MultiProvider(
      providers: providers,
      child: Builder(
        builder: (context) {
          return MyApp(
            onRouterInitialized: (router) {
              deepLinkService.registerRouter(router);
            },
          );
        },
      ),
    ),
  );

  // Listen for deep links (handles both cold start and hot start)
  appLinks.uriLinkStream.listen((uri) {
    deepLinkService.handleUri(uri);
  });
}
