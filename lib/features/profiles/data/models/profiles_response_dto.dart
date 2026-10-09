import 'package:freezed_annotation/freezed_annotation.dart';

import 'profile_dto.dart';

part 'profiles_response_dto.freezed.dart';
part 'profiles_response_dto.g.dart';

@freezed
abstract class ProfilesResponseDto with _$ProfilesResponseDto {
  const factory ProfilesResponseDto({
    @Default(<ProfileDto>[]) List<ProfileDto> profiles,
  }) = _ProfilesResponseDto;

  factory ProfilesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProfilesResponseDtoFromJson(json);
}
