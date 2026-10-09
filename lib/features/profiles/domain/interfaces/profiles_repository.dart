import '../entities/profile.dart';

abstract interface class ProfilesInterface {
  Future<List<Profile>> getProfiles();
}
