import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotel_review.freezed.dart';
part 'hotel_review.g.dart';

@freezed
abstract class HotelReview with _$HotelReview {
  const factory HotelReview({
    String? id,

    @JsonKey(name: 'hotel_booking_id') required String hotelBookingId,

    required int rating,

    String? comment,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _HotelReview;

  factory HotelReview.fromJson(Map<String, dynamic> json) =>
      _$HotelReviewFromJson(json);
}
