import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.leading,
    this.titleFontSize = 16,
  });

  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Widget? leading;
  final double titleFontSize;

  @override
  Widget build(BuildContext context) {
    final effectiveActions =
        actions ??
        (showBackButton ? const [SizedBox(width: kToolbarHeight)] : null);

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: showBackButton,
      leading: showBackButton
          ? (leading ??
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF131B2E)),
                  onPressed: () => context.pop(),
                ))
          : leading,
      title: SizedBox(
        width: double.infinity,
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF131B2E),
          ),
        ),
      ),
      centerTitle: true,
      actions: effectiveActions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(color: const Color(0xFFE8EAF0), height: 1),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}
