import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.leading,
  });

  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: showBackButton
          ? (leading ??
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF131B2E)),
                  onPressed: () => context.pop(),
                ))
          : leading,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color(0xFF131B2E),
        ),
      ),
      centerTitle: true,
      actions: actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: const Color(0xFFE8EAF0),
          height: 1,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}
