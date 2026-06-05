class ReviewData {
  const ReviewData({
    required this.id,
    required this.authorName,
    required this.rating,
    required this.comment,
    this.createdAt,
    this.avatarUrl,
  });

  final String id;
  final String authorName;
  final double rating;
  final String comment;
  final DateTime? createdAt;
  final String? avatarUrl;

  factory ReviewData.fromJson(Map<String, dynamic> json) {
    final user =
        _readMap(json['user']) ??
        _readMap(json['tourist']) ??
        _readMap(json['reviewer']) ??
        _readMap(json['customer']);

    return ReviewData(
      id: _readString(json['id']),
      authorName: _firstNonEmpty([
        json['authorName'],
        json['reviewerName'],
        json['userName'],
        json['customerName'],
        json['touristName'],
        json['fullName'],
        json['name'],
        user?['fullName'],
        user?['name'],
        user?['email'],
      ], fallback: 'Khách hàng'),
      rating: _readDouble(json['rating'] ?? json['score'] ?? json['stars']),
      comment: _firstNonEmpty([
        json['comment'],
        json['content'],
        json['review'],
        json['description'],
      ]),
      createdAt: _readDate(
        json['createdAt'] ??
            json['created_at'] ??
            json['date'] ??
            json['reviewedAt'],
      ),
      avatarUrl: _firstNonEmpty([
        json['avatarUrl'],
        json['avatar'],
        json['imageUrl'],
        user?['avatarUrl'],
        user?['avatar'],
        user?['imageUrl'],
      ]),
    );
  }

  static Map<String, dynamic>? _readMap(dynamic value) {
    return value is Map<String, dynamic> ? value : null;
  }

  static String _readString(dynamic value) {
    return value is String ? value : '';
  }

  static double _readDouble(dynamic value) {
    return value is num ? value.toDouble() : 0;
  }

  static DateTime? _readDate(dynamic value) {
    if (value is! String || value.isEmpty) return null;
    return DateTime.tryParse(value);
  }

  static String _firstNonEmpty(List<dynamic> values, {String fallback = ''}) {
    for (final value in values) {
      if (value is String && value.trim().isNotEmpty) {
        return value.trim();
      }
    }
    return fallback;
  }
}

class ReviewPageData {
  const ReviewPageData({
    required this.reviews,
    required this.totalElements,
    required this.totalPages,
    required this.currentPage,
    required this.pageSize,
  });

  final List<ReviewData> reviews;
  final int totalElements;
  final int totalPages;
  final int currentPage;
  final int pageSize;

  bool get hasMore => currentPage < totalPages - 1;

  factory ReviewPageData.fromJson(Map<String, dynamic> json) {
    final page = json['page'] as Map<String, dynamic>?;
    final pageData = page ?? json;
    final content = json['content'] as List<dynamic>? ?? [];

    return ReviewPageData(
      reviews: content
          .whereType<Map<String, dynamic>>()
          .map(ReviewData.fromJson)
          .toList(),
      totalElements: pageData['totalElements'] as int? ?? 0,
      totalPages: pageData['totalPages'] as int? ?? 0,
      currentPage:
          pageData['number'] as int? ?? pageData['pageNumber'] as int? ?? 0,
      pageSize: pageData['size'] as int? ?? pageData['pageSize'] as int? ?? 0,
    );
  }
}
