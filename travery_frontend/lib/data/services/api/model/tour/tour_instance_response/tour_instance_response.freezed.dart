// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_instance_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TourInstanceResponse _$TourInstanceResponseFromJson(Map<String, dynamic> json) {
  return _TourInstanceResponse.fromJson(json);
}

/// @nodoc
mixin _$TourInstanceResponse {
  String get id => throw _privateConstructorUsedError;
  String get tourName => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get currentParticipants => throw _privateConstructorUsedError;
  int? get maxParticipants => throw _privateConstructorUsedError;
  int? get availableSlots => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this TourInstanceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TourInstanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TourInstanceResponseCopyWith<TourInstanceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourInstanceResponseCopyWith<$Res> {
  factory $TourInstanceResponseCopyWith(
    TourInstanceResponse value,
    $Res Function(TourInstanceResponse) then,
  ) = _$TourInstanceResponseCopyWithImpl<$Res, TourInstanceResponse>;
  @useResult
  $Res call({
    String id,
    String tourName,
    String startDate,
    String? endDate,
    String status,
    int currentParticipants,
    int? maxParticipants,
    int? availableSlots,
    String? imageUrl,
  });
}

/// @nodoc
class _$TourInstanceResponseCopyWithImpl<
  $Res,
  $Val extends TourInstanceResponse
>
    implements $TourInstanceResponseCopyWith<$Res> {
  _$TourInstanceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TourInstanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tourName = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? status = null,
    Object? currentParticipants = null,
    Object? maxParticipants = freezed,
    Object? availableSlots = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            tourName: null == tourName
                ? _value.tourName
                : tourName // ignore: cast_nullable_to_non_nullable
                      as String,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            currentParticipants: null == currentParticipants
                ? _value.currentParticipants
                : currentParticipants // ignore: cast_nullable_to_non_nullable
                      as int,
            maxParticipants: freezed == maxParticipants
                ? _value.maxParticipants
                : maxParticipants // ignore: cast_nullable_to_non_nullable
                      as int?,
            availableSlots: freezed == availableSlots
                ? _value.availableSlots
                : availableSlots // ignore: cast_nullable_to_non_nullable
                      as int?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TourInstanceResponseImplCopyWith<$Res>
    implements $TourInstanceResponseCopyWith<$Res> {
  factory _$$TourInstanceResponseImplCopyWith(
    _$TourInstanceResponseImpl value,
    $Res Function(_$TourInstanceResponseImpl) then,
  ) = __$$TourInstanceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String tourName,
    String startDate,
    String? endDate,
    String status,
    int currentParticipants,
    int? maxParticipants,
    int? availableSlots,
    String? imageUrl,
  });
}

/// @nodoc
class __$$TourInstanceResponseImplCopyWithImpl<$Res>
    extends _$TourInstanceResponseCopyWithImpl<$Res, _$TourInstanceResponseImpl>
    implements _$$TourInstanceResponseImplCopyWith<$Res> {
  __$$TourInstanceResponseImplCopyWithImpl(
    _$TourInstanceResponseImpl _value,
    $Res Function(_$TourInstanceResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TourInstanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tourName = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? status = null,
    Object? currentParticipants = null,
    Object? maxParticipants = freezed,
    Object? availableSlots = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _$TourInstanceResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        tourName: null == tourName
            ? _value.tourName
            : tourName // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        currentParticipants: null == currentParticipants
            ? _value.currentParticipants
            : currentParticipants // ignore: cast_nullable_to_non_nullable
                  as int,
        maxParticipants: freezed == maxParticipants
            ? _value.maxParticipants
            : maxParticipants // ignore: cast_nullable_to_non_nullable
                  as int?,
        availableSlots: freezed == availableSlots
            ? _value.availableSlots
            : availableSlots // ignore: cast_nullable_to_non_nullable
                  as int?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TourInstanceResponseImpl implements _TourInstanceResponse {
  const _$TourInstanceResponseImpl({
    required this.id,
    required this.tourName,
    required this.startDate,
    this.endDate,
    required this.status,
    required this.currentParticipants,
    this.maxParticipants,
    this.availableSlots,
    this.imageUrl,
  });

  factory _$TourInstanceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TourInstanceResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String tourName;
  @override
  final String startDate;
  @override
  final String? endDate;
  @override
  final String status;
  @override
  final int currentParticipants;
  @override
  final int? maxParticipants;
  @override
  final int? availableSlots;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'TourInstanceResponse(id: $id, tourName: $tourName, startDate: $startDate, endDate: $endDate, status: $status, currentParticipants: $currentParticipants, maxParticipants: $maxParticipants, availableSlots: $availableSlots, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TourInstanceResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tourName, tourName) ||
                other.tourName == tourName) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentParticipants, currentParticipants) ||
                other.currentParticipants == currentParticipants) &&
            (identical(other.maxParticipants, maxParticipants) ||
                other.maxParticipants == maxParticipants) &&
            (identical(other.availableSlots, availableSlots) ||
                other.availableSlots == availableSlots) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    tourName,
    startDate,
    endDate,
    status,
    currentParticipants,
    maxParticipants,
    availableSlots,
    imageUrl,
  );

  /// Create a copy of TourInstanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TourInstanceResponseImplCopyWith<_$TourInstanceResponseImpl>
  get copyWith =>
      __$$TourInstanceResponseImplCopyWithImpl<_$TourInstanceResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TourInstanceResponseImplToJson(this);
  }
}

abstract class _TourInstanceResponse implements TourInstanceResponse {
  const factory _TourInstanceResponse({
    required final String id,
    required final String tourName,
    required final String startDate,
    final String? endDate,
    required final String status,
    required final int currentParticipants,
    final int? maxParticipants,
    final int? availableSlots,
    final String? imageUrl,
  }) = _$TourInstanceResponseImpl;

  factory _TourInstanceResponse.fromJson(Map<String, dynamic> json) =
      _$TourInstanceResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get tourName;
  @override
  String get startDate;
  @override
  String? get endDate;
  @override
  String get status;
  @override
  int get currentParticipants;
  @override
  int? get maxParticipants;
  @override
  int? get availableSlots;
  @override
  String? get imageUrl;

  /// Create a copy of TourInstanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TourInstanceResponseImplCopyWith<_$TourInstanceResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
