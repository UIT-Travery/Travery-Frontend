import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travery_frontend/data/services/api/model/tour/tour_summart_response/tour_summary_response.dart';

part 'page_tour_summary_response.freezed.dart';
part 'page_tour_summary_response.g.dart';

@freezed
abstract class PageTourSummaryResponse with _$PageTourSummaryResponse {
  const factory PageTourSummaryResponse({
    @Default([]) List<TourSummaryResponse> content,
    @Default(0) int totalElements,
    @Default(0) int totalPages,
    @Default(0) int size,
    @Default(0) int number,
    @Default(true) bool first,
    @Default(true) bool last,
    @Default(true) bool empty,
  }) = _PageTourSummaryResponse;

  factory PageTourSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$PageTourSummaryResponseFromJson(json);
}
