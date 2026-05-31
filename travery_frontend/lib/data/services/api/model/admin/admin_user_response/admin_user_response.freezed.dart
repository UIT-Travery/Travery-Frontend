// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AdminUserResponse _$AdminUserResponseFromJson(Map<String, dynamic> json) {
  return _AdminUserResponse.fromJson(json);
}

/// @nodoc
mixin _$AdminUserResponse {
  String get id => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AdminUserResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdminUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminUserResponseCopyWith<AdminUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminUserResponseCopyWith<$Res> {
  factory $AdminUserResponseCopyWith(
    AdminUserResponse value,
    $Res Function(AdminUserResponse) then,
  ) = _$AdminUserResponseCopyWithImpl<$Res, AdminUserResponse>;
  @useResult
  $Res call({
    String id,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? avatarUrl,
    String? status,
    String? role,
    String? createdAt,
  });
}

/// @nodoc
class _$AdminUserResponseCopyWithImpl<$Res, $Val extends AdminUserResponse>
    implements $AdminUserResponseCopyWith<$Res> {
  _$AdminUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? avatarUrl = freezed,
    Object? status = freezed,
    Object? role = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: freezed == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            phoneNumber: freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            role: freezed == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AdminUserResponseImplCopyWith<$Res>
    implements $AdminUserResponseCopyWith<$Res> {
  factory _$$AdminUserResponseImplCopyWith(
    _$AdminUserResponseImpl value,
    $Res Function(_$AdminUserResponseImpl) then,
  ) = __$$AdminUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? avatarUrl,
    String? status,
    String? role,
    String? createdAt,
  });
}

/// @nodoc
class __$$AdminUserResponseImplCopyWithImpl<$Res>
    extends _$AdminUserResponseCopyWithImpl<$Res, _$AdminUserResponseImpl>
    implements _$$AdminUserResponseImplCopyWith<$Res> {
  __$$AdminUserResponseImplCopyWithImpl(
    _$AdminUserResponseImpl _value,
    $Res Function(_$AdminUserResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AdminUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? avatarUrl = freezed,
    Object? status = freezed,
    Object? role = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$AdminUserResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: freezed == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        phoneNumber: freezed == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        role: freezed == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminUserResponseImpl implements _AdminUserResponse {
  const _$AdminUserResponseImpl({
    required this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.avatarUrl,
    this.status,
    this.role,
    this.createdAt,
  });

  factory _$AdminUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminUserResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String? fullName;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String? avatarUrl;
  @override
  final String? status;
  @override
  final String? role;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'AdminUserResponse(id: $id, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, avatarUrl: $avatarUrl, status: $status, role: $role, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminUserResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    fullName,
    email,
    phoneNumber,
    avatarUrl,
    status,
    role,
    createdAt,
  );

  /// Create a copy of AdminUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminUserResponseImplCopyWith<_$AdminUserResponseImpl> get copyWith =>
      __$$AdminUserResponseImplCopyWithImpl<_$AdminUserResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminUserResponseImplToJson(this);
  }
}

abstract class _AdminUserResponse implements AdminUserResponse {
  const factory _AdminUserResponse({
    required final String id,
    final String? fullName,
    final String? email,
    final String? phoneNumber,
    final String? avatarUrl,
    final String? status,
    final String? role,
    final String? createdAt,
  }) = _$AdminUserResponseImpl;

  factory _AdminUserResponse.fromJson(Map<String, dynamic> json) =
      _$AdminUserResponseImpl.fromJson;

  @override
  String get id;
  @override
  String? get fullName;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  String? get avatarUrl;
  @override
  String? get status;
  @override
  String? get role;
  @override
  String? get createdAt;

  /// Create a copy of AdminUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminUserResponseImplCopyWith<_$AdminUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
