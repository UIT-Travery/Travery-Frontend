import 'package:freezed_annotation/freezed_annotation.dart';

part 'tour_instance_response.freezed.dart';
part 'tour_instance_response.g.dart';

@freezed
class TourInstanceResponse with _$TourInstanceResponse {
  const factory TourInstanceResponse({
    required String id,
    required String tourName,
    required String startDate,
    String? endDate,
    required String status,
    required int currentParticipants,
    int? maxParticipants,
    int? availableSlots,
    String? imageUrl,
  }) = _TourInstanceResponse;

  factory TourInstanceResponse.fromJson(Map<String, dynamic> json) =>
      _$TourInstanceResponseFromJson(json);
}
