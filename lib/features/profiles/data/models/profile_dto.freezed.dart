// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileDto {

 int? get id; String? get name; int? get age; String? get gender; String? get city; String? get community; String? get profession; String? get education; int? get degree; String? get connectedThrough; String? get about;
/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDtoCopyWith<ProfileDto> get copyWith => _$ProfileDtoCopyWithImpl<ProfileDto>(this as ProfileDto, _$identity);

  /// Serializes this ProfileDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProfileDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.age, _this.age) || other.age == _this.age)&&(identical(other.gender, _this.gender) || other.gender == _this.gender)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.community, _this.community) || other.community == _this.community)&&(identical(other.profession, _this.profession) || other.profession == _this.profession)&&(identical(other.education, _this.education) || other.education == _this.education)&&(identical(other.degree, _this.degree) || other.degree == _this.degree)&&(identical(other.connectedThrough, _this.connectedThrough) || other.connectedThrough == _this.connectedThrough)&&(identical(other.about, _this.about) || other.about == _this.about));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProfileDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.age,_this.gender,_this.city,_this.community,_this.profession,_this.education,_this.degree,_this.connectedThrough,_this.about);
}

@override
String toString() {
  final _this = this as ProfileDto;
  return 'ProfileDto(id: ${_this.id}, name: ${_this.name}, age: ${_this.age}, gender: ${_this.gender}, city: ${_this.city}, community: ${_this.community}, profession: ${_this.profession}, education: ${_this.education}, degree: ${_this.degree}, connectedThrough: ${_this.connectedThrough}, about: ${_this.about})';
}


}

/// @nodoc
abstract mixin class $ProfileDtoCopyWith<$Res>  {
  factory $ProfileDtoCopyWith(ProfileDto value, $Res Function(ProfileDto) _then) = _$ProfileDtoCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, int? age, String? gender, String? city, String? community, String? profession, String? education, int? degree, String? connectedThrough, String? about
});




}
/// @nodoc
class _$ProfileDtoCopyWithImpl<$Res>
    implements $ProfileDtoCopyWith<$Res> {
  _$ProfileDtoCopyWithImpl(this._self, this._then);

  final ProfileDto _self;
  final $Res Function(ProfileDto) _then;

/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? age = freezed,Object? gender = freezed,Object? city = freezed,Object? community = freezed,Object? profession = freezed,Object? education = freezed,Object? degree = freezed,Object? connectedThrough = freezed,Object? about = freezed,}) {
  return _then(ProfileDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,community: freezed == community ? _self.community : community // ignore: cast_nullable_to_non_nullable
as String?,profession: freezed == profession ? _self.profession : profession // ignore: cast_nullable_to_non_nullable
as String?,education: freezed == education ? _self.education : education // ignore: cast_nullable_to_non_nullable
as String?,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as int?,connectedThrough: freezed == connectedThrough ? _self.connectedThrough : connectedThrough // ignore: cast_nullable_to_non_nullable
as String?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileDto].
extension ProfileDtoPatterns on ProfileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileDto value)  $default,){
final _that = this;
switch (_that) {
case _ProfileDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  int? age,  String? gender,  String? city,  String? community,  String? profession,  String? education,  int? degree,  String? connectedThrough,  String? about)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileDto() when $default != null:
return $default(_that.id,_that.name,_that.age,_that.gender,_that.city,_that.community,_that.profession,_that.education,_that.degree,_that.connectedThrough,_that.about);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  int? age,  String? gender,  String? city,  String? community,  String? profession,  String? education,  int? degree,  String? connectedThrough,  String? about)  $default,) {final _that = this;
switch (_that) {
case _ProfileDto():
return $default(_that.id,_that.name,_that.age,_that.gender,_that.city,_that.community,_that.profession,_that.education,_that.degree,_that.connectedThrough,_that.about);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  int? age,  String? gender,  String? city,  String? community,  String? profession,  String? education,  int? degree,  String? connectedThrough,  String? about)?  $default,) {final _that = this;
switch (_that) {
case _ProfileDto() when $default != null:
return $default(_that.id,_that.name,_that.age,_that.gender,_that.city,_that.community,_that.profession,_that.education,_that.degree,_that.connectedThrough,_that.about);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileDto implements ProfileDto {
  const _ProfileDto({this.id, this.name, this.age, this.gender, this.city, this.community, this.profession, this.education, this.degree, this.connectedThrough, this.about});
  factory _ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  int? age;
@override final  String? gender;
@override final  String? city;
@override final  String? community;
@override final  String? profession;
@override final  String? education;
@override final  int? degree;
@override final  String? connectedThrough;
@override final  String? about;

/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileDtoCopyWith<_ProfileDto> get copyWith => __$ProfileDtoCopyWithImpl<_ProfileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.age, age) || other.age == age)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.city, city) || other.city == city)&&(identical(other.community, community) || other.community == community)&&(identical(other.profession, profession) || other.profession == profession)&&(identical(other.education, education) || other.education == education)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.connectedThrough, connectedThrough) || other.connectedThrough == connectedThrough)&&(identical(other.about, about) || other.about == about));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,age,gender,city,community,profession,education,degree,connectedThrough,about);
}

@override
String toString() {
    return 'ProfileDto(id: $id, name: $name, age: $age, gender: $gender, city: $city, community: $community, profession: $profession, education: $education, degree: $degree, connectedThrough: $connectedThrough, about: $about)';
}


}

/// @nodoc
abstract mixin class _$ProfileDtoCopyWith<$Res> implements $ProfileDtoCopyWith<$Res> {
  factory _$ProfileDtoCopyWith(_ProfileDto value, $Res Function(_ProfileDto) _then) = __$ProfileDtoCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, int? age, String? gender, String? city, String? community, String? profession, String? education, int? degree, String? connectedThrough, String? about
});




}
/// @nodoc
class __$ProfileDtoCopyWithImpl<$Res>
    implements _$ProfileDtoCopyWith<$Res> {
  __$ProfileDtoCopyWithImpl(this._self, this._then);

  final _ProfileDto _self;
  final $Res Function(_ProfileDto) _then;

/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? age = freezed,Object? gender = freezed,Object? city = freezed,Object? community = freezed,Object? profession = freezed,Object? education = freezed,Object? degree = freezed,Object? connectedThrough = freezed,Object? about = freezed,}) {
  return _then(_ProfileDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,community: freezed == community ? _self.community : community // ignore: cast_nullable_to_non_nullable
as String?,profession: freezed == profession ? _self.profession : profession // ignore: cast_nullable_to_non_nullable
as String?,education: freezed == education ? _self.education : education // ignore: cast_nullable_to_non_nullable
as String?,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as int?,connectedThrough: freezed == connectedThrough ? _self.connectedThrough : connectedThrough // ignore: cast_nullable_to_non_nullable
as String?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
