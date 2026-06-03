// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_user_page_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminUserPageResponse {

 List<AdminUserResponse> get content; int get totalElements; int get totalPages; int get size; int get number; bool get last; bool get first;
/// Create a copy of AdminUserPageResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminUserPageResponseCopyWith<AdminUserPageResponse> get copyWith => _$AdminUserPageResponseCopyWithImpl<AdminUserPageResponse>(this as AdminUserPageResponse, _$identity);

  /// Serializes this AdminUserPageResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminUserPageResponse&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.size, size) || other.size == size)&&(identical(other.number, number) || other.number == number)&&(identical(other.last, last) || other.last == last)&&(identical(other.first, first) || other.first == first));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),totalElements,totalPages,size,number,last,first);

@override
String toString() {
  return 'AdminUserPageResponse(content: $content, totalElements: $totalElements, totalPages: $totalPages, size: $size, number: $number, last: $last, first: $first)';
}


}

/// @nodoc
abstract mixin class $AdminUserPageResponseCopyWith<$Res>  {
  factory $AdminUserPageResponseCopyWith(AdminUserPageResponse value, $Res Function(AdminUserPageResponse) _then) = _$AdminUserPageResponseCopyWithImpl;
@useResult
$Res call({
 List<AdminUserResponse> content, int totalElements, int totalPages, int size, int number, bool last, bool first
});




}
/// @nodoc
class _$AdminUserPageResponseCopyWithImpl<$Res>
    implements $AdminUserPageResponseCopyWith<$Res> {
  _$AdminUserPageResponseCopyWithImpl(this._self, this._then);

  final AdminUserPageResponse _self;
  final $Res Function(AdminUserPageResponse) _then;

/// Create a copy of AdminUserPageResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? totalElements = null,Object? totalPages = null,Object? size = null,Object? number = null,Object? last = null,Object? first = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<AdminUserResponse>,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as bool,first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminUserPageResponse].
extension AdminUserPageResponsePatterns on AdminUserPageResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminUserPageResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminUserPageResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminUserPageResponse value)  $default,){
final _that = this;
switch (_that) {
case _AdminUserPageResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminUserPageResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AdminUserPageResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AdminUserResponse> content,  int totalElements,  int totalPages,  int size,  int number,  bool last,  bool first)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminUserPageResponse() when $default != null:
return $default(_that.content,_that.totalElements,_that.totalPages,_that.size,_that.number,_that.last,_that.first);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AdminUserResponse> content,  int totalElements,  int totalPages,  int size,  int number,  bool last,  bool first)  $default,) {final _that = this;
switch (_that) {
case _AdminUserPageResponse():
return $default(_that.content,_that.totalElements,_that.totalPages,_that.size,_that.number,_that.last,_that.first);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AdminUserResponse> content,  int totalElements,  int totalPages,  int size,  int number,  bool last,  bool first)?  $default,) {final _that = this;
switch (_that) {
case _AdminUserPageResponse() when $default != null:
return $default(_that.content,_that.totalElements,_that.totalPages,_that.size,_that.number,_that.last,_that.first);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminUserPageResponse implements AdminUserPageResponse {
  const _AdminUserPageResponse({final  List<AdminUserResponse> content = const [], this.totalElements = 0, this.totalPages = 0, this.size = 20, this.number = 0, this.last = false, this.first = false}): _content = content;
  factory _AdminUserPageResponse.fromJson(Map<String, dynamic> json) => _$AdminUserPageResponseFromJson(json);

 final  List<AdminUserResponse> _content;
@override@JsonKey() List<AdminUserResponse> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override@JsonKey() final  int totalElements;
@override@JsonKey() final  int totalPages;
@override@JsonKey() final  int size;
@override@JsonKey() final  int number;
@override@JsonKey() final  bool last;
@override@JsonKey() final  bool first;

/// Create a copy of AdminUserPageResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminUserPageResponseCopyWith<_AdminUserPageResponse> get copyWith => __$AdminUserPageResponseCopyWithImpl<_AdminUserPageResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminUserPageResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminUserPageResponse&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.size, size) || other.size == size)&&(identical(other.number, number) || other.number == number)&&(identical(other.last, last) || other.last == last)&&(identical(other.first, first) || other.first == first));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),totalElements,totalPages,size,number,last,first);

@override
String toString() {
  return 'AdminUserPageResponse(content: $content, totalElements: $totalElements, totalPages: $totalPages, size: $size, number: $number, last: $last, first: $first)';
}


}

/// @nodoc
abstract mixin class _$AdminUserPageResponseCopyWith<$Res> implements $AdminUserPageResponseCopyWith<$Res> {
  factory _$AdminUserPageResponseCopyWith(_AdminUserPageResponse value, $Res Function(_AdminUserPageResponse) _then) = __$AdminUserPageResponseCopyWithImpl;
@override @useResult
$Res call({
 List<AdminUserResponse> content, int totalElements, int totalPages, int size, int number, bool last, bool first
});




}
/// @nodoc
class __$AdminUserPageResponseCopyWithImpl<$Res>
    implements _$AdminUserPageResponseCopyWith<$Res> {
  __$AdminUserPageResponseCopyWithImpl(this._self, this._then);

  final _AdminUserPageResponse _self;
  final $Res Function(_AdminUserPageResponse) _then;

/// Create a copy of AdminUserPageResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? totalElements = null,Object? totalPages = null,Object? size = null,Object? number = null,Object? last = null,Object? first = null,}) {
  return _then(_AdminUserPageResponse(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<AdminUserResponse>,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as bool,first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
