// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_tourist_profile_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UpdateTouristProfileRequest _$UpdateTouristProfileRequestFromJson(
  Map<String, dynamic> json,
) {
  return _UpdateTouristProfileRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateTouristProfileRequest {
  String? get fullName => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;

  /// Serializes this UpdateTouristProfileRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateTouristProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateTouristProfileRequestCopyWith<UpdateTouristProfileRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTouristProfileRequestCopyWith<$Res> {
  factory $UpdateTouristProfileRequestCopyWith(
    UpdateTouristProfileRequest value,
    $Res Function(UpdateTouristProfileRequest) then,
  ) =
      _$UpdateTouristProfileRequestCopyWithImpl<
        $Res,
        UpdateTouristProfileRequest
      >;
  @useResult
  $Res call({String? fullName, String? phoneNumber});
}

/// @nodoc
class _$UpdateTouristProfileRequestCopyWithImpl<
  $Res,
  $Val extends UpdateTouristProfileRequest
>
    implements $UpdateTouristProfileRequestCopyWith<$Res> {
  _$UpdateTouristProfileRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateTouristProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? fullName = freezed, Object? phoneNumber = freezed}) {
    return _then(
      _value.copyWith(
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            phoneNumber: freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateTouristProfileRequestImplCopyWith<$Res>
    implements $UpdateTouristProfileRequestCopyWith<$Res> {
  factory _$$UpdateTouristProfileRequestImplCopyWith(
    _$UpdateTouristProfileRequestImpl value,
    $Res Function(_$UpdateTouristProfileRequestImpl) then,
  ) = __$$UpdateTouristProfileRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? fullName, String? phoneNumber});
}

/// @nodoc
class __$$UpdateTouristProfileRequestImplCopyWithImpl<$Res>
    extends
        _$UpdateTouristProfileRequestCopyWithImpl<
          $Res,
          _$UpdateTouristProfileRequestImpl
        >
    implements _$$UpdateTouristProfileRequestImplCopyWith<$Res> {
  __$$UpdateTouristProfileRequestImplCopyWithImpl(
    _$UpdateTouristProfileRequestImpl _value,
    $Res Function(_$UpdateTouristProfileRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateTouristProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? fullName = freezed, Object? phoneNumber = freezed}) {
    return _then(
      _$UpdateTouristProfileRequestImpl(
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        phoneNumber: freezed == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateTouristProfileRequestImpl
    implements _UpdateTouristProfileRequest {
  const _$UpdateTouristProfileRequestImpl({this.fullName, this.phoneNumber});

  factory _$UpdateTouristProfileRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$UpdateTouristProfileRequestImplFromJson(json);

  @override
  final String? fullName;
  @override
  final String? phoneNumber;

  @override
  String toString() {
    return 'UpdateTouristProfileRequest(fullName: $fullName, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTouristProfileRequestImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fullName, phoneNumber);

  /// Create a copy of UpdateTouristProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTouristProfileRequestImplCopyWith<_$UpdateTouristProfileRequestImpl>
  get copyWith =>
      __$$UpdateTouristProfileRequestImplCopyWithImpl<
        _$UpdateTouristProfileRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateTouristProfileRequestImplToJson(this);
  }
}

abstract class _UpdateTouristProfileRequest
    implements UpdateTouristProfileRequest {
  const factory _UpdateTouristProfileRequest({
    final String? fullName,
    final String? phoneNumber,
  }) = _$UpdateTouristProfileRequestImpl;

  factory _UpdateTouristProfileRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateTouristProfileRequestImpl.fromJson;

  @override
  String? get fullName;
  @override
  String? get phoneNumber;

  /// Create a copy of UpdateTouristProfileRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTouristProfileRequestImplCopyWith<_$UpdateTouristProfileRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
