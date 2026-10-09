// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profiles_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfilesResponseDto {

 List<ProfileDto> get profiles;
/// Create a copy of ProfilesResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfilesResponseDtoCopyWith<ProfilesResponseDto> get copyWith => _$ProfilesResponseDtoCopyWithImpl<ProfilesResponseDto>(this as ProfilesResponseDto, _$identity);

  /// Serializes this ProfilesResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProfilesResponseDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfilesResponseDto&&const DeepCollectionEquality().equals(other.profiles, _this.profiles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProfilesResponseDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.profiles));
}

@override
String toString() {
  final _this = this as ProfilesResponseDto;
  return 'ProfilesResponseDto(profiles: ${_this.profiles})';
}


}

/// @nodoc
abstract mixin class $ProfilesResponseDtoCopyWith<$Res>  {
  factory $ProfilesResponseDtoCopyWith(ProfilesResponseDto value, $Res Function(ProfilesResponseDto) _then) = _$ProfilesResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<ProfileDto> profiles
});




}
/// @nodoc
class _$ProfilesResponseDtoCopyWithImpl<$Res>
    implements $ProfilesResponseDtoCopyWith<$Res> {
  _$ProfilesResponseDtoCopyWithImpl(this._self, this._then);

  final ProfilesResponseDto _self;
  final $Res Function(ProfilesResponseDto) _then;

/// Create a copy of ProfilesResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profiles = null,}) {
  return _then(ProfilesResponseDto(
profiles: null == profiles ? _self.profiles : profiles // ignore: cast_nullable_to_non_nullable
as List<ProfileDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfilesResponseDto].
extension ProfilesResponseDtoPatterns on ProfilesResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfilesResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfilesResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfilesResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _ProfilesResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfilesResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProfilesResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProfileDto> profiles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfilesResponseDto() when $default != null:
return $default(_that.profiles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProfileDto> profiles)  $default,) {final _that = this;
switch (_that) {
case _ProfilesResponseDto():
return $default(_that.profiles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProfileDto> profiles)?  $default,) {final _that = this;
switch (_that) {
case _ProfilesResponseDto() when $default != null:
return $default(_that.profiles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfilesResponseDto implements ProfilesResponseDto {
  const _ProfilesResponseDto({ List<ProfileDto> profiles = const <ProfileDto>[]}): _profiles = profiles;
  factory _ProfilesResponseDto.fromJson(Map<String, dynamic> json) => _$ProfilesResponseDtoFromJson(json);

 final  List<ProfileDto> _profiles;
@override@JsonKey() List<ProfileDto> get profiles {
  if (_profiles is EqualUnmodifiableListView) return _profiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_profiles);
}


/// Create a copy of ProfilesResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfilesResponseDtoCopyWith<_ProfilesResponseDto> get copyWith => __$ProfilesResponseDtoCopyWithImpl<_ProfilesResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfilesResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfilesResponseDto&&const DeepCollectionEquality().equals(other.profiles, _profiles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_profiles));
}

@override
String toString() {
    return 'ProfilesResponseDto(profiles: $profiles)';
}


}

/// @nodoc
abstract mixin class _$ProfilesResponseDtoCopyWith<$Res> implements $ProfilesResponseDtoCopyWith<$Res> {
  factory _$ProfilesResponseDtoCopyWith(_ProfilesResponseDto value, $Res Function(_ProfilesResponseDto) _then) = __$ProfilesResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<ProfileDto> profiles
});




}
/// @nodoc
class __$ProfilesResponseDtoCopyWithImpl<$Res>
    implements _$ProfilesResponseDtoCopyWith<$Res> {
  __$ProfilesResponseDtoCopyWithImpl(this._self, this._then);

  final _ProfilesResponseDto _self;
  final $Res Function(_ProfilesResponseDto) _then;

/// Create a copy of ProfilesResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profiles = null,}) {
  return _then(_ProfilesResponseDto(
profiles: null == profiles ? _self._profiles : profiles // ignore: cast_nullable_to_non_nullable
as List<ProfileDto>,
  ));
}


}

// dart format on
