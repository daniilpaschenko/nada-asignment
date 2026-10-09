import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:nada_asignment/features/profiles/data/models/profile_dto.dart';
import 'package:nada_asignment/features/profiles/data/models/profiles_response_dto.dart';

import '../../../../helpers/fixtures/profiles_fixture.dart';

void main() {
  group('ProfilesResponseDto', () {
    test('parses snake_case fields and preserves null values', () {
      final Object? decoded = jsonDecode(profilesFixtureJson);
      final Map<String, dynamic> json = decoded! as Map<String, dynamic>;

      final ProfilesResponseDto response = ProfilesResponseDto.fromJson(json);

      expect(response.profiles, hasLength(5)); // 5 profiles expected
      // get profiles by id
      final Map<int?, ProfileDto> byId = <int?, ProfileDto>{
        for (final ProfileDto profile in response.profiles) profile.id: profile,
      };

      final ProfileDto ananya = byId[1]!;
      expect(ananya.name, 'Ananya Sharma');
      expect(ananya.connectedThrough, 'Your cousin Nikhil knows her brother.');
      expect(ananya.degree, 1);

      expect(byId[6]!.education, isNull);

      expect(byId[10]!.degree, isNull);
      expect(byId[10]!.connectedThrough, isNull);

      expect(byId[12]!.about, isNull);

      expect(byId[16]!.connectedThrough, 'आपके मौसा जी के बैंक के सहकर्मी।');
      expect(byId[16]!.about, 'लखनऊ में बैंक में पीओ, प्रेमचंद पढ़ते हैं।');
    });
  });
}