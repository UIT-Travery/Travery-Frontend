import 'package:flutter/material.dart';
import 'package:travery_frontend/ui/core/themes/app_colors.dart';
import 'package:travery_frontend/utils/review_guards.dart';

typedef ReviewSubmitter =
    Future<String?> Function({required int rating, required String comment});

Future<bool?> pushWriteReviewScreen(
  BuildContext context, {
  required String title,
  required String imageUrl,
  required ReviewSubmitter onSubmit,
}) {
  return Navigator.of(context).push<bool>(
    MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => WriteReviewScreen(
        title: title,
        imageUrl: imageUrl,
        onSubmit: onSubmit,
      ),
    ),
  );
}

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onSubmit,
  });

  final String title;
  final String imageUrl;
  final ReviewSubmitter onSubmit;

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  static const _fallbackImage =
      'https://hanoispiritofplace.com/wp-content/uploads/2017/11/hinh-nen-bien-dep-49.jpg';

  final _commentController = TextEditingController();
  int _rating = 5;
  bool _isSubmitting = false;
  String? _error;
  bool _isAlreadyReviewed = false;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final content = _commentController.text.trim();

    if (content.isEmpty) {
      setState(() => _error = 'Vui lòng nhập nhận xét chi tiết');
      return;
    }

    setState(() {
      _isSubmitting = true;
      _error = null;
    });

    final error = await widget.onSubmit(rating: _rating, comment: content);

    if (!mounted) return;

    if (error == null) {
      Navigator.of(context).pop(true);
      return;
    }

    setState(() {
      _isSubmitting = false;
      _isAlreadyReviewed = isDuplicateReviewError(error);
      _error = friendlyReviewError(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.imageUrl.isNotEmpty
        ? widget.imageUrl
        : _fallbackImage;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: _isSubmitting ? null : () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
        ),
        title: const Text(
          'Đánh giá',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1F2937),
          ),
        ),
        centerTitle: false,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: Color(0xFFF3F4F6)),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 190,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Image.network(_fallbackImage, fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Transform.translate(
              offset: const Offset(0, -24),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.fromLTRB(18, 20, 18, 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(22),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.10),
                      blurRadius: 25,
                      offset: const Offset(0, 10),
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Trải nghiệm của bạn\nthế nào?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.15,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Đánh giá của bạn sẽ giúp cộng đồng Travery có những chuyến đi tuyệt vời hơn.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.45,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          final value = index + 1;
                          final selected = value <= _rating;
                          return SizedBox(
                            width: 40,
                            height: 40,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints.tightFor(
                                width: 40,
                                height: 40,
                              ),
                              onPressed: _isSubmitting
                                  ? null
                                  : () => setState(() => _rating = value),
                              icon: Icon(
                                selected
                                    ? Icons.star_rounded
                                    : Icons.star_border_rounded,
                                color: selected
                                    ? AppColors.primary
                                    : const Color(0xFFD1D5DB),
                                size: 34,
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'NHẬN XÉT CHI TIẾT',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF9CA3AF),
                            letterSpacing: 0.6,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _commentController,
                        enabled: !_isSubmitting,
                        minLines: 5,
                        maxLines: 7,
                        maxLength: 500,
                        decoration: InputDecoration(
                          hintText:
                              'Chia sẻ thêm về những trải nghiệm đáng nhớ hoặc góp ý để chúng tôi cải thiện tốt hơn...',
                          hintStyle: const TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 13,
                            height: 1.4,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF5F9FF),
                          contentPadding: const EdgeInsets.all(14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color(0xFFF3F4F6),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Color(0xFFF3F4F6),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      if (_error != null) ...[
                        const SizedBox(height: 4),
                        _ReviewMessageBox(
                          message: _error!,
                          isAlreadyReviewed: _isAlreadyReviewed,
                        ),
                      ],
                      if (_isAlreadyReviewed) ...[
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () => Navigator.of(context).pop(false),
                            icon: const Icon(Icons.check_circle_outline),
                            label: const Text('Đã hiểu'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.primary,
                              side: const BorderSide(color: AppColors.primary),
                              padding: const EdgeInsets.symmetric(vertical: 13),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: _isSubmitting || _isAlreadyReviewed
                              ? null
                              : _submit,
                          icon: _isSubmitting
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Icon(Icons.send_rounded, size: 20),
                          label: Text(
                            _isSubmitting ? 'Đang gửi...' : 'Gửi đánh giá',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: const Color(0xFFCBD5E1),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewMessageBox extends StatelessWidget {
  const _ReviewMessageBox({
    required this.message,
    required this.isAlreadyReviewed,
  });

  final String message;
  final bool isAlreadyReviewed;

  @override
  Widget build(BuildContext context) {
    final color = isAlreadyReviewed
        ? AppColors.primary
        : const Color(0xFFDC2626);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isAlreadyReviewed
                ? Icons.check_circle_outline
                : Icons.info_outline_rounded,
            size: 18,
            color: color,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: 13,
                color: color,
                height: 1.35,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
