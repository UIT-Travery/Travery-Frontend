import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
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
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter(
        context.read(),
        onInitialized: onRouterInitialized,
      ),
    );
  }
}
