import 'package:freezed_annotation/freezed_annotation.dart';

part 'tour_incident_response.freezed.dart';
part 'tour_incident_response.g.dart';

@freezed
abstract class TourIncidentResponse with _$TourIncidentResponse {
  const factory TourIncidentResponse({
    required String id,
    required String tourInstanceId,
    required String reporterId,
    required String reporterName,
    required String title,
    required String description,
    required String severity,
    required String status,
    @Default('') String createdAt,
    @Default('') String updatedAt,
  }) = _TourIncidentResponse;

  factory TourIncidentResponse.fromJson(Map<String, dynamic> json) =>
      _$TourIncidentResponseFromJson(json);
}
