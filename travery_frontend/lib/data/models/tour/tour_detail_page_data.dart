import 'package:travery_frontend/data/services/api/model/tour/destination_response/destination_response.dart';
import 'package:travery_frontend/data/services/api/model/tour/refund_policy_response/refund_policy_response.dart';

class TourDetailPageData {
  const TourDetailPageData({
    required this.id,
    required this.name,
    this.description,
    required this.pricePerAdult,
    required this.pricePerChild,
    this.averageRating,
    this.ratingCount,
    this.startLocation,
    this.durationDays,
    this.itineraryList,
    this.images,
    this.destination,
    this.refundPolicy,
  });

  final String id;
  final String name;
  final String? description;
  final double pricePerAdult;
  final double pricePerChild;
  final double? averageRating;
  final int? ratingCount;
  final String? startLocation;
  final int? durationDays;
  final List<TourItineraryPageData>? itineraryList;
  final List<TourImagePageData>? images;
  final DestinationResponse? destination;
  final RefundPolicyResponse? refundPolicy;

  factory TourDetailPageData.fromJson(Map<String, dynamic> json) {
    return TourDetailPageData(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? 'Tour không tên',
      description: json['description'] as String?,
      pricePerAdult: (json['pricePerAdult'] as num?)?.toDouble() ?? 0.0,
      pricePerChild: (json['pricePerChild'] as num?)?.toDouble() ?? 0.0,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      ratingCount: json['ratingCount'] as int?,
      startLocation: json['startLocation'] as String?,
      durationDays: json['durationDays'] as int?,
      itineraryList: (json['itineraryList'] as List<dynamic>?)
          ?.map(
            (e) => TourItineraryPageData.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => TourImagePageData.fromJson(e as Map<String, dynamic>))
          .toList(),
      destination: json['destination'] == null
          ? null
          : DestinationResponse.fromJson(
              json['destination'] as Map<String, dynamic>,
            ),
      refundPolicy: json['refundPolicy'] == null
          ? null
          : RefundPolicyResponse.fromJson(
              json['refundPolicy'] as Map<String, dynamic>,
            ),
    );
  }
}

class TourItineraryPageData {
  const TourItineraryPageData({
    required this.dayNumber,
    required this.title,
    required this.description,
    this.images,
  });

  final int dayNumber;
  final String title;
  final String description;
  final List<TourImagePageData>? images;

  factory TourItineraryPageData.fromJson(Map<String, dynamic> json) {
    return TourItineraryPageData(
      dayNumber: json['dayNumber'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => TourImagePageData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class TourImagePageData {
  const TourImagePageData({required this.url, this.isThumbnail});

  final String url;
  final bool? isThumbnail;

  factory TourImagePageData.fromJson(Map<String, dynamic> json) {
    return TourImagePageData(
      url: json['url'] as String? ?? '',
      isThumbnail:
          json['isThumbnail'] as bool? ?? (json['isThumnail'] as bool?),
    );
  }
}
