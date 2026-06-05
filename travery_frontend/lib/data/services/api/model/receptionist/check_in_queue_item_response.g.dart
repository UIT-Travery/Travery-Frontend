// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_queue_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckInQueueItemResponse _$CheckInQueueItemResponseFromJson(
  Map<String, dynamic> json,
) => _CheckInQueueItemResponse(
  bookingId: json['bookingId'] as String? ?? '',
  touristName: json['touristName'] as String? ?? '',
  phoneNumber: json['phoneNumber'] as String? ?? '',
  memberCount: (json['memberCount'] as num?)?.toInt() ?? 0,
  totalRooms: (json['totalRooms'] as num?)?.toInt() ?? 0,
  roomTypeBreakdown:
      (json['roomTypeBreakdown'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ) ??
      const {},
);

Map<String, dynamic> _$CheckInQueueItemResponseToJson(
  _CheckInQueueItemResponse instance,
) => <String, dynamic>{
  'bookingId': instance.bookingId,
  'touristName': instance.touristName,
  'phoneNumber': instance.phoneNumber,
  'memberCount': instance.memberCount,
  'totalRooms': instance.totalRooms,
  'roomTypeBreakdown': instance.roomTypeBreakdown,
};
