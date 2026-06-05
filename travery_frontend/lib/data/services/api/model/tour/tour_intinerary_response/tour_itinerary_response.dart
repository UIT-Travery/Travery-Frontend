import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travery_frontend/data/services/api/model/tour/image_reponse/image_response.dart';

part 'tour_itinerary_response.freezed.dart';
part 'tour_itinerary_response.g.dart';

@freezed
abstract class TourItineraryResponse with _$TourItineraryResponse {
  const factory TourItineraryResponse({
    required int dayNumber,
    required String title,
    required String description,
    @Default([]) List<ImageResponse> images,
  }) = _TourItineraryResponse;

  factory TourItineraryResponse.fromJson(Map<String, dynamic> json) =>
      _$TourItineraryResponseFromJson(json);
}
