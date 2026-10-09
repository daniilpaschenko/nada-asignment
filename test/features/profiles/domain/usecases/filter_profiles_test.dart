import 'package:flutter_test/flutter_test.dart';

import 'package:nada_asignment/features/profiles/domain/entities/profile.dart';
import 'package:nada_asignment/features/profiles/domain/usecases/filter_profiles.dart';

void main() {
  const FilterProfiles filter = FilterProfiles();
  const List<Profile> profiles = <Profile>[
    Profile(id: 1, name: 'Ananya Sharma', city: 'Noida'),
    Profile(id: 2, name: 'Rohan Agarwal', city: 'Delhi'),
    Profile(id: 3, name: 'No Id', city: 'London'),
    Profile(id: 4, name: null, city: 'Mumbai'),
    Profile(id: 5, name: 'Isha Verma', city: null),
    Profile(id: 6, name: null, city: null, profession: 'Runner'),
  ];

  group('FilterProfiles', () {
    test('keeps everything for an empty query', () {
      final List<Profile> result = filter(profiles: profiles, query: '');

      expect(result, hasLength(6));
    });

    test('keeps everything for a whitespace-only query', () {
      final List<Profile> result = filter(profiles: profiles, query: '   ');

      expect(result, hasLength(6));
    });

    test('matches by name case-insensitively', () {
      final List<Profile> result = filter(profiles: profiles, query: 'aNaNyA');

      expect(result.single.id, 1);
    });

    test('matches by city case-insensitively', () {
      final List<Profile> result = filter(profiles: profiles, query: 'DELHI');

      expect(result.single.id, 2);
    });

    test('returns an empty list when nothing matches', () {
      final List<Profile> result = filter(profiles: profiles, query: 'zzz');

      expect(result, isEmpty);
    });

    test('does not match a profile when both name and city are null', () {
      expect(filter(profiles: profiles, query: 'runner'), isEmpty);
    });
  });
}