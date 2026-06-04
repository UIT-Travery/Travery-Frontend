// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recep_dashboard_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RecepDashboardResponse _$RecepDashboardResponseFromJson(
  Map<String, dynamic> json,
) {
  return _RecepDashboardResponse.fromJson(json);
}

/// @nodoc
mixin _$RecepDashboardResponse {
  int get availableRooms => throw _privateConstructorUsedError;
  int get occupiedRooms => throw _privateConstructorUsedError;
  int get cleaningRooms => throw _privateConstructorUsedError;
  int get maintenanceRooms => throw _privateConstructorUsedError;
  int get todayCheckInCount => throw _privateConstructorUsedError;
  int get todayCheckOutCount => throw _privateConstructorUsedError;
  List<CheckInQueueItemResponse> get checkInQueue =>
      throw _privateConstructorUsedError;
  List<CheckInQueueItemResponse> get checkOutQueue =>
      throw _privateConstructorUsedError;

  /// Serializes this RecepDashboardResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecepDashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecepDashboardResponseCopyWith<RecepDashboardResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecepDashboardResponseCopyWith<$Res> {
  factory $RecepDashboardResponseCopyWith(
    RecepDashboardResponse value,
    $Res Function(RecepDashboardResponse) then,
  ) = _$RecepDashboardResponseCopyWithImpl<$Res, RecepDashboardResponse>;
  @useResult
  $Res call({
    int availableRooms,
    int occupiedRooms,
    int cleaningRooms,
    int maintenanceRooms,
    int todayCheckInCount,
    int todayCheckOutCount,
    List<CheckInQueueItemResponse> checkInQueue,
    List<CheckInQueueItemResponse> checkOutQueue,
  });
}

/// @nodoc
class _$RecepDashboardResponseCopyWithImpl<
  $Res,
  $Val extends RecepDashboardResponse
>
    implements $RecepDashboardResponseCopyWith<$Res> {
  _$RecepDashboardResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecepDashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableRooms = null,
    Object? occupiedRooms = null,
    Object? cleaningRooms = null,
    Object? maintenanceRooms = null,
    Object? todayCheckInCount = null,
    Object? todayCheckOutCount = null,
    Object? checkInQueue = null,
    Object? checkOutQueue = null,
  }) {
    return _then(
      _value.copyWith(
            availableRooms: null == availableRooms
                ? _value.availableRooms
                : availableRooms // ignore: cast_nullable_to_non_nullable
                      as int,
            occupiedRooms: null == occupiedRooms
                ? _value.occupiedRooms
                : occupiedRooms // ignore: cast_nullable_to_non_nullable
                      as int,
            cleaningRooms: null == cleaningRooms
                ? _value.cleaningRooms
                : cleaningRooms // ignore: cast_nullable_to_non_nullable
                      as int,
            maintenanceRooms: null == maintenanceRooms
                ? _value.maintenanceRooms
                : maintenanceRooms // ignore: cast_nullable_to_non_nullable
                      as int,
            todayCheckInCount: null == todayCheckInCount
                ? _value.todayCheckInCount
                : todayCheckInCount // ignore: cast_nullable_to_non_nullable
                      as int,
            todayCheckOutCount: null == todayCheckOutCount
                ? _value.todayCheckOutCount
                : todayCheckOutCount // ignore: cast_nullable_to_non_nullable
                      as int,
            checkInQueue: null == checkInQueue
                ? _value.checkInQueue
                : checkInQueue // ignore: cast_nullable_to_non_nullable
                      as List<CheckInQueueItemResponse>,
            checkOutQueue: null == checkOutQueue
                ? _value.checkOutQueue
                : checkOutQueue // ignore: cast_nullable_to_non_nullable
                      as List<CheckInQueueItemResponse>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecepDashboardResponseImplCopyWith<$Res>
    implements $RecepDashboardResponseCopyWith<$Res> {
  factory _$$RecepDashboardResponseImplCopyWith(
    _$RecepDashboardResponseImpl value,
    $Res Function(_$RecepDashboardResponseImpl) then,
  ) = __$$RecepDashboardResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int availableRooms,
    int occupiedRooms,
    int cleaningRooms,
    int maintenanceRooms,
    int todayCheckInCount,
    int todayCheckOutCount,
    List<CheckInQueueItemResponse> checkInQueue,
    List<CheckInQueueItemResponse> checkOutQueue,
  });
}

/// @nodoc
class __$$RecepDashboardResponseImplCopyWithImpl<$Res>
    extends
        _$RecepDashboardResponseCopyWithImpl<$Res, _$RecepDashboardResponseImpl>
    implements _$$RecepDashboardResponseImplCopyWith<$Res> {
  __$$RecepDashboardResponseImplCopyWithImpl(
    _$RecepDashboardResponseImpl _value,
    $Res Function(_$RecepDashboardResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecepDashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableRooms = null,
    Object? occupiedRooms = null,
    Object? cleaningRooms = null,
    Object? maintenanceRooms = null,
    Object? todayCheckInCount = null,
    Object? todayCheckOutCount = null,
    Object? checkInQueue = null,
    Object? checkOutQueue = null,
  }) {
    return _then(
      _$RecepDashboardResponseImpl(
        availableRooms: null == availableRooms
            ? _value.availableRooms
            : availableRooms // ignore: cast_nullable_to_non_nullable
                  as int,
        occupiedRooms: null == occupiedRooms
            ? _value.occupiedRooms
            : occupiedRooms // ignore: cast_nullable_to_non_nullable
                  as int,
        cleaningRooms: null == cleaningRooms
            ? _value.cleaningRooms
            : cleaningRooms // ignore: cast_nullable_to_non_nullable
                  as int,
        maintenanceRooms: null == maintenanceRooms
            ? _value.maintenanceRooms
            : maintenanceRooms // ignore: cast_nullable_to_non_nullable
                  as int,
        todayCheckInCount: null == todayCheckInCount
            ? _value.todayCheckInCount
            : todayCheckInCount // ignore: cast_nullable_to_non_nullable
                  as int,
        todayCheckOutCount: null == todayCheckOutCount
            ? _value.todayCheckOutCount
            : todayCheckOutCount // ignore: cast_nullable_to_non_nullable
                  as int,
        checkInQueue: null == checkInQueue
            ? _value._checkInQueue
            : checkInQueue // ignore: cast_nullable_to_non_nullable
                  as List<CheckInQueueItemResponse>,
        checkOutQueue: null == checkOutQueue
            ? _value._checkOutQueue
            : checkOutQueue // ignore: cast_nullable_to_non_nullable
                  as List<CheckInQueueItemResponse>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecepDashboardResponseImpl implements _RecepDashboardResponse {
  _$RecepDashboardResponseImpl({
    this.availableRooms = 0,
    this.occupiedRooms = 0,
    this.cleaningRooms = 0,
    this.maintenanceRooms = 0,
    this.todayCheckInCount = 0,
    this.todayCheckOutCount = 0,
    final List<CheckInQueueItemResponse> checkInQueue = const [],
    final List<CheckInQueueItemResponse> checkOutQueue = const [],
  }) : _checkInQueue = checkInQueue,
       _checkOutQueue = checkOutQueue;

  factory _$RecepDashboardResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecepDashboardResponseImplFromJson(json);

  @override
  @JsonKey()
  final int availableRooms;
  @override
  @JsonKey()
  final int occupiedRooms;
  @override
  @JsonKey()
  final int cleaningRooms;
  @override
  @JsonKey()
  final int maintenanceRooms;
  @override
  @JsonKey()
  final int todayCheckInCount;
  @override
  @JsonKey()
  final int todayCheckOutCount;
  final List<CheckInQueueItemResponse> _checkInQueue;
  @override
  @JsonKey()
  List<CheckInQueueItemResponse> get checkInQueue {
    if (_checkInQueue is EqualUnmodifiableListView) return _checkInQueue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_checkInQueue);
  }

  final List<CheckInQueueItemResponse> _checkOutQueue;
  @override
  @JsonKey()
  List<CheckInQueueItemResponse> get checkOutQueue {
    if (_checkOutQueue is EqualUnmodifiableListView) return _checkOutQueue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_checkOutQueue);
  }

  @override
  String toString() {
    return 'RecepDashboardResponse(availableRooms: $availableRooms, occupiedRooms: $occupiedRooms, cleaningRooms: $cleaningRooms, maintenanceRooms: $maintenanceRooms, todayCheckInCount: $todayCheckInCount, todayCheckOutCount: $todayCheckOutCount, checkInQueue: $checkInQueue, checkOutQueue: $checkOutQueue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecepDashboardResponseImpl &&
            (identical(other.availableRooms, availableRooms) ||
                other.availableRooms == availableRooms) &&
            (identical(other.occupiedRooms, occupiedRooms) ||
                other.occupiedRooms == occupiedRooms) &&
            (identical(other.cleaningRooms, cleaningRooms) ||
                other.cleaningRooms == cleaningRooms) &&
            (identical(other.maintenanceRooms, maintenanceRooms) ||
                other.maintenanceRooms == maintenanceRooms) &&
            (identical(other.todayCheckInCount, todayCheckInCount) ||
                other.todayCheckInCount == todayCheckInCount) &&
            (identical(other.todayCheckOutCount, todayCheckOutCount) ||
                other.todayCheckOutCount == todayCheckOutCount) &&
            const DeepCollectionEquality().equals(
              other._checkInQueue,
              _checkInQueue,
            ) &&
            const DeepCollectionEquality().equals(
              other._checkOutQueue,
              _checkOutQueue,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    availableRooms,
    occupiedRooms,
    cleaningRooms,
    maintenanceRooms,
    todayCheckInCount,
    todayCheckOutCount,
    const DeepCollectionEquality().hash(_checkInQueue),
    const DeepCollectionEquality().hash(_checkOutQueue),
  );

  /// Create a copy of RecepDashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecepDashboardResponseImplCopyWith<_$RecepDashboardResponseImpl>
  get copyWith =>
      __$$RecepDashboardResponseImplCopyWithImpl<_$RecepDashboardResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecepDashboardResponseImplToJson(this);
  }
}

abstract class _RecepDashboardResponse implements RecepDashboardResponse {
  factory _RecepDashboardResponse({
    final int availableRooms,
    final int occupiedRooms,
    final int cleaningRooms,
    final int maintenanceRooms,
    final int todayCheckInCount,
    final int todayCheckOutCount,
    final List<CheckInQueueItemResponse> checkInQueue,
    final List<CheckInQueueItemResponse> checkOutQueue,
  }) = _$RecepDashboardResponseImpl;

  factory _RecepDashboardResponse.fromJson(Map<String, dynamic> json) =
      _$RecepDashboardResponseImpl.fromJson;

  @override
  int get availableRooms;
  @override
  int get occupiedRooms;
  @override
  int get cleaningRooms;
  @override
  int get maintenanceRooms;
  @override
  int get todayCheckInCount;
  @override
  int get todayCheckOutCount;
  @override
  List<CheckInQueueItemResponse> get checkInQueue;
  @override
  List<CheckInQueueItemResponse> get checkOutQueue;

  /// Create a copy of RecepDashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecepDashboardResponseImplCopyWith<_$RecepDashboardResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
