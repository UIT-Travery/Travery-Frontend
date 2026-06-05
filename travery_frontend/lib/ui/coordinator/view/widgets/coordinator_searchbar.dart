import 'package:flutter/material.dart';
import '../../../core/themes/app_text_theme.dart';
import '../../../core/themes/app_colors.dart';

class CoordinatorSearchBar extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final VoidCallback? onFilterTap;
  final VoidCallback? onSearchTap;
  final ValueChanged<String>? onSearchChanged;

  const CoordinatorSearchBar({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    this.onFilterTap,
    this.onSearchTap,
    this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(8.0),
        // Using inputBorder for a subtle edge, typical for these fields
        border: Border.all(color: AppColors.inputBorder, width: 1.0),
      ),
      child: TextField(
        controller: controller,
        onChanged: onSearchChanged,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(
          fontSize: AppTextTheme.bodyMedium,
          color: AppColors.textPrimary,
        ),
        decoration: const InputDecoration(
          isDense: true,
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: AppTextTheme.hintLarge,
            color: AppColors.textHint,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.icon,
            size: 20.0,
          ),
          // Forces the icon to center properly within the 36px height
          prefixIconConstraints: BoxConstraints(
            minWidth: 40.0,
            minHeight: 36.0,
          ),
          border: InputBorder.none,
          // Zero padding since textAlignVertical handles the centering
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
