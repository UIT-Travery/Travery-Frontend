// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recep_dashboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecepDashboardResponse _$RecepDashboardResponseFromJson(
  Map<String, dynamic> json,
) => _RecepDashboardResponse(
  availableRooms: (json['availableRooms'] as num?)?.toInt() ?? 0,
  occupiedRooms: (json['occupiedRooms'] as num?)?.toInt() ?? 0,
  cleaningRooms: (json['cleaningRooms'] as num?)?.toInt() ?? 0,
  maintenanceRooms: (json['maintenanceRooms'] as num?)?.toInt() ?? 0,
  todayCheckInCount: (json['todayCheckInCount'] as num?)?.toInt() ?? 0,
  todayCheckOutCount: (json['todayCheckOutCount'] as num?)?.toInt() ?? 0,
  checkInQueue:
      (json['checkInQueue'] as List<dynamic>?)
          ?.map(
            (e) => CheckInQueueItemResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  checkOutQueue:
      (json['checkOutQueue'] as List<dynamic>?)
          ?.map(
            (e) => CheckInQueueItemResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$RecepDashboardResponseToJson(
  _RecepDashboardResponse instance,
) => <String, dynamic>{
  'availableRooms': instance.availableRooms,
  'occupiedRooms': instance.occupiedRooms,
  'cleaningRooms': instance.cleaningRooms,
  'maintenanceRooms': instance.maintenanceRooms,
  'todayCheckInCount': instance.todayCheckInCount,
  'todayCheckOutCount': instance.todayCheckOutCount,
  'checkInQueue': instance.checkInQueue,
  'checkOutQueue': instance.checkOutQueue,
};
