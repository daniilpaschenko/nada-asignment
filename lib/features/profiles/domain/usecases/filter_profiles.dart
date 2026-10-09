import 'package:injectable/injectable.dart';

import '../entities/profile.dart';

@lazySingleton
class FilterProfiles {
  const FilterProfiles();

  List<Profile> call({required List<Profile> profiles, required String query}) {
    final String normalizedQuery = query.trim().toLowerCase();
    if (normalizedQuery.isEmpty) {
      return profiles;
    }
    return profiles
        .where((Profile profile) {
          final String name = profile.name?.toLowerCase() ?? '';
          final String city = profile.city?.toLowerCase() ?? '';
          return name.contains(normalizedQuery) ||
              city.contains(normalizedQuery);
        })
        .toList(growable: false);
  }
}
