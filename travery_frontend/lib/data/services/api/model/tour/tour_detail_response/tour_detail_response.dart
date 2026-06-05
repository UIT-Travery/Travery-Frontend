import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travery_frontend/data/services/api/model/tour/destination_response/destination_response.dart';
import 'package:travery_frontend/data/services/api/model/tour/image_reponse/image_response.dart';
import 'package:travery_frontend/data/services/api/model/tour/refund_policy_response/refund_policy_response.dart';
import 'package:travery_frontend/data/services/api/model/tour/tour_intinerary_response/tour_itinerary_response.dart';

part 'tour_detail_response.freezed.dart';
part 'tour_detail_response.g.dart';

@freezed
abstract class TourDetailResponse with _$TourDetailResponse {
  const factory TourDetailResponse({
    required String id,
    required String name,
    @Default('') String description,
    required double pricePerAdult,
    required double pricePerChild,
    @Default(0.0) double averageRating,
    @Default(0) int ratingCount,
    @Default('') String startLocation,
    @Default(0) int durationDays,
    @Default([]) List<TourItineraryResponse> itineraryList,
    @Default([]) List<ImageResponse> images,
    DestinationResponse? destination,
    RefundPolicyResponse? refundPolicy,
  }) = _TourDetailResponse;

  factory TourDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$TourDetailResponseFromJson(json);
}
