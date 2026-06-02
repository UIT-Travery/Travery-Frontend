import 'package:flutter/material.dart';
import '../../../../ui/core/themes/app_colors.dart';
import '../../../../ui/core/themes/app_text_theme.dart';

class InputButton extends StatelessWidget {
  final String label;
  final String textholder;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback onTap;

  const InputButton({
    super.key,
    required this.label,
    required this.textholder,
    this.prefixIcon,
    this.suffixIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: AppTextTheme.bodyMedium,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            height: 48,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.primaryDarkBlackBlue),
            ),
            child: Row(
              children: [
                if (prefixIcon != null) ...[
                  prefixIcon!,
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Text(
                    textholder,
                    style: TextStyle(
                      fontSize: AppTextTheme.bodyMedium,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                if (suffixIcon != null) ...[
                  const SizedBox(width: 12),
                  suffixIcon!,
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
