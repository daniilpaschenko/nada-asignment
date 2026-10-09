import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

@freezed
abstract class ProfileDto with _$ProfileDto {
  const factory ProfileDto({
    int? id,
    String? name,
    int? age,
    String? gender,
    String? city,
    String? community,
    String? profession,
    String? education,
    int? degree,
    String? connectedThrough,
    String? about,
  }) = _ProfileDto;

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);
}
