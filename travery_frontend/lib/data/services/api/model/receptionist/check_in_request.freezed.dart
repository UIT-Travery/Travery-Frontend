// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CheckInRequest _$CheckInRequestFromJson(Map<String, dynamic> json) {
  return _CheckInRequest.fromJson(json);
}

/// @nodoc
mixin _$CheckInRequest {
  List<String> get roomIds => throw _privateConstructorUsedError;

  /// Serializes this CheckInRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckInRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInRequestCopyWith<CheckInRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInRequestCopyWith<$Res> {
  factory $CheckInRequestCopyWith(
    CheckInRequest value,
    $Res Function(CheckInRequest) then,
  ) = _$CheckInRequestCopyWithImpl<$Res, CheckInRequest>;
  @useResult
  $Res call({List<String> roomIds});
}

/// @nodoc
class _$CheckInRequestCopyWithImpl<$Res, $Val extends CheckInRequest>
    implements $CheckInRequestCopyWith<$Res> {
  _$CheckInRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomIds = null}) {
    return _then(
      _value.copyWith(
            roomIds: null == roomIds
                ? _value.roomIds
                : roomIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckInRequestImplCopyWith<$Res>
    implements $CheckInRequestCopyWith<$Res> {
  factory _$$CheckInRequestImplCopyWith(
    _$CheckInRequestImpl value,
    $Res Function(_$CheckInRequestImpl) then,
  ) = __$$CheckInRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> roomIds});
}

/// @nodoc
class __$$CheckInRequestImplCopyWithImpl<$Res>
    extends _$CheckInRequestCopyWithImpl<$Res, _$CheckInRequestImpl>
    implements _$$CheckInRequestImplCopyWith<$Res> {
  __$$CheckInRequestImplCopyWithImpl(
    _$CheckInRequestImpl _value,
    $Res Function(_$CheckInRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckInRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomIds = null}) {
    return _then(
      _$CheckInRequestImpl(
        roomIds: null == roomIds
            ? _value._roomIds
            : roomIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckInRequestImpl implements _CheckInRequest {
  const _$CheckInRequestImpl({required final List<String> roomIds})
    : _roomIds = roomIds;

  factory _$CheckInRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInRequestImplFromJson(json);

  final List<String> _roomIds;
  @override
  List<String> get roomIds {
    if (_roomIds is EqualUnmodifiableListView) return _roomIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roomIds);
  }

  @override
  String toString() {
    return 'CheckInRequest(roomIds: $roomIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInRequestImpl &&
            const DeepCollectionEquality().equals(other._roomIds, _roomIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_roomIds));

  /// Create a copy of CheckInRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInRequestImplCopyWith<_$CheckInRequestImpl> get copyWith =>
      __$$CheckInRequestImplCopyWithImpl<_$CheckInRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInRequestImplToJson(this);
  }
}

abstract class _CheckInRequest implements CheckInRequest {
  const factory _CheckInRequest({required final List<String> roomIds}) =
      _$CheckInRequestImpl;

  factory _CheckInRequest.fromJson(Map<String, dynamic> json) =
      _$CheckInRequestImpl.fromJson;

  @override
  List<String> get roomIds;

  /// Create a copy of CheckInRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInRequestImplCopyWith<_$CheckInRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
