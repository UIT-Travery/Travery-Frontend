import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travery_frontend/data/repositories/notification/notification_repository.dart';
import 'package:travery_frontend/utils/core_result.dart';

class NotificationBadge extends StatefulWidget {
  final Color? iconColor;
  final double iconSize;
  final VoidCallback? onTap;

  const NotificationBadge({
    super.key,
    this.iconColor,
    this.iconSize = 24,
    this.onTap,
  });

  @override
  State<NotificationBadge> createState() => _NotificationBadgeState();
}

class _NotificationBadgeState extends State<NotificationBadge> {
  int _unreadCount = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _fetchUnreadCount();
    // Refresh every 30 seconds
    _timer = Timer.periodic(const Duration(seconds: 30), (_) => _fetchUnreadCount());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _fetchUnreadCount() async {
    // Only show loading indicator on initial fetch if needed, 
    // but here we just update silently for periodic refreshes
    final repository = context.read<NotificationRepository>();
    final result = await repository.getUnreadCount();
    
    if (mounted) {
      setState(() {
        if (result is Ok<int>) {
          _unreadCount = result.value;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(
              Icons.notifications_outlined,
              color: widget.iconColor ?? Colors.black87,
              size: widget.iconSize,
            ),
            if (_unreadCount > 0)
              Positioned(
                right: -4,
                top: -4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    _unreadCount > 99 ? '99+' : '$_unreadCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
