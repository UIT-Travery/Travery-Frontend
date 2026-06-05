import 'package:flutter/material.dart';
import 'package:travery_frontend/data/models/review/review_data.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({
    super.key,
    required this.averageRating,
    required this.totalReviews,
    required this.reviews,
    required this.isLoading,
    required this.hasMore,
    required this.onLoadMore,
    this.error,
  });

  final double averageRating;
  final int totalReviews;
  final List<ReviewData> reviews;
  final bool isLoading;
  final bool hasMore;
  final Future<ReviewListState> Function() onLoadMore;
  final String? error;

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty && !isLoading && error == null && totalReviews == 0) {
      return const SizedBox.shrink();
    }

    final previewReviews = reviews.take(2).toList();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFBFAFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE7E9F2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.star_border, size: 18, color: Color(0xFF007AFF)),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Đánh giá',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF131B2E),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: averageRating.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF131B2E),
                          ),
                        ),
                        const TextSpan(
                          text: ' /5',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '$totalReviews đánh giá',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          if (isLoading && reviews.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 18),
                child: CircularProgressIndicator(),
              ),
            )
          else if (error != null && reviews.isEmpty)
            Text(
              'Không thể tải đánh giá',
              style: TextStyle(color: Colors.grey[700], fontSize: 13),
            )
          else
            ...previewReviews.map((review) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _ReviewCard(review: review),
              );
            }),
          if (reviews.isNotEmpty)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => _showAllReviews(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF007AFF),
                  side: const BorderSide(color: Color(0xFF007AFF)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Xem tất cả đánh giá',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _showAllReviews(BuildContext context) async {
    var sheetState = ReviewListState(reviews: reviews, hasMore: hasMore);
    var sheetIsLoading = false;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            Future<void> loadMore() async {
              if (!sheetState.hasMore || sheetIsLoading) return;
              setSheetState(() => sheetIsLoading = true);
              final nextState = await onLoadMore();
              if (!context.mounted) return;
              setSheetState(() {
                sheetState = nextState;
                sheetIsLoading = false;
              });
            }

            return DraggableScrollableSheet(
              initialChildSize: 0.75,
              minChildSize: 0.45,
              maxChildSize: 0.92,
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: SafeArea(
                    top: false,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 10, 8, 8),
                          child: Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  'Tất cả đánh giá',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFF131B2E),
                                  ),
                                ),
                              ),
                              IconButton(
                                tooltip: 'Đóng',
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const Icon(Icons.close),
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 1),
                        Expanded(
                          child: NotificationListener<ScrollNotification>(
                            onNotification: (notification) {
                              if (notification.metrics.extentAfter < 240) {
                                loadMore();
                              }
                              return false;
                            },
                            child: ListView.separated(
                              controller: scrollController,
                              padding: const EdgeInsets.all(16),
                              itemCount:
                                  sheetState.reviews.length +
                                  (sheetState.hasMore || sheetIsLoading
                                      ? 1
                                      : 0),
                              separatorBuilder: (_, _) =>
                                  const SizedBox(height: 12),
                              itemBuilder: (context, index) {
                                if (index >= sheetState.reviews.length) {
                                  if (sheetIsLoading) {
                                    return const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  }
                                  return Center(
                                    child: TextButton(
                                      onPressed: loadMore,
                                      child: const Text('Tải thêm'),
                                    ),
                                  );
                                }
                                return _ReviewCard(
                                  review: sheetState.reviews[index],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

class ReviewListState {
  const ReviewListState({required this.reviews, required this.hasMore});

  final List<ReviewData> reviews;
  final bool hasMore;
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.review});

  final ReviewData review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE7E9F2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFFE8E9FF),
            backgroundImage:
                review.avatarUrl == null || review.avatarUrl!.isEmpty
                ? null
                : NetworkImage(review.avatarUrl!),
            child: review.avatarUrl == null || review.avatarUrl!.isEmpty
                ? Text(
                    _initials(review.authorName),
                    style: const TextStyle(
                      color: Color(0xFF64748B),
                      fontWeight: FontWeight.w800,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        review.authorName,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF131B2E),
                        ),
                      ),
                    ),
                    if (review.createdAt != null)
                      Text(
                        _formatDate(review.createdAt!),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < review.rating.round()
                          ? Icons.star
                          : Icons.star_border,
                      size: 12,
                      color: const Color(0xFFFFB703),
                    );
                  }),
                ),
                if (review.comment.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    review.comment,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF414755),
                      height: 1.45,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _initials(String name) {
    final parts = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
