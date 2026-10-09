import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nada_asignment/core/constants/app_constants.dart';
import 'package:nada_asignment/core/error/exceptions.dart';
import 'package:nada_asignment/features/profiles/data/datasources/profiles_api.dart';
import 'package:nada_asignment/features/profiles/data/repositories/profiles_repository.dart';
import 'package:nada_asignment/features/profiles/domain/entities/profile.dart';

import '../../../../helpers/fixtures/profiles_fixture.dart';

class _FakeHttpClientAdapter implements HttpClientAdapter {
  _FakeHttpClientAdapter(this.body, {this.statusCode = 200});

  final String body;
  final int statusCode;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    return ResponseBody.fromString(
      body,
      statusCode,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.textPlainContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

ProfilesRepository _buildRepository(String body, {int statusCode = 200}) {
  final Dio dio = Dio(BaseOptions(baseUrl: AppConstants.profilesBaseUrl));
  dio.httpClientAdapter = _FakeHttpClientAdapter(body, statusCode: statusCode);
  return ProfilesRepository(ProfilesApi(dio));
}

void main() {
  group('ProfilesRepository', () {
    test('downloads the raw body and decodes it into profile entities', () async {
      final ProfilesRepository repository = _buildRepository(
        profilesFixtureJson,
      );

      final List<Profile> profiles = await repository.getProfiles();

      expect(profiles, hasLength(5));
      final Profile first = profiles.first;
      expect(first.id, 1);
      expect(first.name, 'Ananya Sharma');
      expect(first.age, 27);
      expect(first.city, 'Noida');
      expect(first.connectedThrough, contains('cousin'));

      final Profile dev = profiles[1];
      expect(dev.education, isNull);

      final Profile nikhil = profiles[2];
      expect(nikhil.connectedThrough, isNull);

      final Profile vikram = profiles[3];
      expect(vikram.about, isNull);

      expect(profiles[4].about, startsWith('लखनऊ'));
    });

    test('throws ParsingException when the body is not a JSON object', () {
      final ProfilesRepository repository = _buildRepository('[]');

      expect(
        repository.getProfiles(),
        throwsA(isA<ParsingException>()),
      );
    });

    test('throws ParsingException when the body is not valid JSON', () {
      final ProfilesRepository repository = _buildRepository('not json');

      expect(
        repository.getProfiles(),
        throwsA(isA<ParsingException>()),
      );
    });

    test('throws ServerException on an error status code', () {
      final ProfilesRepository repository = _buildRepository(
        profilesFixtureJson,
        statusCode: 500,
      );

      expect(
        repository.getProfiles(),
        throwsA(isA<ServerException>()),
      );
    });
  });
}