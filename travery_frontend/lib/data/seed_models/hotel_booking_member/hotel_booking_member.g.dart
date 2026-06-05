// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_booking_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HotelBookingMember _$HotelBookingMemberFromJson(Map<String, dynamic> json) =>
    _HotelBookingMember(
      id: json['id'] as String?,
      hotelBookingId: json['hotel_booking_id'] as String,
      fullName: json['full_name'] as String,
      cccd: json['cccd'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$HotelBookingMemberToJson(_HotelBookingMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hotel_booking_id': instance.hotelBookingId,
      'full_name': instance.fullName,
      'cccd': instance.cccd,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
