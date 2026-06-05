import 'package:freezed_annotation/freezed_annotation.dart';

part 'coach_route.freezed.dart';
part 'coach_route.g.dart';

@freezed
abstract class CoachRoute with _$CoachRoute {
  const factory CoachRoute({
    String? id,

    @JsonKey(name: 'origin_code') required String originCode,

    @JsonKey(name: 'destination_code') required String destinationCode,

    @JsonKey(name: 'departure_time') required String departureTime,

    @JsonKey(name: 'estimated_duration_minutes')
    required int estimatedDurationMinutes,

    @JsonKey(name: 'base_price') required double basePrice,

    @JsonKey(name: 'is_active') required bool isActive,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,

    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
  }) = _CoachRoute;

  factory CoachRoute.fromJson(Map<String, dynamic> json) =>
      _$CoachRouteFromJson(json);
}
