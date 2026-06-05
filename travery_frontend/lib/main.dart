import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:travery_frontend/routing/app_router.dart';
import 'main_development.dart' as development;

void main() async {
  await dotenv.load();
  development.main();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.onRouterInitialized});

  final void Function(GoRouter router)? onRouterInitialized;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter(
        context.read(),
        onInitialized: onRouterInitialized,
      ),
      theme: ThemeData(
        extensions: [
          // Light Mode
          CometChatColorPalette(
            primary: AppColors.primary,
            textPrimary: Color(0xFF141414),
            textSecondary: Color(0xFF727272),
            background1: Color(0xFFFFFFFF),
            borderLight: Color(0xFFF5F5F5),
            borderDark: Color(0xFFDCDCDC),
            iconSecondary: Color(0xFFA1A1A1),
            iconHighlight: AppColors.primary,
            success: Color(0xFF09C26F),
            warning: Color(0xFFFAAB00),
            extendedPrimary500: Color(0xFFAA9EE8),
            messageSeen: Color(0xFF56E8A7),
            neutral300: Color(0xFFE8E8E8),
            neutral600: Color(0xFF727272),
            neutral900: Color(0xFF141414),
          ),
        ],
      ),
    );
  }
}
