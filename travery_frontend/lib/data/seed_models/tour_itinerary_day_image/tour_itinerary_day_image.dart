import 'package:freezed_annotation/freezed_annotation.dart';

part 'tour_itinerary_day_image.freezed.dart';
part 'tour_itinerary_day_image.g.dart';

@freezed
abstract class TourItineraryDayImage with _$TourItineraryDayImage {
  const factory TourItineraryDayImage({
    String? id,

    @JsonKey(name: 'itinerary_day_id') required String itineraryDayId,

    @JsonKey(name: 'image_url') required String imageUrl,

    String? caption,

    @JsonKey(name: 'display_order') required int displayOrder,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _TourItineraryDayImage;

  factory TourItineraryDayImage.fromJson(Map<String, dynamic> json) =>
      _$TourItineraryDayImageFromJson(json);
}
