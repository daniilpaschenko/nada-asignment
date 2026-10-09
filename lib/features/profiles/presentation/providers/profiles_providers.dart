import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/injection.dart';
import '../../domain/entities/profile.dart';
import '../../domain/usecases/filter_profiles.dart';
import '../../domain/usecases/get_profiles.dart';

part 'profiles_providers.g.dart';

// Holds the current search query typed by the user
@riverpod
class ProfilesSearchQuery extends _$ProfilesSearchQuery {
  @override
  String build() => '';

  // Replaces the query and triggers re-filtering of the list
  void updateQuery(String value) => state = value;
}

// Loads the full list of profiles from the use case
@riverpod
class Profiles extends _$Profiles {
  @override
  Future<List<Profile>> build() {
    final GetProfiles getProfiles = getIt<GetProfiles>();
    return getProfiles();
  }

  // Reloads the profiles after a failure (Retry button)
  void retry() => ref.invalidateSelf();
}

// Applies the search query to the loaded profiles, keeping loading/error states
@riverpod
AsyncValue<List<Profile>> filteredProfiles(Ref ref) {
  final String query = ref.watch(profilesSearchQueryProvider);
  final FilterProfiles filterProfiles = getIt<FilterProfiles>();
  return ref
      .watch(profilesProvider)
      .whenData(
        (List<Profile> profiles) =>
            filterProfiles(profiles: profiles, query: query),
      );
}

// Returns a single profile by id, or null when it is not available yet
@riverpod
Profile? profileById(Ref ref, int id) {
  final List<Profile> profiles =
      ref.watch(profilesProvider).value ?? const <Profile>[];
  for (final Profile profile in profiles) {
    if (profile.id == id) {
      return profile;
    }
  }
  return null;
}
