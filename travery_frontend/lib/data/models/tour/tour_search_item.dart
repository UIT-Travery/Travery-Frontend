import 'package:travery_frontend/config/app_config.dart';

class TourSearchItem {
  const TourSearchItem({
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

  factory TourSearchItem.fromJson(Map<String, dynamic> json) {
    return TourSearchItem(
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
    return 'https://${AppConfig.baseUrl}$thumbnailUrl';
  }
}
