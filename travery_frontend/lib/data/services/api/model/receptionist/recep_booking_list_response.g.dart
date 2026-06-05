// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recep_booking_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecepBookingListResponseImpl _$$RecepBookingListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RecepBookingListResponseImpl(
  id: json['id'] as String,
  guestName: json['guestName'] as String,
  phoneNumber: json['phoneNumber'] as String,
  checkInDate: json['checkInDate'] as String,
  checkOutDate: json['checkOutDate'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$$RecepBookingListResponseImplToJson(
  _$RecepBookingListResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'guestName': instance.guestName,
  'phoneNumber': instance.phoneNumber,
  'checkInDate': instance.checkInDate,
  'checkOutDate': instance.checkOutDate,
  'status': instance.status,
};
