// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guide_tour.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GuideTour _$GuideTourFromJson(Map<String, dynamic> json) {
  return _GuideTour.fromJson(json);
}

/// @nodoc
mixin _$GuideTour {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'tour_instance_id')
  String get tourInstanceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tour_id')
  String get tourId => throw _privateConstructorUsedError;
  String get tourName => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  DateTime get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_size')
  int get groupSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_description')
  String get groupDescription => throw _privateConstructorUsedError;
  GuideTourStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_id')
  String? get bookingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String? get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_phone')
  String? get customerPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_plate')
  String? get vehiclePlate => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_name')
  String? get driverName => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError; // Extended fields from API response
  String? get driverPhone => throw _privateConstructorUsedError;
  String? get coachType => throw _privateConstructorUsedError;
  String? get pickupLocation => throw _privateConstructorUsedError;
  int? get passengerCount => throw _privateConstructorUsedError;
  int? get bookingsCount => throw _privateConstructorUsedError;

  /// Serializes this GuideTour to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuideTour
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuideTourCopyWith<GuideTour> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuideTourCopyWith<$Res> {
  factory $GuideTourCopyWith(GuideTour value, $Res Function(GuideTour) then) =
      _$GuideTourCopyWithImpl<$Res, GuideTour>;
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: 'tour_instance_id') String tourInstanceId,
    @JsonKey(name: 'tour_id') String tourId,
    String tourName,
    @JsonKey(name: 'start_date') DateTime startDate,
    @JsonKey(name: 'end_date') DateTime endDate,
    @JsonKey(name: 'group_size') int groupSize,
    @JsonKey(name: 'group_description') String groupDescription,
    GuideTourStatus status,
    @JsonKey(name: 'booking_id') String? bookingId,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'customer_phone') String? customerPhone,
    @JsonKey(name: 'vehicle_plate') String? vehiclePlate,
    @JsonKey(name: 'driver_name') String? driverName,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String? driverPhone,
    String? coachType,
    String? pickupLocation,
    int? passengerCount,
    int? bookingsCount,
  });
}

/// @nodoc
class _$GuideTourCopyWithImpl<$Res, $Val extends GuideTour>
    implements $GuideTourCopyWith<$Res> {
  _$GuideTourCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuideTour
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tourInstanceId = null,
    Object? tourId = null,
    Object? tourName = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? groupSize = null,
    Object? groupDescription = null,
    Object? status = null,
    Object? bookingId = freezed,
    Object? customerName = freezed,
    Object? customerPhone = freezed,
    Object? vehiclePlate = freezed,
    Object? driverName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? driverPhone = freezed,
    Object? coachType = freezed,
    Object? pickupLocation = freezed,
    Object? passengerCount = freezed,
    Object? bookingsCount = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            tourInstanceId: null == tourInstanceId
                ? _value.tourInstanceId
                : tourInstanceId // ignore: cast_nullable_to_non_nullable
                      as String,
            tourId: null == tourId
                ? _value.tourId
                : tourId // ignore: cast_nullable_to_non_nullable
                      as String,
            tourName: null == tourName
                ? _value.tourName
                : tourName // ignore: cast_nullable_to_non_nullable
                      as String,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            groupSize: null == groupSize
                ? _value.groupSize
                : groupSize // ignore: cast_nullable_to_non_nullable
                      as int,
            groupDescription: null == groupDescription
                ? _value.groupDescription
                : groupDescription // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as GuideTourStatus,
            bookingId: freezed == bookingId
                ? _value.bookingId
                : bookingId // ignore: cast_nullable_to_non_nullable
                      as String?,
            customerName: freezed == customerName
                ? _value.customerName
                : customerName // ignore: cast_nullable_to_non_nullable
                      as String?,
            customerPhone: freezed == customerPhone
                ? _value.customerPhone
                : customerPhone // ignore: cast_nullable_to_non_nullable
                      as String?,
            vehiclePlate: freezed == vehiclePlate
                ? _value.vehiclePlate
                : vehiclePlate // ignore: cast_nullable_to_non_nullable
                      as String?,
            driverName: freezed == driverName
                ? _value.driverName
                : driverName // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            driverPhone: freezed == driverPhone
                ? _value.driverPhone
                : driverPhone // ignore: cast_nullable_to_non_nullable
                      as String?,
            coachType: freezed == coachType
                ? _value.coachType
                : coachType // ignore: cast_nullable_to_non_nullable
                      as String?,
            pickupLocation: freezed == pickupLocation
                ? _value.pickupLocation
                : pickupLocation // ignore: cast_nullable_to_non_nullable
                      as String?,
            passengerCount: freezed == passengerCount
                ? _value.passengerCount
                : passengerCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            bookingsCount: freezed == bookingsCount
                ? _value.bookingsCount
                : bookingsCount // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GuideTourImplCopyWith<$Res>
    implements $GuideTourCopyWith<$Res> {
  factory _$$GuideTourImplCopyWith(
    _$GuideTourImpl value,
    $Res Function(_$GuideTourImpl) then,
  ) = __$$GuideTourImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    @JsonKey(name: 'tour_instance_id') String tourInstanceId,
    @JsonKey(name: 'tour_id') String tourId,
    String tourName,
    @JsonKey(name: 'start_date') DateTime startDate,
    @JsonKey(name: 'end_date') DateTime endDate,
    @JsonKey(name: 'group_size') int groupSize,
    @JsonKey(name: 'group_description') String groupDescription,
    GuideTourStatus status,
    @JsonKey(name: 'booking_id') String? bookingId,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'customer_phone') String? customerPhone,
    @JsonKey(name: 'vehicle_plate') String? vehiclePlate,
    @JsonKey(name: 'driver_name') String? driverName,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String? driverPhone,
    String? coachType,
    String? pickupLocation,
    int? passengerCount,
    int? bookingsCount,
  });
}

/// @nodoc
class __$$GuideTourImplCopyWithImpl<$Res>
    extends _$GuideTourCopyWithImpl<$Res, _$GuideTourImpl>
    implements _$$GuideTourImplCopyWith<$Res> {
  __$$GuideTourImplCopyWithImpl(
    _$GuideTourImpl _value,
    $Res Function(_$GuideTourImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GuideTour
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tourInstanceId = null,
    Object? tourId = null,
    Object? tourName = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? groupSize = null,
    Object? groupDescription = null,
    Object? status = null,
    Object? bookingId = freezed,
    Object? customerName = freezed,
    Object? customerPhone = freezed,
    Object? vehiclePlate = freezed,
    Object? driverName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? driverPhone = freezed,
    Object? coachType = freezed,
    Object? pickupLocation = freezed,
    Object? passengerCount = freezed,
    Object? bookingsCount = freezed,
  }) {
    return _then(
      _$GuideTourImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        tourInstanceId: null == tourInstanceId
            ? _value.tourInstanceId
            : tourInstanceId // ignore: cast_nullable_to_non_nullable
                  as String,
        tourId: null == tourId
            ? _value.tourId
            : tourId // ignore: cast_nullable_to_non_nullable
                  as String,
        tourName: null == tourName
            ? _value.tourName
            : tourName // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        groupSize: null == groupSize
            ? _value.groupSize
            : groupSize // ignore: cast_nullable_to_non_nullable
                  as int,
        groupDescription: null == groupDescription
            ? _value.groupDescription
            : groupDescription // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as GuideTourStatus,
        bookingId: freezed == bookingId
            ? _value.bookingId
            : bookingId // ignore: cast_nullable_to_non_nullable
                  as String?,
        customerName: freezed == customerName
            ? _value.customerName
            : customerName // ignore: cast_nullable_to_non_nullable
                  as String?,
        customerPhone: freezed == customerPhone
            ? _value.customerPhone
            : customerPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
        vehiclePlate: freezed == vehiclePlate
            ? _value.vehiclePlate
            : vehiclePlate // ignore: cast_nullable_to_non_nullable
                  as String?,
        driverName: freezed == driverName
            ? _value.driverName
            : driverName // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        driverPhone: freezed == driverPhone
            ? _value.driverPhone
            : driverPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
        coachType: freezed == coachType
            ? _value.coachType
            : coachType // ignore: cast_nullable_to_non_nullable
                  as String?,
        pickupLocation: freezed == pickupLocation
            ? _value.pickupLocation
            : pickupLocation // ignore: cast_nullable_to_non_nullable
                  as String?,
        passengerCount: freezed == passengerCount
            ? _value.passengerCount
            : passengerCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        bookingsCount: freezed == bookingsCount
            ? _value.bookingsCount
            : bookingsCount // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GuideTourImpl implements _GuideTour {
  const _$GuideTourImpl({
    this.id,
    @JsonKey(name: 'tour_instance_id') required this.tourInstanceId,
    @JsonKey(name: 'tour_id') required this.tourId,
    required this.tourName,
    @JsonKey(name: 'start_date') required this.startDate,
    @JsonKey(name: 'end_date') required this.endDate,
    @JsonKey(name: 'group_size') required this.groupSize,
    @JsonKey(name: 'group_description') required this.groupDescription,
    required this.status,
    @JsonKey(name: 'booking_id') this.bookingId,
    @JsonKey(name: 'customer_name') this.customerName,
    @JsonKey(name: 'customer_phone') this.customerPhone,
    @JsonKey(name: 'vehicle_plate') this.vehiclePlate,
    @JsonKey(name: 'driver_name') this.driverName,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'updated_at') this.updatedAt,
    this.driverPhone,
    this.coachType,
    this.pickupLocation,
    this.passengerCount,
    this.bookingsCount,
  });

  factory _$GuideTourImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuideTourImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'tour_instance_id')
  final String tourInstanceId;
  @override
  @JsonKey(name: 'tour_id')
  final String tourId;
  @override
  final String tourName;
  @override
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @override
  @JsonKey(name: 'end_date')
  final DateTime endDate;
  @override
  @JsonKey(name: 'group_size')
  final int groupSize;
  @override
  @JsonKey(name: 'group_description')
  final String groupDescription;
  @override
  final GuideTourStatus status;
  @override
  @JsonKey(name: 'booking_id')
  final String? bookingId;
  @override
  @JsonKey(name: 'customer_name')
  final String? customerName;
  @override
  @JsonKey(name: 'customer_phone')
  final String? customerPhone;
  @override
  @JsonKey(name: 'vehicle_plate')
  final String? vehiclePlate;
  @override
  @JsonKey(name: 'driver_name')
  final String? driverName;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  // Extended fields from API response
  @override
  final String? driverPhone;
  @override
  final String? coachType;
  @override
  final String? pickupLocation;
  @override
  final int? passengerCount;
  @override
  final int? bookingsCount;

  @override
  String toString() {
    return 'GuideTour(id: $id, tourInstanceId: $tourInstanceId, tourId: $tourId, tourName: $tourName, startDate: $startDate, endDate: $endDate, groupSize: $groupSize, groupDescription: $groupDescription, status: $status, bookingId: $bookingId, customerName: $customerName, customerPhone: $customerPhone, vehiclePlate: $vehiclePlate, driverName: $driverName, createdAt: $createdAt, updatedAt: $updatedAt, driverPhone: $driverPhone, coachType: $coachType, pickupLocation: $pickupLocation, passengerCount: $passengerCount, bookingsCount: $bookingsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuideTourImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tourInstanceId, tourInstanceId) ||
                other.tourInstanceId == tourInstanceId) &&
            (identical(other.tourId, tourId) || other.tourId == tourId) &&
            (identical(other.tourName, tourName) ||
                other.tourName == tourName) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.groupSize, groupSize) ||
                other.groupSize == groupSize) &&
            (identical(other.groupDescription, groupDescription) ||
                other.groupDescription == groupDescription) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.vehiclePlate, vehiclePlate) ||
                other.vehiclePlate == vehiclePlate) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.driverPhone, driverPhone) ||
                other.driverPhone == driverPhone) &&
            (identical(other.coachType, coachType) ||
                other.coachType == coachType) &&
            (identical(other.pickupLocation, pickupLocation) ||
                other.pickupLocation == pickupLocation) &&
            (identical(other.passengerCount, passengerCount) ||
                other.passengerCount == passengerCount) &&
            (identical(other.bookingsCount, bookingsCount) ||
                other.bookingsCount == bookingsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    tourInstanceId,
    tourId,
    tourName,
    startDate,
    endDate,
    groupSize,
    groupDescription,
    status,
    bookingId,
    customerName,
    customerPhone,
    vehiclePlate,
    driverName,
    createdAt,
    updatedAt,
    driverPhone,
    coachType,
    pickupLocation,
    passengerCount,
    bookingsCount,
  ]);

  /// Create a copy of GuideTour
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuideTourImplCopyWith<_$GuideTourImpl> get copyWith =>
      __$$GuideTourImplCopyWithImpl<_$GuideTourImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuideTourImplToJson(this);
  }
}

abstract class _GuideTour implements GuideTour {
  const factory _GuideTour({
    final String? id,
    @JsonKey(name: 'tour_instance_id') required final String tourInstanceId,
    @JsonKey(name: 'tour_id') required final String tourId,
    required final String tourName,
    @JsonKey(name: 'start_date') required final DateTime startDate,
    @JsonKey(name: 'end_date') required final DateTime endDate,
    @JsonKey(name: 'group_size') required final int groupSize,
    @JsonKey(name: 'group_description') required final String groupDescription,
    required final GuideTourStatus status,
    @JsonKey(name: 'booking_id') final String? bookingId,
    @JsonKey(name: 'customer_name') final String? customerName,
    @JsonKey(name: 'customer_phone') final String? customerPhone,
    @JsonKey(name: 'vehicle_plate') final String? vehiclePlate,
    @JsonKey(name: 'driver_name') final String? driverName,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
    final String? driverPhone,
    final String? coachType,
    final String? pickupLocation,
    final int? passengerCount,
    final int? bookingsCount,
  }) = _$GuideTourImpl;

  factory _GuideTour.fromJson(Map<String, dynamic> json) =
      _$GuideTourImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'tour_instance_id')
  String get tourInstanceId;
  @override
  @JsonKey(name: 'tour_id')
  String get tourId;
  @override
  String get tourName;
  @override
  @JsonKey(name: 'start_date')
  DateTime get startDate;
  @override
  @JsonKey(name: 'end_date')
  DateTime get endDate;
  @override
  @JsonKey(name: 'group_size')
  int get groupSize;
  @override
  @JsonKey(name: 'group_description')
  String get groupDescription;
  @override
  GuideTourStatus get status;
  @override
  @JsonKey(name: 'booking_id')
  String? get bookingId;
  @override
  @JsonKey(name: 'customer_name')
  String? get customerName;
  @override
  @JsonKey(name: 'customer_phone')
  String? get customerPhone;
  @override
  @JsonKey(name: 'vehicle_plate')
  String? get vehiclePlate;
  @override
  @JsonKey(name: 'driver_name')
  String? get driverName;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt; // Extended fields from API response
  @override
  String? get driverPhone;
  @override
  String? get coachType;
  @override
  String? get pickupLocation;
  @override
  int? get passengerCount;
  @override
  int? get bookingsCount;

  /// Create a copy of GuideTour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuideTourImplCopyWith<_$GuideTourImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
