// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'destination_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DestinationResponse _$DestinationResponseFromJson(Map<String, dynamic> json) {
  return _DestinationResponse.fromJson(json);
}

/// @nodoc
mixin _$DestinationResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this DestinationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DestinationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DestinationResponseCopyWith<DestinationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DestinationResponseCopyWith<$Res> {
  factory $DestinationResponseCopyWith(
    DestinationResponse value,
    $Res Function(DestinationResponse) then,
  ) = _$DestinationResponseCopyWithImpl<$Res, DestinationResponse>;
  @useResult
  $Res call({
    String? id,
    String? code,
    String? name,
    String? region,
    String? imageUrl,
    String? description,
  });
}

/// @nodoc
class _$DestinationResponseCopyWithImpl<$Res, $Val extends DestinationResponse>
    implements $DestinationResponseCopyWith<$Res> {
  _$DestinationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DestinationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? region = freezed,
    Object? imageUrl = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            code: freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            region: freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DestinationResponseImplCopyWith<$Res>
    implements $DestinationResponseCopyWith<$Res> {
  factory _$$DestinationResponseImplCopyWith(
    _$DestinationResponseImpl value,
    $Res Function(_$DestinationResponseImpl) then,
  ) = __$$DestinationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? code,
    String? name,
    String? region,
    String? imageUrl,
    String? description,
  });
}

/// @nodoc
class __$$DestinationResponseImplCopyWithImpl<$Res>
    extends _$DestinationResponseCopyWithImpl<$Res, _$DestinationResponseImpl>
    implements _$$DestinationResponseImplCopyWith<$Res> {
  __$$DestinationResponseImplCopyWithImpl(
    _$DestinationResponseImpl _value,
    $Res Function(_$DestinationResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DestinationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? region = freezed,
    Object? imageUrl = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _$DestinationResponseImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        region: freezed == region
            ? _value.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DestinationResponseImpl implements _DestinationResponse {
  const _$DestinationResponseImpl({
    this.id,
    this.code,
    this.name,
    this.region,
    this.imageUrl,
    this.description,
  });

  factory _$DestinationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DestinationResponseImplFromJson(json);

  @override
  final String? id;
  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? region;
  @override
  final String? imageUrl;
  @override
  final String? description;

  @override
  String toString() {
    return 'DestinationResponse(id: $id, code: $code, name: $name, region: $region, imageUrl: $imageUrl, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DestinationResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, code, name, region, imageUrl, description);

  /// Create a copy of DestinationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DestinationResponseImplCopyWith<_$DestinationResponseImpl> get copyWith =>
      __$$DestinationResponseImplCopyWithImpl<_$DestinationResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DestinationResponseImplToJson(this);
  }
}

abstract class _DestinationResponse implements DestinationResponse {
  const factory _DestinationResponse({
    final String? id,
    final String? code,
    final String? name,
    final String? region,
    final String? imageUrl,
    final String? description,
  }) = _$DestinationResponseImpl;

  factory _DestinationResponse.fromJson(Map<String, dynamic> json) =
      _$DestinationResponseImpl.fromJson;

  @override
  String? get id;
  @override
  String? get code;
  @override
  String? get name;
  @override
  String? get region;
  @override
  String? get imageUrl;
  @override
  String? get description;

  /// Create a copy of DestinationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DestinationResponseImplCopyWith<_$DestinationResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
