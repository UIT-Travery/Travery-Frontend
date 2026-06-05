// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_booking_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TourBookingMember _$TourBookingMemberFromJson(Map<String, dynamic> json) =>
    _TourBookingMember(
      id: json['id'] as String?,
      tourBookingId: json['tour_booking_id'] as String,
      fullName: json['full_name'] as String,
      identityNumber: json['identity_number'] as String?,
      identityType: $enumDecodeNullable(
        _$IdentityTypeEnumMap,
        json['identity_type'],
      ),
      isChild: json['is_child'] as bool,
      status: $enumDecode(_$BookingMemberStatusEnumMap, json['status']),
      cancelledAt: json['cancelled_at'] == null
          ? null
          : DateTime.parse(json['cancelled_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$TourBookingMemberToJson(_TourBookingMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tour_booking_id': instance.tourBookingId,
      'full_name': instance.fullName,
      'identity_number': instance.identityNumber,
      'identity_type': _$IdentityTypeEnumMap[instance.identityType],
      'is_child': instance.isChild,
      'status': _$BookingMemberStatusEnumMap[instance.status]!,
      'cancelled_at': instance.cancelledAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$IdentityTypeEnumMap = {
  IdentityType.cccd: 'cccd',
  IdentityType.passport: 'passport',
  IdentityType.birthCertificate: 'birthCertificate',
};

const _$BookingMemberStatusEnumMap = {
  BookingMemberStatus.active: 'active',
  BookingMemberStatus.cancelled: 'cancelled',
};
