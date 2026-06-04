// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_payment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreatePaymentResponse _$CreatePaymentResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CreatePaymentResponse.fromJson(json);
}

/// @nodoc
mixin _$CreatePaymentResponse {
  int get httpStatus => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  PaymentResponseData get data => throw _privateConstructorUsedError;

  /// Serializes this CreatePaymentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatePaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePaymentResponseCopyWith<CreatePaymentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePaymentResponseCopyWith<$Res> {
  factory $CreatePaymentResponseCopyWith(
    CreatePaymentResponse value,
    $Res Function(CreatePaymentResponse) then,
  ) = _$CreatePaymentResponseCopyWithImpl<$Res, CreatePaymentResponse>;
  @useResult
  $Res call({int httpStatus, String message, PaymentResponseData data});

  $PaymentResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class _$CreatePaymentResponseCopyWithImpl<
  $Res,
  $Val extends CreatePaymentResponse
>
    implements $CreatePaymentResponseCopyWith<$Res> {
  _$CreatePaymentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? httpStatus = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(
      _value.copyWith(
            httpStatus: null == httpStatus
                ? _value.httpStatus
                : httpStatus // ignore: cast_nullable_to_non_nullable
                      as int,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as PaymentResponseData,
          )
          as $Val,
    );
  }

  /// Create a copy of CreatePaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentResponseDataCopyWith<$Res> get data {
    return $PaymentResponseDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreatePaymentResponseImplCopyWith<$Res>
    implements $CreatePaymentResponseCopyWith<$Res> {
  factory _$$CreatePaymentResponseImplCopyWith(
    _$CreatePaymentResponseImpl value,
    $Res Function(_$CreatePaymentResponseImpl) then,
  ) = __$$CreatePaymentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int httpStatus, String message, PaymentResponseData data});

  @override
  $PaymentResponseDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$CreatePaymentResponseImplCopyWithImpl<$Res>
    extends
        _$CreatePaymentResponseCopyWithImpl<$Res, _$CreatePaymentResponseImpl>
    implements _$$CreatePaymentResponseImplCopyWith<$Res> {
  __$$CreatePaymentResponseImplCopyWithImpl(
    _$CreatePaymentResponseImpl _value,
    $Res Function(_$CreatePaymentResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreatePaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? httpStatus = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(
      _$CreatePaymentResponseImpl(
        httpStatus: null == httpStatus
            ? _value.httpStatus
            : httpStatus // ignore: cast_nullable_to_non_nullable
                  as int,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as PaymentResponseData,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePaymentResponseImpl implements _CreatePaymentResponse {
  const _$CreatePaymentResponseImpl({
    required this.httpStatus,
    required this.message,
    required this.data,
  });

  factory _$CreatePaymentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePaymentResponseImplFromJson(json);

  @override
  final int httpStatus;
  @override
  final String message;
  @override
  final PaymentResponseData data;

  @override
  String toString() {
    return 'CreatePaymentResponse(httpStatus: $httpStatus, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePaymentResponseImpl &&
            (identical(other.httpStatus, httpStatus) ||
                other.httpStatus == httpStatus) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, httpStatus, message, data);

  /// Create a copy of CreatePaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePaymentResponseImplCopyWith<_$CreatePaymentResponseImpl>
  get copyWith =>
      __$$CreatePaymentResponseImplCopyWithImpl<_$CreatePaymentResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePaymentResponseImplToJson(this);
  }
}

abstract class _CreatePaymentResponse implements CreatePaymentResponse {
  const factory _CreatePaymentResponse({
    required final int httpStatus,
    required final String message,
    required final PaymentResponseData data,
  }) = _$CreatePaymentResponseImpl;

  factory _CreatePaymentResponse.fromJson(Map<String, dynamic> json) =
      _$CreatePaymentResponseImpl.fromJson;

  @override
  int get httpStatus;
  @override
  String get message;
  @override
  PaymentResponseData get data;

  /// Create a copy of CreatePaymentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePaymentResponseImplCopyWith<_$CreatePaymentResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PaymentResponseData _$PaymentResponseDataFromJson(Map<String, dynamic> json) {
  return _PaymentResponseData.fromJson(json);
}

/// @nodoc
mixin _$PaymentResponseData {
  String get transactionId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get paymentUrl => throw _privateConstructorUsedError;
  String? get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this PaymentResponseData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentResponseDataCopyWith<PaymentResponseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentResponseDataCopyWith<$Res> {
  factory $PaymentResponseDataCopyWith(
    PaymentResponseData value,
    $Res Function(PaymentResponseData) then,
  ) = _$PaymentResponseDataCopyWithImpl<$Res, PaymentResponseData>;
  @useResult
  $Res call({
    String transactionId,
    double amount,
    String paymentUrl,
    String? expiresAt,
  });
}

/// @nodoc
class _$PaymentResponseDataCopyWithImpl<$Res, $Val extends PaymentResponseData>
    implements $PaymentResponseDataCopyWith<$Res> {
  _$PaymentResponseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? amount = null,
    Object? paymentUrl = null,
    Object? expiresAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            transactionId: null == transactionId
                ? _value.transactionId
                : transactionId // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            paymentUrl: null == paymentUrl
                ? _value.paymentUrl
                : paymentUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            expiresAt: freezed == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentResponseDataImplCopyWith<$Res>
    implements $PaymentResponseDataCopyWith<$Res> {
  factory _$$PaymentResponseDataImplCopyWith(
    _$PaymentResponseDataImpl value,
    $Res Function(_$PaymentResponseDataImpl) then,
  ) = __$$PaymentResponseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String transactionId,
    double amount,
    String paymentUrl,
    String? expiresAt,
  });
}

/// @nodoc
class __$$PaymentResponseDataImplCopyWithImpl<$Res>
    extends _$PaymentResponseDataCopyWithImpl<$Res, _$PaymentResponseDataImpl>
    implements _$$PaymentResponseDataImplCopyWith<$Res> {
  __$$PaymentResponseDataImplCopyWithImpl(
    _$PaymentResponseDataImpl _value,
    $Res Function(_$PaymentResponseDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentResponseData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? amount = null,
    Object? paymentUrl = null,
    Object? expiresAt = freezed,
  }) {
    return _then(
      _$PaymentResponseDataImpl(
        transactionId: null == transactionId
            ? _value.transactionId
            : transactionId // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        paymentUrl: null == paymentUrl
            ? _value.paymentUrl
            : paymentUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        expiresAt: freezed == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentResponseDataImpl implements _PaymentResponseData {
  const _$PaymentResponseDataImpl({
    required this.transactionId,
    required this.amount,
    required this.paymentUrl,
    this.expiresAt,
  });

  factory _$PaymentResponseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentResponseDataImplFromJson(json);

  @override
  final String transactionId;
  @override
  final double amount;
  @override
  final String paymentUrl;
  @override
  final String? expiresAt;

  @override
  String toString() {
    return 'PaymentResponseData(transactionId: $transactionId, amount: $amount, paymentUrl: $paymentUrl, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentResponseDataImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentUrl, paymentUrl) ||
                other.paymentUrl == paymentUrl) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, transactionId, amount, paymentUrl, expiresAt);

  /// Create a copy of PaymentResponseData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentResponseDataImplCopyWith<_$PaymentResponseDataImpl> get copyWith =>
      __$$PaymentResponseDataImplCopyWithImpl<_$PaymentResponseDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentResponseDataImplToJson(this);
  }
}

abstract class _PaymentResponseData implements PaymentResponseData {
  const factory _PaymentResponseData({
    required final String transactionId,
    required final double amount,
    required final String paymentUrl,
    final String? expiresAt,
  }) = _$PaymentResponseDataImpl;

  factory _PaymentResponseData.fromJson(Map<String, dynamic> json) =
      _$PaymentResponseDataImpl.fromJson;

  @override
  String get transactionId;
  @override
  double get amount;
  @override
  String get paymentUrl;
  @override
  String? get expiresAt;

  /// Create a copy of PaymentResponseData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentResponseDataImplCopyWith<_$PaymentResponseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
