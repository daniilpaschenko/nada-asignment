import 'package:injectable/injectable.dart';

import '../entities/profile.dart';
import '../interfaces/profiles_repository.dart';

@lazySingleton
class GetProfiles {
  const GetProfiles(this._repository);

  final ProfilesInterface _repository;

  Future<List<Profile>> call() => _repository.getProfiles();
}
