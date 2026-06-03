// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guide_tour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GuideTour _$GuideTourFromJson(Map<String, dynamic> json) => _GuideTour(
  id: json['id'] as String?,
  tourInstanceId: json['tour_instance_id'] as String,
  tourId: json['tour_id'] as String,
  tourName: json['tourName'] as String,
  startDate: DateTime.parse(json['start_date'] as String),
  endDate: DateTime.parse(json['end_date'] as String),
  groupSize: (json['group_size'] as num).toInt(),
  groupDescription: json['group_description'] as String,
  status: $enumDecode(_$GuideTourStatusEnumMap, json['status']),
  bookingId: json['booking_id'] as String?,
  customerName: json['customer_name'] as String?,
  customerPhone: json['customer_phone'] as String?,
  vehiclePlate: json['vehicle_plate'] as String?,
  driverName: json['driver_name'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  driverPhone: json['driverPhone'] as String?,
  coachType: json['coachType'] as String?,
  pickupLocation: json['pickupLocation'] as String?,
  passengerCount: (json['passengerCount'] as num?)?.toInt(),
  bookingsCount: (json['bookingsCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$GuideTourToJson(_GuideTour instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tour_instance_id': instance.tourInstanceId,
      'tour_id': instance.tourId,
      'tourName': instance.tourName,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'group_size': instance.groupSize,
      'group_description': instance.groupDescription,
      'status': _$GuideTourStatusEnumMap[instance.status]!,
      'booking_id': instance.bookingId,
      'customer_name': instance.customerName,
      'customer_phone': instance.customerPhone,
      'vehicle_plate': instance.vehiclePlate,
      'driver_name': instance.driverName,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'driverPhone': instance.driverPhone,
      'coachType': instance.coachType,
      'pickupLocation': instance.pickupLocation,
      'passengerCount': instance.passengerCount,
      'bookingsCount': instance.bookingsCount,
    };

const _$GuideTourStatusEnumMap = {
  GuideTourStatus.ongoing: 'ongoing',
  GuideTourStatus.completed: 'completed',
  GuideTourStatus.upcoming: 'upcoming',
};
