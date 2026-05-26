import 'package:flutter/material.dart';
import '../../../../ui/core/themes/app_colors.dart';
import '../../../../ui/core/themes/app_text_theme.dart';

class SmallButton extends StatelessWidget {
  final String label;
  final Widget? prefixIcon;
  final VoidCallback onTap;

  const SmallButton({
    super.key,
    required this.label,
    this.prefixIcon,
    required this.onTap,
    this.color,
    this.height = 28,
  });

  final Color? color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? AppColors.primaryDarkBlackBlue,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (prefixIcon != null) ...[
                prefixIcon!,
                const SizedBox(width: 4),
              ],
              Text(
                label,
                style: TextStyle(
                  fontSize: AppTextTheme.bodyMedium,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
