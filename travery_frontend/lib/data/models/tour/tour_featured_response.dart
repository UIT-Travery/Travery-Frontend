class TourFeaturedItem {
  const TourFeaturedItem({
    required this.id,
    required this.name,
    this.averageRating,
    required this.price,
    this.thumbnailUrl,
    this.destinationName,
    this.durationDays,
  });

  final String id;
  final String name;
  final double? averageRating;
  final double price;
  final String? thumbnailUrl;
  final String? destinationName;
  final int? durationDays;

  factory TourFeaturedItem.fromJson(Map<String, dynamic> json) {
    return TourFeaturedItem(
      id: json['id'] as String,
      name: json['name'] as String,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      price: (json['price'] as num).toDouble(),
      thumbnailUrl: json['thumbnailUrl'] as String?,
      destinationName: json['destinationName'] as String?,
      durationDays: json['durationDays'] as int?,
    );
  }

  String? get fullThumbnailUrl {
    if (thumbnailUrl == null || thumbnailUrl!.isEmpty) return null;
    if (thumbnailUrl!.startsWith('http://') ||
        thumbnailUrl!.startsWith('https://')) {
      return thumbnailUrl;
    }
    return null;
  }
}

class TourFeaturedResponse {
  const TourFeaturedResponse({
    required this.httpStatus,
    this.message,
    required this.data,
  });

  final int httpStatus;
  final String? message;
  final List<TourFeaturedItem> data;

  factory TourFeaturedResponse.fromJson(Map<String, dynamic> json) {
    return TourFeaturedResponse(
      httpStatus: json['httpStatus'] as int,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>)
          .map((e) => TourFeaturedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
