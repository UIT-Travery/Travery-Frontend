import 'package:freezed_annotation/freezed_annotation.dart';

part 'tour_response.freezed.dart';
part 'tour_response.g.dart';

@freezed
class TourResponse with _$TourResponse {
  const factory TourResponse({
    required String id,
    required String name,
    @Default('') String description,
    @Default('') String destinationName,
    @Default('') String hotelName,
    @Default('') String pickupLocation,
    @Default(0.0) double pricePerAdult,
    @Default(0.0) double pricePerChild,
    @Default(false) bool custom,
  }) = _TourResponse;

  factory TourResponse.fromJson(Map<String, dynamic> json) =>
      _$TourResponseFromJson(json);
}
