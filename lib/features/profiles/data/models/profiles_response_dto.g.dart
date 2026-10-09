// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'profiles_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfilesResponseDto _$ProfilesResponseDtoFromJson(Map<String, dynamic> json) =>
    _ProfilesResponseDto(
      profiles:
          (json['profiles'] as List<dynamic>?)
              ?.map((e) => ProfileDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProfileDto>[],
    );

Map<String, dynamic> _$ProfilesResponseDtoToJson(
  _ProfilesResponseDto instance,
) => <String, dynamic>{
  'profiles': instance.profiles.map((e) => e.toJson()).toList(),
};
