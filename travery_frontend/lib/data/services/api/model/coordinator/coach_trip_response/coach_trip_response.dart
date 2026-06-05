import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travery_frontend/data/services/api/model/tour/destination_response/destination_response.dart';

part 'coach_trip_response.freezed.dart';
part 'coach_trip_response.g.dart';

@freezed
abstract class CoachTripResponse with _$CoachTripResponse {
  const factory CoachTripResponse({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'departureTime') DateTime? departureTime,
    @JsonKey(name: 'arrivalTime') DateTime? arrivalTime,
    @JsonKey(name: 'coachType') String? coachType,
    @JsonKey(name: 'totalSeats') int? totalSeats,
    @JsonKey(name: 'availableSeats') int? availableSeats,
    @JsonKey(name: 'basePrice') double? basePrice,
    @JsonKey(name: 'originDestination') DestinationResponse? originDestination,
    @JsonKey(name: 'destinationDestination') DestinationResponse? destinationDestination,
    @JsonKey(name: 'status') String? status,
  }) = _CoachTripResponse;

  factory CoachTripResponse.fromJson(Map<String, dynamic> json) =>
      _$CoachTripResponseFromJson(json);
}
