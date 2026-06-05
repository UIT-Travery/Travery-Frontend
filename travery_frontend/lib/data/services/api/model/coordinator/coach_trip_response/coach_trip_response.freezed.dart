// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coach_trip_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CoachTripResponse _$CoachTripResponseFromJson(Map<String, dynamic> json) {
  return _CoachTripResponse.fromJson(json);
}

/// @nodoc
mixin _$CoachTripResponse {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'departureTime')
  DateTime? get departureTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'arrivalTime')
  DateTime? get arrivalTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'coachType')
  String? get coachType => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalSeats')
  int? get totalSeats => throw _privateConstructorUsedError;
  @JsonKey(name: 'availableSeats')
  int? get availableSeats => throw _privateConstructorUsedError;
  @JsonKey(name: 'basePrice')
  double? get basePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'originDestination')
  DestinationResponse? get originDestination =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'destinationDestination')
  DestinationResponse? get destinationDestination =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this CoachTripResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoachTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoachTripResponseCopyWith<CoachTripResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoachTripResponseCopyWith<$Res> {
  factory $CoachTripResponseCopyWith(
    CoachTripResponse value,
    $Res Function(CoachTripResponse) then,
  ) = _$CoachTripResponseCopyWithImpl<$Res, CoachTripResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'departureTime') DateTime? departureTime,
    @JsonKey(name: 'arrivalTime') DateTime? arrivalTime,
    @JsonKey(name: 'coachType') String? coachType,
    @JsonKey(name: 'totalSeats') int? totalSeats,
    @JsonKey(name: 'availableSeats') int? availableSeats,
    @JsonKey(name: 'basePrice') double? basePrice,
    @JsonKey(name: 'originDestination') DestinationResponse? originDestination,
    @JsonKey(name: 'destinationDestination')
    DestinationResponse? destinationDestination,
    @JsonKey(name: 'status') String? status,
  });

  $DestinationResponseCopyWith<$Res>? get originDestination;
  $DestinationResponseCopyWith<$Res>? get destinationDestination;
}

/// @nodoc
class _$CoachTripResponseCopyWithImpl<$Res, $Val extends CoachTripResponse>
    implements $CoachTripResponseCopyWith<$Res> {
  _$CoachTripResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoachTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? departureTime = freezed,
    Object? arrivalTime = freezed,
    Object? coachType = freezed,
    Object? totalSeats = freezed,
    Object? availableSeats = freezed,
    Object? basePrice = freezed,
    Object? originDestination = freezed,
    Object? destinationDestination = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            departureTime: freezed == departureTime
                ? _value.departureTime
                : departureTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            arrivalTime: freezed == arrivalTime
                ? _value.arrivalTime
                : arrivalTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            coachType: freezed == coachType
                ? _value.coachType
                : coachType // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalSeats: freezed == totalSeats
                ? _value.totalSeats
                : totalSeats // ignore: cast_nullable_to_non_nullable
                      as int?,
            availableSeats: freezed == availableSeats
                ? _value.availableSeats
                : availableSeats // ignore: cast_nullable_to_non_nullable
                      as int?,
            basePrice: freezed == basePrice
                ? _value.basePrice
                : basePrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            originDestination: freezed == originDestination
                ? _value.originDestination
                : originDestination // ignore: cast_nullable_to_non_nullable
                      as DestinationResponse?,
            destinationDestination: freezed == destinationDestination
                ? _value.destinationDestination
                : destinationDestination // ignore: cast_nullable_to_non_nullable
                      as DestinationResponse?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of CoachTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DestinationResponseCopyWith<$Res>? get originDestination {
    if (_value.originDestination == null) {
      return null;
    }

    return $DestinationResponseCopyWith<$Res>(_value.originDestination!, (
      value,
    ) {
      return _then(_value.copyWith(originDestination: value) as $Val);
    });
  }

  /// Create a copy of CoachTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DestinationResponseCopyWith<$Res>? get destinationDestination {
    if (_value.destinationDestination == null) {
      return null;
    }

    return $DestinationResponseCopyWith<$Res>(_value.destinationDestination!, (
      value,
    ) {
      return _then(_value.copyWith(destinationDestination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CoachTripResponseImplCopyWith<$Res>
    implements $CoachTripResponseCopyWith<$Res> {
  factory _$$CoachTripResponseImplCopyWith(
    _$CoachTripResponseImpl value,
    $Res Function(_$CoachTripResponseImpl) then,
  ) = __$$CoachTripResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'departureTime') DateTime? departureTime,
    @JsonKey(name: 'arrivalTime') DateTime? arrivalTime,
    @JsonKey(name: 'coachType') String? coachType,
    @JsonKey(name: 'totalSeats') int? totalSeats,
    @JsonKey(name: 'availableSeats') int? availableSeats,
    @JsonKey(name: 'basePrice') double? basePrice,
    @JsonKey(name: 'originDestination') DestinationResponse? originDestination,
    @JsonKey(name: 'destinationDestination')
    DestinationResponse? destinationDestination,
    @JsonKey(name: 'status') String? status,
  });

  @override
  $DestinationResponseCopyWith<$Res>? get originDestination;
  @override
  $DestinationResponseCopyWith<$Res>? get destinationDestination;
}

/// @nodoc
class __$$CoachTripResponseImplCopyWithImpl<$Res>
    extends _$CoachTripResponseCopyWithImpl<$Res, _$CoachTripResponseImpl>
    implements _$$CoachTripResponseImplCopyWith<$Res> {
  __$$CoachTripResponseImplCopyWithImpl(
    _$CoachTripResponseImpl _value,
    $Res Function(_$CoachTripResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CoachTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? departureTime = freezed,
    Object? arrivalTime = freezed,
    Object? coachType = freezed,
    Object? totalSeats = freezed,
    Object? availableSeats = freezed,
    Object? basePrice = freezed,
    Object? originDestination = freezed,
    Object? destinationDestination = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _$CoachTripResponseImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        departureTime: freezed == departureTime
            ? _value.departureTime
            : departureTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        arrivalTime: freezed == arrivalTime
            ? _value.arrivalTime
            : arrivalTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        coachType: freezed == coachType
            ? _value.coachType
            : coachType // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalSeats: freezed == totalSeats
            ? _value.totalSeats
            : totalSeats // ignore: cast_nullable_to_non_nullable
                  as int?,
        availableSeats: freezed == availableSeats
            ? _value.availableSeats
            : availableSeats // ignore: cast_nullable_to_non_nullable
                  as int?,
        basePrice: freezed == basePrice
            ? _value.basePrice
            : basePrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        originDestination: freezed == originDestination
            ? _value.originDestination
            : originDestination // ignore: cast_nullable_to_non_nullable
                  as DestinationResponse?,
        destinationDestination: freezed == destinationDestination
            ? _value.destinationDestination
            : destinationDestination // ignore: cast_nullable_to_non_nullable
                  as DestinationResponse?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CoachTripResponseImpl implements _CoachTripResponse {
  const _$CoachTripResponseImpl({
    @JsonKey(name: 'id') this.id,
    @JsonKey(name: 'departureTime') this.departureTime,
    @JsonKey(name: 'arrivalTime') this.arrivalTime,
    @JsonKey(name: 'coachType') this.coachType,
    @JsonKey(name: 'totalSeats') this.totalSeats,
    @JsonKey(name: 'availableSeats') this.availableSeats,
    @JsonKey(name: 'basePrice') this.basePrice,
    @JsonKey(name: 'originDestination') this.originDestination,
    @JsonKey(name: 'destinationDestination') this.destinationDestination,
    @JsonKey(name: 'status') this.status,
  });

  factory _$CoachTripResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoachTripResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'departureTime')
  final DateTime? departureTime;
  @override
  @JsonKey(name: 'arrivalTime')
  final DateTime? arrivalTime;
  @override
  @JsonKey(name: 'coachType')
  final String? coachType;
  @override
  @JsonKey(name: 'totalSeats')
  final int? totalSeats;
  @override
  @JsonKey(name: 'availableSeats')
  final int? availableSeats;
  @override
  @JsonKey(name: 'basePrice')
  final double? basePrice;
  @override
  @JsonKey(name: 'originDestination')
  final DestinationResponse? originDestination;
  @override
  @JsonKey(name: 'destinationDestination')
  final DestinationResponse? destinationDestination;
  @override
  @JsonKey(name: 'status')
  final String? status;

  @override
  String toString() {
    return 'CoachTripResponse(id: $id, departureTime: $departureTime, arrivalTime: $arrivalTime, coachType: $coachType, totalSeats: $totalSeats, availableSeats: $availableSeats, basePrice: $basePrice, originDestination: $originDestination, destinationDestination: $destinationDestination, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoachTripResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.departureTime, departureTime) ||
                other.departureTime == departureTime) &&
            (identical(other.arrivalTime, arrivalTime) ||
                other.arrivalTime == arrivalTime) &&
            (identical(other.coachType, coachType) ||
                other.coachType == coachType) &&
            (identical(other.totalSeats, totalSeats) ||
                other.totalSeats == totalSeats) &&
            (identical(other.availableSeats, availableSeats) ||
                other.availableSeats == availableSeats) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.originDestination, originDestination) ||
                other.originDestination == originDestination) &&
            (identical(other.destinationDestination, destinationDestination) ||
                other.destinationDestination == destinationDestination) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    departureTime,
    arrivalTime,
    coachType,
    totalSeats,
    availableSeats,
    basePrice,
    originDestination,
    destinationDestination,
    status,
  );

  /// Create a copy of CoachTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoachTripResponseImplCopyWith<_$CoachTripResponseImpl> get copyWith =>
      __$$CoachTripResponseImplCopyWithImpl<_$CoachTripResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CoachTripResponseImplToJson(this);
  }
}

abstract class _CoachTripResponse implements CoachTripResponse {
  const factory _CoachTripResponse({
    @JsonKey(name: 'id') final String? id,
    @JsonKey(name: 'departureTime') final DateTime? departureTime,
    @JsonKey(name: 'arrivalTime') final DateTime? arrivalTime,
    @JsonKey(name: 'coachType') final String? coachType,
    @JsonKey(name: 'totalSeats') final int? totalSeats,
    @JsonKey(name: 'availableSeats') final int? availableSeats,
    @JsonKey(name: 'basePrice') final double? basePrice,
    @JsonKey(name: 'originDestination')
    final DestinationResponse? originDestination,
    @JsonKey(name: 'destinationDestination')
    final DestinationResponse? destinationDestination,
    @JsonKey(name: 'status') final String? status,
  }) = _$CoachTripResponseImpl;

  factory _CoachTripResponse.fromJson(Map<String, dynamic> json) =
      _$CoachTripResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'departureTime')
  DateTime? get departureTime;
  @override
  @JsonKey(name: 'arrivalTime')
  DateTime? get arrivalTime;
  @override
  @JsonKey(name: 'coachType')
  String? get coachType;
  @override
  @JsonKey(name: 'totalSeats')
  int? get totalSeats;
  @override
  @JsonKey(name: 'availableSeats')
  int? get availableSeats;
  @override
  @JsonKey(name: 'basePrice')
  double? get basePrice;
  @override
  @JsonKey(name: 'originDestination')
  DestinationResponse? get originDestination;
  @override
  @JsonKey(name: 'destinationDestination')
  DestinationResponse? get destinationDestination;
  @override
  @JsonKey(name: 'status')
  String? get status;

  /// Create a copy of CoachTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoachTripResponseImplCopyWith<_$CoachTripResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
