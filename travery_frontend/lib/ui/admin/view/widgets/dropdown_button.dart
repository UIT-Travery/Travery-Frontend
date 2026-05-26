import 'package:flutter/material.dart';
import '../../../../ui/core/themes/app_colors.dart';
import '../../../../ui/core/themes/app_text_theme.dart';

class CustomDropdownButton extends StatelessWidget {
  final String label;
  final String textholder;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<String> items;
  final String? value;
  final ValueChanged<String?>? onChanged;

  const CustomDropdownButton({
    super.key,
    required this.label,
    required this.textholder,
    this.prefixIcon,
    this.suffixIcon,
    required this.items,
    this.value,
    this.onChanged,
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
        Container(
          height: 48,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.primaryDarkBlackBlue),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              if (prefixIcon != null) ...[
                prefixIcon!,
                const SizedBox(width: 8),
              ],
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: value,
                    hint: Text(
                      textholder,
                      style: TextStyle(
                        fontSize: AppTextTheme.bodyMedium,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textHint,
                      ),
                    ),
                    icon:
                        suffixIcon ??
                        const Icon(Icons.expand_more, color: Colors.black54),
                    style: TextStyle(
                      fontSize: AppTextTheme.bodyMedium,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                    isExpanded: true,
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: onChanged,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
