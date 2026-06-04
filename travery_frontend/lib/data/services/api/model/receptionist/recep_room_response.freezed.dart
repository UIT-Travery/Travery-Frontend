// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recep_room_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RecepRoomResponse _$RecepRoomResponseFromJson(Map<String, dynamic> json) {
  return _RecepRoomResponse.fromJson(json);
}

/// @nodoc
mixin _$RecepRoomResponse {
  String get id => throw _privateConstructorUsedError;
  String get roomNumber => throw _privateConstructorUsedError;
  String get roomTypeName => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int? get floor => throw _privateConstructorUsedError;

  /// Serializes this RecepRoomResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecepRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecepRoomResponseCopyWith<RecepRoomResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecepRoomResponseCopyWith<$Res> {
  factory $RecepRoomResponseCopyWith(
    RecepRoomResponse value,
    $Res Function(RecepRoomResponse) then,
  ) = _$RecepRoomResponseCopyWithImpl<$Res, RecepRoomResponse>;
  @useResult
  $Res call({
    String id,
    String roomNumber,
    String roomTypeName,
    String status,
    int? floor,
  });
}

/// @nodoc
class _$RecepRoomResponseCopyWithImpl<$Res, $Val extends RecepRoomResponse>
    implements $RecepRoomResponseCopyWith<$Res> {
  _$RecepRoomResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecepRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomNumber = null,
    Object? roomTypeName = null,
    Object? status = null,
    Object? floor = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            roomNumber: null == roomNumber
                ? _value.roomNumber
                : roomNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            roomTypeName: null == roomTypeName
                ? _value.roomTypeName
                : roomTypeName // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$RecepRoomResponseImplCopyWith<$Res>
    implements $RecepRoomResponseCopyWith<$Res> {
  factory _$$RecepRoomResponseImplCopyWith(
    _$RecepRoomResponseImpl value,
    $Res Function(_$RecepRoomResponseImpl) then,
  ) = __$$RecepRoomResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String roomNumber,
    String roomTypeName,
    String status,
    int? floor,
  });
}

/// @nodoc
class __$$RecepRoomResponseImplCopyWithImpl<$Res>
    extends _$RecepRoomResponseCopyWithImpl<$Res, _$RecepRoomResponseImpl>
    implements _$$RecepRoomResponseImplCopyWith<$Res> {
  __$$RecepRoomResponseImplCopyWithImpl(
    _$RecepRoomResponseImpl _value,
    $Res Function(_$RecepRoomResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecepRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomNumber = null,
    Object? roomTypeName = null,
    Object? status = null,
    Object? floor = freezed,
  }) {
    return _then(
      _$RecepRoomResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        roomNumber: null == roomNumber
            ? _value.roomNumber
            : roomNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        roomTypeName: null == roomTypeName
            ? _value.roomTypeName
            : roomTypeName // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$RecepRoomResponseImpl implements _RecepRoomResponse {
  _$RecepRoomResponseImpl({
    required this.id,
    required this.roomNumber,
    required this.roomTypeName,
    required this.status,
    this.floor,
  });

  factory _$RecepRoomResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecepRoomResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String roomNumber;
  @override
  final String roomTypeName;
  @override
  final String status;
  @override
  final int? floor;

  @override
  String toString() {
    return 'RecepRoomResponse(id: $id, roomNumber: $roomNumber, roomTypeName: $roomTypeName, status: $status, floor: $floor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecepRoomResponseImpl &&
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

  /// Create a copy of RecepRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecepRoomResponseImplCopyWith<_$RecepRoomResponseImpl> get copyWith =>
      __$$RecepRoomResponseImplCopyWithImpl<_$RecepRoomResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecepRoomResponseImplToJson(this);
  }
}

abstract class _RecepRoomResponse implements RecepRoomResponse {
  factory _RecepRoomResponse({
    required final String id,
    required final String roomNumber,
    required final String roomTypeName,
    required final String status,
    final int? floor,
  }) = _$RecepRoomResponseImpl;

  factory _RecepRoomResponse.fromJson(Map<String, dynamic> json) =
      _$RecepRoomResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get roomNumber;
  @override
  String get roomTypeName;
  @override
  String get status;
  @override
  int? get floor;

  /// Create a copy of RecepRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecepRoomResponseImplCopyWith<_$RecepRoomResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
