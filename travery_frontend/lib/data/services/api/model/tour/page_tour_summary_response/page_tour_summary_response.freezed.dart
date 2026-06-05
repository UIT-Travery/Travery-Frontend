// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_tour_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PageTourSummaryResponse {

 List<TourSummaryResponse> get content; int get totalElements; int get totalPages; int get size; int get number; bool get first; bool get last; bool get empty;
/// Create a copy of PageTourSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageTourSummaryResponseCopyWith<PageTourSummaryResponse> get copyWith => _$PageTourSummaryResponseCopyWithImpl<PageTourSummaryResponse>(this as PageTourSummaryResponse, _$identity);

  /// Serializes this PageTourSummaryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageTourSummaryResponse&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.size, size) || other.size == size)&&(identical(other.number, number) || other.number == number)&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.empty, empty) || other.empty == empty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),totalElements,totalPages,size,number,first,last,empty);

@override
String toString() {
  return 'PageTourSummaryResponse(content: $content, totalElements: $totalElements, totalPages: $totalPages, size: $size, number: $number, first: $first, last: $last, empty: $empty)';
}


}

/// @nodoc
abstract mixin class $PageTourSummaryResponseCopyWith<$Res>  {
  factory $PageTourSummaryResponseCopyWith(PageTourSummaryResponse value, $Res Function(PageTourSummaryResponse) _then) = _$PageTourSummaryResponseCopyWithImpl;
@useResult
$Res call({
 List<TourSummaryResponse> content, int totalElements, int totalPages, int size, int number, bool first, bool last, bool empty
});




}
/// @nodoc
class _$PageTourSummaryResponseCopyWithImpl<$Res>
    implements $PageTourSummaryResponseCopyWith<$Res> {
  _$PageTourSummaryResponseCopyWithImpl(this._self, this._then);

  final PageTourSummaryResponse _self;
  final $Res Function(PageTourSummaryResponse) _then;

/// Create a copy of PageTourSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? totalElements = null,Object? totalPages = null,Object? size = null,Object? number = null,Object? first = null,Object? last = null,Object? empty = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<TourSummaryResponse>,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as bool,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as bool,empty: null == empty ? _self.empty : empty // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PageTourSummaryResponse].
extension PageTourSummaryResponsePatterns on PageTourSummaryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PageTourSummaryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PageTourSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PageTourSummaryResponse value)  $default,){
final _that = this;
switch (_that) {
case _PageTourSummaryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PageTourSummaryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PageTourSummaryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TourSummaryResponse> content,  int totalElements,  int totalPages,  int size,  int number,  bool first,  bool last,  bool empty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PageTourSummaryResponse() when $default != null:
return $default(_that.content,_that.totalElements,_that.totalPages,_that.size,_that.number,_that.first,_that.last,_that.empty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TourSummaryResponse> content,  int totalElements,  int totalPages,  int size,  int number,  bool first,  bool last,  bool empty)  $default,) {final _that = this;
switch (_that) {
case _PageTourSummaryResponse():
return $default(_that.content,_that.totalElements,_that.totalPages,_that.size,_that.number,_that.first,_that.last,_that.empty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TourSummaryResponse> content,  int totalElements,  int totalPages,  int size,  int number,  bool first,  bool last,  bool empty)?  $default,) {final _that = this;
switch (_that) {
case _PageTourSummaryResponse() when $default != null:
return $default(_that.content,_that.totalElements,_that.totalPages,_that.size,_that.number,_that.first,_that.last,_that.empty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PageTourSummaryResponse implements PageTourSummaryResponse {
  const _PageTourSummaryResponse({final  List<TourSummaryResponse> content = const [], this.totalElements = 0, this.totalPages = 0, this.size = 0, this.number = 0, this.first = true, this.last = true, this.empty = true}): _content = content;
  factory _PageTourSummaryResponse.fromJson(Map<String, dynamic> json) => _$PageTourSummaryResponseFromJson(json);

 final  List<TourSummaryResponse> _content;
@override@JsonKey() List<TourSummaryResponse> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override@JsonKey() final  int totalElements;
@override@JsonKey() final  int totalPages;
@override@JsonKey() final  int size;
@override@JsonKey() final  int number;
@override@JsonKey() final  bool first;
@override@JsonKey() final  bool last;
@override@JsonKey() final  bool empty;

/// Create a copy of PageTourSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageTourSummaryResponseCopyWith<_PageTourSummaryResponse> get copyWith => __$PageTourSummaryResponseCopyWithImpl<_PageTourSummaryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PageTourSummaryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageTourSummaryResponse&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.size, size) || other.size == size)&&(identical(other.number, number) || other.number == number)&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.empty, empty) || other.empty == empty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),totalElements,totalPages,size,number,first,last,empty);

@override
String toString() {
  return 'PageTourSummaryResponse(content: $content, totalElements: $totalElements, totalPages: $totalPages, size: $size, number: $number, first: $first, last: $last, empty: $empty)';
}


}

/// @nodoc
abstract mixin class _$PageTourSummaryResponseCopyWith<$Res> implements $PageTourSummaryResponseCopyWith<$Res> {
  factory _$PageTourSummaryResponseCopyWith(_PageTourSummaryResponse value, $Res Function(_PageTourSummaryResponse) _then) = __$PageTourSummaryResponseCopyWithImpl;
@override @useResult
$Res call({
 List<TourSummaryResponse> content, int totalElements, int totalPages, int size, int number, bool first, bool last, bool empty
});




}
/// @nodoc
class __$PageTourSummaryResponseCopyWithImpl<$Res>
    implements _$PageTourSummaryResponseCopyWith<$Res> {
  __$PageTourSummaryResponseCopyWithImpl(this._self, this._then);

  final _PageTourSummaryResponse _self;
  final $Res Function(_PageTourSummaryResponse) _then;

/// Create a copy of PageTourSummaryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? totalElements = null,Object? totalPages = null,Object? size = null,Object? number = null,Object? first = null,Object? last = null,Object? empty = null,}) {
  return _then(_PageTourSummaryResponse(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<TourSummaryResponse>,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as bool,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as bool,empty: null == empty ? _self.empty : empty // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
