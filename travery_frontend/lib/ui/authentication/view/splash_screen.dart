import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/repositories/authentication/auth_repository.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';

/// Displayed once at cold start.
///
/// Checks whether a valid session exists in secure storage and
/// navigates the user to the correct home screen for their role,
/// or falls back to the login screen if no session is found.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeIn;
  late final Animation<double> _scale;

  /// Minimum time the splash is shown so it doesn't flash on fast devices.
  static const _minDisplayMs = 2000;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _scale = Tween<double>(
      begin: 0.82,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    _checkSessionAndNavigate();
  }

  Future<void> _checkSessionAndNavigate() async {
    final stopwatch = Stopwatch()..start();

    final authRepository = context.read<AuthRepository>();
    final role = await authRepository.getPersistedRole();

    // Ensure the splash is visible for at least [_minDisplayMs] ms.
    final elapsed = stopwatch.elapsedMilliseconds;
    if (elapsed < _minDisplayMs) {
      await Future.delayed(Duration(milliseconds: _minDisplayMs - elapsed));
    }

    if (!mounted) return;

    final destination = _routeForRole(role);
    context.go(destination);
  }

  /// Maps a role string to the correct initial route.
  String _routeForRole(String? role) {
    switch (role) {
      case 'ROLE_ADMIN':
        return Routes.adminMain;
      case 'ROLE_COORDINATOR':
        return Routes.coordinatorMain;
      case 'ROLE_GUIDE':
        return Routes.guideHome;
      case 'ROLE_TOURIST':
        return Routes.tourHome;
      default:
        // No session / unknown role → login
        return Routes.login;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: FadeTransition(
            opacity: _fadeIn,
            child: ScaleTransition(
              scale: _scale,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // App icon / logo placeholder
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: AppColors.primary, width: 1.5),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.travel_explore_rounded,
                        size: 60,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Travery',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Bắt đầu hành trình của bạn từ đây',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 52),
                  SizedBox(
                    width: 28,
                    height: 28,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
