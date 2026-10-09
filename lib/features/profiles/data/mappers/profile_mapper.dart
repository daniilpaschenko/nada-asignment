import '../../domain/entities/profile.dart';
import '../models/profile_dto.dart';

extension ProfileDtoMapper on ProfileDto {
  Profile toEntity() => Profile(
    id: id,
    name: name,
    age: age,
    gender: gender,
    city: city,
    community: community,
    profession: profession,
    education: education,
    degree: degree,
    connectedThrough: connectedThrough,
    about: about,
  );
}
