import 'package:freezed_annotation/freezed_annotation.dart';

part 'incident.freezed.dart';
part 'incident.g.dart';

@freezed
abstract class Incident with _$Incident {
  const factory Incident({
    String? id,

    @JsonKey(name: 'handled_by') String? handledBy,

    @JsonKey(name: 'tour_booking_id') String? tourBookingId,

    @JsonKey(name: 'coach_booking_id') String? coachBookingId,

    @JsonKey(name: 'hotel_booking_id') String? hotelBookingId,

    @JsonKey(name: 'reported_by_user_id') String? reportedByUserId,

    @JsonKey(name: 'reported_by_staff_id') String? reportedByStaffId,

    required IncidentType type,

    required IncidentSeverity severity,

    String? description,

    @JsonKey(name: 'image_url') String? imageUrl,

    String? location,

    required IncidentStatus status,

    @JsonKey(name: 'reported_at') DateTime? reportedAt,

    @JsonKey(name: 'resolved_at') DateTime? resolvedAt,

    @JsonKey(name: 'resolution_notes') String? resolutionNotes,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Incident;

  factory Incident.fromJson(Map<String, dynamic> json) =>
      _$IncidentFromJson(json);
}

@JsonEnum()
enum IncidentType { vehicle, health, loss, service, other }

@JsonEnum()
enum IncidentSeverity { low, medium, high }

@JsonEnum()
enum IncidentStatus { reported, inProgress, resolved }
