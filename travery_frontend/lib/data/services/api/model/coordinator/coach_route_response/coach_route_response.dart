import 'package:freezed_annotation/freezed_annotation.dart';

part 'coach_route_response.freezed.dart';
part 'coach_route_response.g.dart';

@freezed
abstract class CoachRouteResponse with _$CoachRouteResponse {
  const factory CoachRouteResponse({
    required String id,
    required String originDestinationId,
    required String originDestinationName,
    required String destinationDestinationId,
    required String destinationDestinationName,
    required double distanceKm,
    required double estimatedHours,
    required double basePrice,
    String? refundPolicyId,
    String? refundPolicyName,
    required double averageRating,
    required int reviewCount,
  }) = _CoachRouteResponse;

  factory CoachRouteResponse.fromJson(Map<String, dynamic> json) =>
      _$CoachRouteResponseFromJson(json);
}
