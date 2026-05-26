import 'package:flutter/material.dart';
import '../../../../ui/core/themes/app_colors.dart';
import '../../../../ui/core/themes/app_text_theme.dart';

class InputTextField extends StatelessWidget {
  final String label;
  final String textholder;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String? initialValue;

  InputTextField({
    super.key,
    required this.label,
    required this.textholder,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    required this.textInputType,
    this.initialValue,
  }) {
    if (initialValue != null && controller.text.isEmpty) {
      controller.text = initialValue!;
    }
  }

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
        Container(
          height: 48,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.primaryDarkBlackBlue),
          ),
          child: TextField(
            controller: controller,
            keyboardType: textInputType,
            style: TextStyle(
              fontSize: AppTextTheme.bodyMedium,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: textholder,
              hintStyle: TextStyle(
                fontSize: AppTextTheme.bodyMedium,
                fontWeight: FontWeight.w500,
                color: AppColors.textHint,
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              border: InputBorder.none,
              isCollapsed: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
