// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recep_booking_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecepBookingListResponse _$RecepBookingListResponseFromJson(
  Map<String, dynamic> json,
) => _RecepBookingListResponse(
  id: json['id'] as String,
  guestName: json['guestName'] as String,
  phoneNumber: json['phoneNumber'] as String,
  checkInDate: json['checkInDate'] as String,
  checkOutDate: json['checkOutDate'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$RecepBookingListResponseToJson(
  _RecepBookingListResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'guestName': instance.guestName,
  'phoneNumber': instance.phoneNumber,
  'checkInDate': instance.checkInDate,
  'checkOutDate': instance.checkOutDate,
  'status': instance.status,
};
