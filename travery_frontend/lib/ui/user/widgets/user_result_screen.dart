import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travery_frontend/routing/routes.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/ui/user/widgets/user_app_bar.dart';

enum UserResultStatus { success, failed, waiting, processing, warning }

class UserResultAction {
  const UserResultAction({
    required this.label,
    required this.onPressed,
    this.icon,
    this.isPrimary = true,
    this.backgroundColor,
  });

  const UserResultAction.primary({
    required this.label,
    required this.onPressed,
    this.icon,
    this.backgroundColor,
  }) : isPrimary = true;

  const UserResultAction.secondary({
    required this.label,
    required this.onPressed,
    this.icon,
  }) : isPrimary = false,
       backgroundColor = null;

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isPrimary;
  final Color? backgroundColor;
}

class UserResultDetail {
  const UserResultDetail({
    required this.label,
    required this.value,
    this.highlighted = false,
    this.valueColor,
    this.maxLines = 2,
  });

  final String label;
  final String value;
  final bool highlighted;
  final Color? valueColor;
  final int maxLines;
}

class UserResultScreen extends StatelessWidget {
  const UserResultScreen({
    super.key,
    required this.status,
    required this.appBarTitle,
    required this.title,
    required this.message,
    this.summaryTitle,
    this.summaryIcon,
    this.details = const [],
    this.isSummaryLoading = false,
    this.note,
    this.noteIcon = Icons.info_outline,
    this.actions = const [],
    this.onClose,
    this.showAppBar = true,
  });

  final UserResultStatus status;
  final String appBarTitle;
  final String title;
  final String message;
  final String? summaryTitle;
  final IconData? summaryIcon;
  final List<UserResultDetail> details;
  final bool isSummaryLoading;
  final String? note;
  final IconData noteIcon;
  final List<UserResultAction> actions;
  final VoidCallback? onClose;
  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _close(context);
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        appBar: showAppBar
            ? UserAppBar(
                title: appBarTitle,
                leading: IconButton(
                  icon: const Icon(Icons.close, color: Color(0xFF131B2E)),
                  onPressed: () => _close(context),
                ),
              )
            : null,
        body: SafeArea(
          top: !showAppBar,
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 28, 20, 18),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8),
                        _ResultBadge(status: status),
                        const SizedBox(height: 22),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1E293B),
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            message,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF64748B),
                              height: 1.45,
                            ),
                          ),
                        ),
                        if (summaryTitle != null ||
                            details.isNotEmpty ||
                            isSummaryLoading) ...[
                          const SizedBox(height: 24),
                          _SummaryCard(
                            title: summaryTitle,
                            icon: summaryIcon,
                            details: details,
                            isLoading: isSummaryLoading,
                          ),
                        ],
                        if (note != null && note!.trim().isNotEmpty) ...[
                          const SizedBox(height: 14),
                          _NoteBox(icon: noteIcon, text: note!),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
              if (actions.isNotEmpty) _ActionBar(actions: actions),
            ],
          ),
        ),
      ),
    );
  }

  void _close(BuildContext context) {
    final handler = onClose;
    if (handler != null) {
      handler();
      return;
    }
    context.go(Routes.home);
  }
}

class _ResultBadge extends StatelessWidget {
  const _ResultBadge({required this.status});

  final UserResultStatus status;

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      UserResultStatus.success => AppColors.success,
      UserResultStatus.failed => AppColors.error,
      UserResultStatus.waiting => const Color(0xFF64748B),
      UserResultStatus.processing => AppColors.primary,
      UserResultStatus.warning => const Color(0xFFF59E0B),
    };
    final icon = switch (status) {
      UserResultStatus.success => Icons.check,
      UserResultStatus.failed => Icons.close,
      UserResultStatus.waiting => Icons.receipt_long_outlined,
      UserResultStatus.processing => Icons.sync,
      UserResultStatus.warning => Icons.hourglass_empty,
    };

    return Container(
      width: 86,
      height: 86,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        shape: BoxShape.circle,
      ),
      child: Container(
        width: 62,
        height: 62,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: status == UserResultStatus.processing
            ? const SizedBox.square(
                dimension: 28,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : SizedBox.square(
                dimension: 34,
                child: Center(child: Icon(icon, color: Colors.white, size: 34)),
              ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.title,
    required this.icon,
    required this.details,
    required this.isLoading,
  });

  final String? title;
  final IconData? icon;
  final List<UserResultDetail> details;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          if (title != null) ...[
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon ?? Icons.receipt_long_outlined,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                ),
              ],
            ),
            if (details.isNotEmpty || isLoading) const SizedBox(height: 14),
          ],
          if (isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(strokeWidth: 2.4),
              ),
            ),
          for (var i = 0; i < details.length; i++) ...[
            if (i > 0) const Divider(height: 20, color: Color(0xFFE2E8F0)),
            _DetailRow(detail: details[i]),
          ],
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.detail});

  final UserResultDetail detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            detail.label,
            style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 5,
          child: Text(
            detail.value,
            maxLines: detail.maxLines,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: detail.highlighted ? 18 : 14,
              fontWeight: detail.highlighted
                  ? FontWeight.w800
                  : FontWeight.w700,
              color:
                  detail.valueColor ??
                  (detail.highlighted
                      ? AppColors.primary
                      : const Color(0xFF1E293B)),
              height: 1.25,
            ),
          ),
        ),
      ],
    );
  }
}

class _NoteBox extends StatelessWidget {
  const _NoteBox({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox.square(
            dimension: 18,
            child: Center(
              child: Icon(icon, color: AppColors.primary, size: 18),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF475569),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({required this.actions});

  final List<UserResultAction> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        MediaQuery.of(context).padding.bottom + 12,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE2E8F0))),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < actions.length; i++) ...[
            if (i > 0) const SizedBox(height: 8),
            _ActionButton(action: actions[i]),
          ],
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.action});

  final UserResultAction action;

  @override
  Widget build(BuildContext context) {
    if (!action.isPrimary) {
      return SizedBox(
        width: double.infinity,
        child: TextButton(
          onPressed: action.onPressed,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          child: _ActionLabel(action: action),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: action.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: action.backgroundColor ?? AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: _ActionLabel(action: action),
      ),
    );
  }
}

class _ActionLabel extends StatelessWidget {
  const _ActionLabel({required this.action});

  final UserResultAction action;

  @override
  Widget build(BuildContext context) {
    final icon = action.icon;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          SizedBox.square(
            dimension: 18,
            child: Center(child: Icon(icon, size: 18)),
          ),
          const SizedBox(width: 8),
        ],
        Flexible(
          child: Text(
            action.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}

String formatUserResultPrice(num price) {
  final str = price.toStringAsFixed(0);
  final formatted = str.replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (m) => '${m[1]},',
  );
  return '$formattedđ';
}

String shortUserResultCode(String? id) {
  if (id == null || id.trim().isEmpty) return 'N/A';
  final clean = id.replaceAll('-', '').trim();
  return clean.length >= 8
      ? clean.substring(0, 8).toUpperCase()
      : clean.toUpperCase();
}
