// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) => _ProfileDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  age: (json['age'] as num?)?.toInt(),
  gender: json['gender'] as String?,
  city: json['city'] as String?,
  community: json['community'] as String?,
  profession: json['profession'] as String?,
  education: json['education'] as String?,
  degree: (json['degree'] as num?)?.toInt(),
  connectedThrough: json['connected_through'] as String?,
  about: json['about'] as String?,
);

Map<String, dynamic> _$ProfileDtoToJson(_ProfileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'gender': instance.gender,
      'city': instance.city,
      'community': instance.community,
      'profession': instance.profession,
      'education': instance.education,
      'degree': instance.degree,
      'connected_through': instance.connectedThrough,
      'about': instance.about,
    };
