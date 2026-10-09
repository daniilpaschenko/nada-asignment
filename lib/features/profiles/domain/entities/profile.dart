import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
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
  }) = _Profile;
}
