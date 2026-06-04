// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_room_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AvailableRoomResponse _$AvailableRoomResponseFromJson(
  Map<String, dynamic> json,
) {
  return _AvailableRoomResponse.fromJson(json);
}

/// @nodoc
mixin _$AvailableRoomResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get roomNumber => throw _privateConstructorUsedError;
  String? get roomTypeName => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get floor => throw _privateConstructorUsedError;

  /// Serializes this AvailableRoomResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AvailableRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvailableRoomResponseCopyWith<AvailableRoomResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableRoomResponseCopyWith<$Res> {
  factory $AvailableRoomResponseCopyWith(
    AvailableRoomResponse value,
    $Res Function(AvailableRoomResponse) then,
  ) = _$AvailableRoomResponseCopyWithImpl<$Res, AvailableRoomResponse>;
  @useResult
  $Res call({
    String? id,
    String? roomNumber,
    String? roomTypeName,
    String? status,
    int? floor,
  });
}

/// @nodoc
class _$AvailableRoomResponseCopyWithImpl<
  $Res,
  $Val extends AvailableRoomResponse
>
    implements $AvailableRoomResponseCopyWith<$Res> {
  _$AvailableRoomResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AvailableRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? roomNumber = freezed,
    Object? roomTypeName = freezed,
    Object? status = freezed,
    Object? floor = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            roomNumber: freezed == roomNumber
                ? _value.roomNumber
                : roomNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            roomTypeName: freezed == roomTypeName
                ? _value.roomTypeName
                : roomTypeName // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            floor: freezed == floor
                ? _value.floor
                : floor // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AvailableRoomResponseImplCopyWith<$Res>
    implements $AvailableRoomResponseCopyWith<$Res> {
  factory _$$AvailableRoomResponseImplCopyWith(
    _$AvailableRoomResponseImpl value,
    $Res Function(_$AvailableRoomResponseImpl) then,
  ) = __$$AvailableRoomResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? roomNumber,
    String? roomTypeName,
    String? status,
    int? floor,
  });
}

/// @nodoc
class __$$AvailableRoomResponseImplCopyWithImpl<$Res>
    extends
        _$AvailableRoomResponseCopyWithImpl<$Res, _$AvailableRoomResponseImpl>
    implements _$$AvailableRoomResponseImplCopyWith<$Res> {
  __$$AvailableRoomResponseImplCopyWithImpl(
    _$AvailableRoomResponseImpl _value,
    $Res Function(_$AvailableRoomResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AvailableRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? roomNumber = freezed,
    Object? roomTypeName = freezed,
    Object? status = freezed,
    Object? floor = freezed,
  }) {
    return _then(
      _$AvailableRoomResponseImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        roomNumber: freezed == roomNumber
            ? _value.roomNumber
            : roomNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        roomTypeName: freezed == roomTypeName
            ? _value.roomTypeName
            : roomTypeName // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        floor: freezed == floor
            ? _value.floor
            : floor // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailableRoomResponseImpl implements _AvailableRoomResponse {
  _$AvailableRoomResponseImpl({
    this.id,
    this.roomNumber,
    this.roomTypeName,
    this.status,
    this.floor,
  });

  factory _$AvailableRoomResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailableRoomResponseImplFromJson(json);

  @override
  final String? id;
  @override
  final String? roomNumber;
  @override
  final String? roomTypeName;
  @override
  final String? status;
  @override
  final int? floor;

  @override
  String toString() {
    return 'AvailableRoomResponse(id: $id, roomNumber: $roomNumber, roomTypeName: $roomTypeName, status: $status, floor: $floor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableRoomResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roomNumber, roomNumber) ||
                other.roomNumber == roomNumber) &&
            (identical(other.roomTypeName, roomTypeName) ||
                other.roomTypeName == roomTypeName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.floor, floor) || other.floor == floor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, roomNumber, roomTypeName, status, floor);

  /// Create a copy of AvailableRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableRoomResponseImplCopyWith<_$AvailableRoomResponseImpl>
  get copyWith =>
      __$$AvailableRoomResponseImplCopyWithImpl<_$AvailableRoomResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailableRoomResponseImplToJson(this);
  }
}

abstract class _AvailableRoomResponse implements AvailableRoomResponse {
  factory _AvailableRoomResponse({
    final String? id,
    final String? roomNumber,
    final String? roomTypeName,
    final String? status,
    final int? floor,
  }) = _$AvailableRoomResponseImpl;

  factory _AvailableRoomResponse.fromJson(Map<String, dynamic> json) =
      _$AvailableRoomResponseImpl.fromJson;

  @override
  String? get id;
  @override
  String? get roomNumber;
  @override
  String? get roomTypeName;
  @override
  String? get status;
  @override
  int? get floor;

  /// Create a copy of AvailableRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvailableRoomResponseImplCopyWith<_$AvailableRoomResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
