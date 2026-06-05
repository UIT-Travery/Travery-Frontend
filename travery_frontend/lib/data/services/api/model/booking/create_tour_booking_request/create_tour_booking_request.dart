import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_tour_booking_request.freezed.dart';
part 'create_tour_booking_request.g.dart';

@freezed
abstract class CreateTourBookingRequest with _$CreateTourBookingRequest {
  const factory CreateTourBookingRequest({
    required List<BookingMemberRequest> members,
    @Default('') String specialRequests,
  }) = _CreateTourBookingRequest;

  factory CreateTourBookingRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTourBookingRequestFromJson(json);
}

@freezed
abstract class BookingMemberRequest with _$BookingMemberRequest {
  const factory BookingMemberRequest({
    required String fullName,
    @Default('') String identityNumber,
    @Default('') String dateOfBirth,
    @Default('ADULT') String memberType,
  }) = _BookingMemberRequest;

  factory BookingMemberRequest.fromJson(Map<String, dynamic> json) =>
      _$BookingMemberRequestFromJson(json);
}
