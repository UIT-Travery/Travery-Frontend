// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refund_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RefundResponse _$RefundResponseFromJson(Map<String, dynamic> json) {
  return _RefundResponse.fromJson(json);
}

/// @nodoc
mixin _$RefundResponse {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userEmail => throw _privateConstructorUsedError;
  double get requestedAmount => throw _privateConstructorUsedError;
  double? get actualRefunded => throw _privateConstructorUsedError;
  String? get customerReason => throw _privateConstructorUsedError;
  String? get rejectReason => throw _privateConstructorUsedError;
  String get bookingType => throw _privateConstructorUsedError;
  String? get bankName => throw _privateConstructorUsedError;
  String? get accountNumber => throw _privateConstructorUsedError;
  String? get accountHolderName => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this RefundResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefundResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefundResponseCopyWith<RefundResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefundResponseCopyWith<$Res> {
  factory $RefundResponseCopyWith(
    RefundResponse value,
    $Res Function(RefundResponse) then,
  ) = _$RefundResponseCopyWithImpl<$Res, RefundResponse>;
  @useResult
  $Res call({
    String id,
    String userId,
    String userName,
    String userEmail,
    double requestedAmount,
    double? actualRefunded,
    String? customerReason,
    String? rejectReason,
    String bookingType,
    String? bankName,
    String? accountNumber,
    String? accountHolderName,
    String createdAt,
    String updatedAt,
  });
}

/// @nodoc
class _$RefundResponseCopyWithImpl<$Res, $Val extends RefundResponse>
    implements $RefundResponseCopyWith<$Res> {
  _$RefundResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefundResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? userEmail = null,
    Object? requestedAmount = null,
    Object? actualRefunded = freezed,
    Object? customerReason = freezed,
    Object? rejectReason = freezed,
    Object? bookingType = null,
    Object? bankName = freezed,
    Object? accountNumber = freezed,
    Object? accountHolderName = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            userName: null == userName
                ? _value.userName
                : userName // ignore: cast_nullable_to_non_nullable
                      as String,
            userEmail: null == userEmail
                ? _value.userEmail
                : userEmail // ignore: cast_nullable_to_non_nullable
                      as String,
            requestedAmount: null == requestedAmount
                ? _value.requestedAmount
                : requestedAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            actualRefunded: freezed == actualRefunded
                ? _value.actualRefunded
                : actualRefunded // ignore: cast_nullable_to_non_nullable
                      as double?,
            customerReason: freezed == customerReason
                ? _value.customerReason
                : customerReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            rejectReason: freezed == rejectReason
                ? _value.rejectReason
                : rejectReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            bookingType: null == bookingType
                ? _value.bookingType
                : bookingType // ignore: cast_nullable_to_non_nullable
                      as String,
            bankName: freezed == bankName
                ? _value.bankName
                : bankName // ignore: cast_nullable_to_non_nullable
                      as String?,
            accountNumber: freezed == accountNumber
                ? _value.accountNumber
                : accountNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            accountHolderName: freezed == accountHolderName
                ? _value.accountHolderName
                : accountHolderName // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RefundResponseImplCopyWith<$Res>
    implements $RefundResponseCopyWith<$Res> {
  factory _$$RefundResponseImplCopyWith(
    _$RefundResponseImpl value,
    $Res Function(_$RefundResponseImpl) then,
  ) = __$$RefundResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String userName,
    String userEmail,
    double requestedAmount,
    double? actualRefunded,
    String? customerReason,
    String? rejectReason,
    String bookingType,
    String? bankName,
    String? accountNumber,
    String? accountHolderName,
    String createdAt,
    String updatedAt,
  });
}

/// @nodoc
class __$$RefundResponseImplCopyWithImpl<$Res>
    extends _$RefundResponseCopyWithImpl<$Res, _$RefundResponseImpl>
    implements _$$RefundResponseImplCopyWith<$Res> {
  __$$RefundResponseImplCopyWithImpl(
    _$RefundResponseImpl _value,
    $Res Function(_$RefundResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RefundResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? userEmail = null,
    Object? requestedAmount = null,
    Object? actualRefunded = freezed,
    Object? customerReason = freezed,
    Object? rejectReason = freezed,
    Object? bookingType = null,
    Object? bankName = freezed,
    Object? accountNumber = freezed,
    Object? accountHolderName = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$RefundResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        userName: null == userName
            ? _value.userName
            : userName // ignore: cast_nullable_to_non_nullable
                  as String,
        userEmail: null == userEmail
            ? _value.userEmail
            : userEmail // ignore: cast_nullable_to_non_nullable
                  as String,
        requestedAmount: null == requestedAmount
            ? _value.requestedAmount
            : requestedAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        actualRefunded: freezed == actualRefunded
            ? _value.actualRefunded
            : actualRefunded // ignore: cast_nullable_to_non_nullable
                  as double?,
        customerReason: freezed == customerReason
            ? _value.customerReason
            : customerReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        rejectReason: freezed == rejectReason
            ? _value.rejectReason
            : rejectReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        bookingType: null == bookingType
            ? _value.bookingType
            : bookingType // ignore: cast_nullable_to_non_nullable
                  as String,
        bankName: freezed == bankName
            ? _value.bankName
            : bankName // ignore: cast_nullable_to_non_nullable
                  as String?,
        accountNumber: freezed == accountNumber
            ? _value.accountNumber
            : accountNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        accountHolderName: freezed == accountHolderName
            ? _value.accountHolderName
            : accountHolderName // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RefundResponseImpl implements _RefundResponse {
  const _$RefundResponseImpl({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.requestedAmount,
    this.actualRefunded,
    this.customerReason,
    this.rejectReason,
    required this.bookingType,
    this.bankName,
    this.accountNumber,
    this.accountHolderName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _$RefundResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefundResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String userEmail;
  @override
  final double requestedAmount;
  @override
  final double? actualRefunded;
  @override
  final String? customerReason;
  @override
  final String? rejectReason;
  @override
  final String bookingType;
  @override
  final String? bankName;
  @override
  final String? accountNumber;
  @override
  final String? accountHolderName;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'RefundResponse(id: $id, userId: $userId, userName: $userName, userEmail: $userEmail, requestedAmount: $requestedAmount, actualRefunded: $actualRefunded, customerReason: $customerReason, rejectReason: $rejectReason, bookingType: $bookingType, bankName: $bankName, accountNumber: $accountNumber, accountHolderName: $accountHolderName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefundResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.requestedAmount, requestedAmount) ||
                other.requestedAmount == requestedAmount) &&
            (identical(other.actualRefunded, actualRefunded) ||
                other.actualRefunded == actualRefunded) &&
            (identical(other.customerReason, customerReason) ||
                other.customerReason == customerReason) &&
            (identical(other.rejectReason, rejectReason) ||
                other.rejectReason == rejectReason) &&
            (identical(other.bookingType, bookingType) ||
                other.bookingType == bookingType) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.accountHolderName, accountHolderName) ||
                other.accountHolderName == accountHolderName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    userName,
    userEmail,
    requestedAmount,
    actualRefunded,
    customerReason,
    rejectReason,
    bookingType,
    bankName,
    accountNumber,
    accountHolderName,
    createdAt,
    updatedAt,
  );

  /// Create a copy of RefundResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefundResponseImplCopyWith<_$RefundResponseImpl> get copyWith =>
      __$$RefundResponseImplCopyWithImpl<_$RefundResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RefundResponseImplToJson(this);
  }
}

abstract class _RefundResponse implements RefundResponse {
  const factory _RefundResponse({
    required final String id,
    required final String userId,
    required final String userName,
    required final String userEmail,
    required final double requestedAmount,
    final double? actualRefunded,
    final String? customerReason,
    final String? rejectReason,
    required final String bookingType,
    final String? bankName,
    final String? accountNumber,
    final String? accountHolderName,
    required final String createdAt,
    required final String updatedAt,
  }) = _$RefundResponseImpl;

  factory _RefundResponse.fromJson(Map<String, dynamic> json) =
      _$RefundResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get userName;
  @override
  String get userEmail;
  @override
  double get requestedAmount;
  @override
  double? get actualRefunded;
  @override
  String? get customerReason;
  @override
  String? get rejectReason;
  @override
  String get bookingType;
  @override
  String? get bankName;
  @override
  String? get accountNumber;
  @override
  String? get accountHolderName;
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of RefundResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefundResponseImplCopyWith<_$RefundResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
