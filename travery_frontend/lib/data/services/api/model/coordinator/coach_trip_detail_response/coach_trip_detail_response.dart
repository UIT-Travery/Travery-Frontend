import 'package:freezed_annotation/freezed_annotation.dart';

part 'coach_trip_detail_response.freezed.dart';
part 'coach_trip_detail_response.g.dart';

@freezed
class CoachTripDetailResponse with _$CoachTripDetailResponse {
  const factory CoachTripDetailResponse({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'departureTime') DateTime? departureTime,
    @JsonKey(name: 'arrivalTime') DateTime? arrivalTime,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'routeId') String? routeId,
    @JsonKey(name: 'originDestinationName') String? originDestinationName,
    @JsonKey(name: 'destinationDestinationName') String? destinationDestinationName,
    @JsonKey(name: 'basePrice') double? basePrice,
    @JsonKey(name: 'coachId') String? coachId,
    @JsonKey(name: 'coachLicensePlate') String? coachLicensePlate,
    @JsonKey(name: 'coachType') String? coachType,
    @JsonKey(name: 'driverId') String? driverId,
    @JsonKey(name: 'driverName') String? driverName,
    @JsonKey(name: 'driverPhone') String? driverPhone,
    @JsonKey(name: 'guideId') String? guideId,
    @JsonKey(name: 'guideName') String? guideName,
    @JsonKey(name: 'guidePhone') String? guidePhone,
    @JsonKey(name: 'totalSeats') int? totalSeats,
    @JsonKey(name: 'availableSeats') int? availableSeats,
    @JsonKey(name: 'bookingsCount') int? bookingsCount,
    @JsonKey(name: 'passengersCount') int? passengersCount,
  }) = _CoachTripDetailResponse;

  factory CoachTripDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$CoachTripDetailResponseFromJson(json);
}
