// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_tour_booking_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateTourBookingRequest _$CreateTourBookingRequestFromJson(
  Map<String, dynamic> json,
) => _CreateTourBookingRequest(
  members: (json['members'] as List<dynamic>)
      .map((e) => BookingMemberRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
  specialRequests: json['specialRequests'] as String? ?? '',
);

Map<String, dynamic> _$CreateTourBookingRequestToJson(
  _CreateTourBookingRequest instance,
) => <String, dynamic>{
  'members': instance.members,
  'specialRequests': instance.specialRequests,
};

_BookingMemberRequest _$BookingMemberRequestFromJson(
  Map<String, dynamic> json,
) => _BookingMemberRequest(
  fullName: json['fullName'] as String,
  identityNumber: json['identityNumber'] as String? ?? '',
  dateOfBirth: json['dateOfBirth'] as String? ?? '',
  memberType: json['memberType'] as String? ?? 'ADULT',
);

Map<String, dynamic> _$BookingMemberRequestToJson(
  _BookingMemberRequest instance,
) => <String, dynamic>{
  'fullName': instance.fullName,
  'identityNumber': instance.identityNumber,
  'dateOfBirth': instance.dateOfBirth,
  'memberType': instance.memberType,
};
