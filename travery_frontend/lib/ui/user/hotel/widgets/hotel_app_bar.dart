import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/core/themes/app_text_theme.dart';

class HotelAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback? onBack;
  final bool showConfirmDialog;

  const HotelAppBar({
    super.key,
    required this.title,
    this.leadingIcon = Icons.arrow_back,
    this.onBack,
    this.showConfirmDialog = false,
  });

  String get _displayTitle {
    if (title.length <= 20) return title;
    return '${title.substring(0, 20)}...';
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      leading: IconButton(
        icon: Icon(leadingIcon),
        onPressed: () {
          if (onBack != null) {
            onBack!();
          } else if (showConfirmDialog) {
            _showConfirmDialog(context);
          } else {
            context.pop();
          }
        },
      ),
      title: SizedBox(
        width: double.infinity,
        child: Text(
          _displayTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: AppTextTheme.labelMedium,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      centerTitle: true,
    );
  }

  void _showConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Xác nhận hủy'),
        content: const Text('Bạn có chắc chắn muốn hủy thanh toán không?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Không'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.pop();
            },
            child: const Text('Có, hủy'),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
