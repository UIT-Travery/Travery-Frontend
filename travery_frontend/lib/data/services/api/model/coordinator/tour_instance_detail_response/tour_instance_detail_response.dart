import 'package:freezed_annotation/freezed_annotation.dart';

part 'tour_instance_detail_response.freezed.dart';
part 'tour_instance_detail_response.g.dart';

@freezed
abstract class TourInstanceDetailResponse with _$TourInstanceDetailResponse {
  const factory TourInstanceDetailResponse({
    required String id,
    required String tourName,
    required String destinationName,
    @Default('') String pickupLocation,
    required String startDate,
    required String endDate,
    @Default(0) int minParticipants,
    @Default(0) int maxParticipants,
    @Default(0) int currentParticipants,
    required String status,
    String? guideId,
    String? guideName,
    String? guidePhone,
    String? coachId,
    String? coachLicensePlate,
    String? coachType,
    String? driverId,
    String? driverName,
    String? driverPhone,
  }) = _TourInstanceDetailResponse;

  factory TourInstanceDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$TourInstanceDetailResponseFromJson(json);
}
