import 'package:freezed_annotation/freezed_annotation.dart';

import '../tour_itinerary_day_image/tour_itinerary_day_image.dart';

part 'tour_itinerary_day.freezed.dart';
part 'tour_itinerary_day.g.dart';

@freezed
abstract class TourItineraryDay with _$TourItineraryDay {
  const factory TourItineraryDay({
    String? id,

    @JsonKey(name: 'tour_id') required String tourId,

    @JsonKey(name: 'day_number') required int dayNumber,

    required String title,

    String? description,

    @JsonKey(name: 'meal_count') required int mealCount,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,

    /// RELATION
    List<TourItineraryDayImage>? images,
  }) = _TourItineraryDay;

  factory TourItineraryDay.fromJson(Map<String, dynamic> json) =>
      _$TourItineraryDayFromJson(json);
}
