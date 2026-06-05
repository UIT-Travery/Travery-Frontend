import 'package:freezed_annotation/freezed_annotation.dart';

part 'tour_review.freezed.dart';
part 'tour_review.g.dart';

@freezed
abstract class TourReview with _$TourReview {
  const factory TourReview({
    String? id,

    @JsonKey(name: 'tour_booking_id') required String tourBookingId,

    required int rating,
    String? comment,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _TourReview;

  factory TourReview.fromJson(Map<String, dynamic> json) =>
      _$TourReviewFromJson(json);
}
