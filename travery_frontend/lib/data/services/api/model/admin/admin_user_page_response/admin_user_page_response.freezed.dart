// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_user_page_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AdminUserPageResponse _$AdminUserPageResponseFromJson(
  Map<String, dynamic> json,
) {
  return _AdminUserPageResponse.fromJson(json);
}

/// @nodoc
mixin _$AdminUserPageResponse {
  List<AdminUserResponse> get content => throw _privateConstructorUsedError;
  int get totalElements => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  bool get last => throw _privateConstructorUsedError;
  bool get first => throw _privateConstructorUsedError;

  /// Serializes this AdminUserPageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdminUserPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminUserPageResponseCopyWith<AdminUserPageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminUserPageResponseCopyWith<$Res> {
  factory $AdminUserPageResponseCopyWith(
    AdminUserPageResponse value,
    $Res Function(AdminUserPageResponse) then,
  ) = _$AdminUserPageResponseCopyWithImpl<$Res, AdminUserPageResponse>;
  @useResult
  $Res call({
    List<AdminUserResponse> content,
    int totalElements,
    int totalPages,
    int size,
    int number,
    bool last,
    bool first,
  });
}

/// @nodoc
class _$AdminUserPageResponseCopyWithImpl<
  $Res,
  $Val extends AdminUserPageResponse
>
    implements $AdminUserPageResponseCopyWith<$Res> {
  _$AdminUserPageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminUserPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? totalElements = null,
    Object? totalPages = null,
    Object? size = null,
    Object? number = null,
    Object? last = null,
    Object? first = null,
  }) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as List<AdminUserResponse>,
            totalElements: null == totalElements
                ? _value.totalElements
                : totalElements // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            size: null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int,
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int,
            last: null == last
                ? _value.last
                : last // ignore: cast_nullable_to_non_nullable
                      as bool,
            first: null == first
                ? _value.first
                : first // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AdminUserPageResponseImplCopyWith<$Res>
    implements $AdminUserPageResponseCopyWith<$Res> {
  factory _$$AdminUserPageResponseImplCopyWith(
    _$AdminUserPageResponseImpl value,
    $Res Function(_$AdminUserPageResponseImpl) then,
  ) = __$$AdminUserPageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<AdminUserResponse> content,
    int totalElements,
    int totalPages,
    int size,
    int number,
    bool last,
    bool first,
  });
}

/// @nodoc
class __$$AdminUserPageResponseImplCopyWithImpl<$Res>
    extends
        _$AdminUserPageResponseCopyWithImpl<$Res, _$AdminUserPageResponseImpl>
    implements _$$AdminUserPageResponseImplCopyWith<$Res> {
  __$$AdminUserPageResponseImplCopyWithImpl(
    _$AdminUserPageResponseImpl _value,
    $Res Function(_$AdminUserPageResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AdminUserPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? totalElements = null,
    Object? totalPages = null,
    Object? size = null,
    Object? number = null,
    Object? last = null,
    Object? first = null,
  }) {
    return _then(
      _$AdminUserPageResponseImpl(
        content: null == content
            ? _value._content
            : content // ignore: cast_nullable_to_non_nullable
                  as List<AdminUserResponse>,
        totalElements: null == totalElements
            ? _value.totalElements
            : totalElements // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        size: null == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        last: null == last
            ? _value.last
            : last // ignore: cast_nullable_to_non_nullable
                  as bool,
        first: null == first
            ? _value.first
            : first // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminUserPageResponseImpl implements _AdminUserPageResponse {
  const _$AdminUserPageResponseImpl({
    final List<AdminUserResponse> content = const [],
    this.totalElements = 0,
    this.totalPages = 0,
    this.size = 20,
    this.number = 0,
    this.last = false,
    this.first = false,
  }) : _content = content;

  factory _$AdminUserPageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminUserPageResponseImplFromJson(json);

  final List<AdminUserResponse> _content;
  @override
  @JsonKey()
  List<AdminUserResponse> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  @JsonKey()
  final int totalElements;
  @override
  @JsonKey()
  final int totalPages;
  @override
  @JsonKey()
  final int size;
  @override
  @JsonKey()
  final int number;
  @override
  @JsonKey()
  final bool last;
  @override
  @JsonKey()
  final bool first;

  @override
  String toString() {
    return 'AdminUserPageResponse(content: $content, totalElements: $totalElements, totalPages: $totalPages, size: $size, number: $number, last: $last, first: $first)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminUserPageResponseImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.last, last) || other.last == last) &&
            (identical(other.first, first) || other.first == first));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_content),
    totalElements,
    totalPages,
    size,
    number,
    last,
    first,
  );

  /// Create a copy of AdminUserPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminUserPageResponseImplCopyWith<_$AdminUserPageResponseImpl>
  get copyWith =>
      __$$AdminUserPageResponseImplCopyWithImpl<_$AdminUserPageResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminUserPageResponseImplToJson(this);
  }
}

abstract class _AdminUserPageResponse implements AdminUserPageResponse {
  const factory _AdminUserPageResponse({
    final List<AdminUserResponse> content,
    final int totalElements,
    final int totalPages,
    final int size,
    final int number,
    final bool last,
    final bool first,
  }) = _$AdminUserPageResponseImpl;

  factory _AdminUserPageResponse.fromJson(Map<String, dynamic> json) =
      _$AdminUserPageResponseImpl.fromJson;

  @override
  List<AdminUserResponse> get content;
  @override
  int get totalElements;
  @override
  int get totalPages;
  @override
  int get size;
  @override
  int get number;
  @override
  bool get last;
  @override
  bool get first;

  /// Create a copy of AdminUserPageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminUserPageResponseImplCopyWith<_$AdminUserPageResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
