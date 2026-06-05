// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recep_booking_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecepBookingDetailResponseImpl _$$RecepBookingDetailResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RecepBookingDetailResponseImpl(
  id: json['id'] as String,
  guestName: json['guestName'] as String,
  phoneNumber: json['phoneNumber'] as String,
  checkInDate: json['checkInDate'] as String,
  checkOutDate: json['checkOutDate'] as String,
  status: json['status'] as String,
  totalPrice: json['totalPrice'] as num,
  totalAddOnCharges: json['totalAddOnCharges'] as num,
  manifest: (json['manifest'] as List<dynamic>?)
      ?.map((e) => HotelGuestResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  roomAllocations: (json['roomAllocations'] as List<dynamic>?)
      ?.map((e) => RoomAllocationResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
  addOnOrders: (json['addOnOrders'] as List<dynamic>?)
      ?.map((e) => RecepAddOnOrderResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$RecepBookingDetailResponseImplToJson(
  _$RecepBookingDetailResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'guestName': instance.guestName,
  'phoneNumber': instance.phoneNumber,
  'checkInDate': instance.checkInDate,
  'checkOutDate': instance.checkOutDate,
  'status': instance.status,
  'totalPrice': instance.totalPrice,
  'totalAddOnCharges': instance.totalAddOnCharges,
  'manifest': instance.manifest,
  'roomAllocations': instance.roomAllocations,
  'addOnOrders': instance.addOnOrders,
};

_$HotelGuestResponseImpl _$$HotelGuestResponseImplFromJson(
  Map<String, dynamic> json,
) => _$HotelGuestResponseImpl(
  id: json['id'] as String,
  fullName: json['fullName'] as String,
  identityNumber: json['identityNumber'] as String,
  dateOfBirth: json['dateOfBirth'] as String,
  memberType: json['memberType'] as String,
);

Map<String, dynamic> _$$HotelGuestResponseImplToJson(
  _$HotelGuestResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'identityNumber': instance.identityNumber,
  'dateOfBirth': instance.dateOfBirth,
  'memberType': instance.memberType,
};

_$RoomAllocationResponseImpl _$$RoomAllocationResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RoomAllocationResponseImpl(
  roomTypeId: json['roomTypeId'] as String,
  roomTypeName: json['roomTypeName'] as String,
  quantity: (json['quantity'] as num).toInt(),
  assignedRoomNumbers: (json['assignedRoomNumbers'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$RoomAllocationResponseImplToJson(
  _$RoomAllocationResponseImpl instance,
) => <String, dynamic>{
  'roomTypeId': instance.roomTypeId,
  'roomTypeName': instance.roomTypeName,
  'quantity': instance.quantity,
  'assignedRoomNumbers': instance.assignedRoomNumbers,
};
