import 'package:freezed_annotation/freezed_annotation.dart';

part 'tour_summary_response.freezed.dart';
part 'tour_summary_response.g.dart';

@freezed
abstract class TourSummaryResponse with _$TourSummaryResponse {
  const factory TourSummaryResponse({
    required String id,
    required String name,
    required double averageRating,
    required double price,
    String? thumbnailUrl,
    required String destinationName,
    required int durationDays,
  }) = _TourSummaryResponse;

  factory TourSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$TourSummaryResponseFromJson(json);
}
