import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Widget? icon;
  final Gradient? gradient;
  final Color? color;

  const LargeButton({
    super.key,
    required this.text,
    this.onTap,
    this.icon,
    this.gradient,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        gradient: color == null
            ? (gradient ??
                const LinearGradient(
                  colors: [Color(0xFF0055C3), Color(0xFF0055C3)],
                ))
            : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
