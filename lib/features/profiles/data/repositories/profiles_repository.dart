import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/error_mapper.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/profile.dart';
import '../../domain/interfaces/profiles_repository.dart';
import '../datasources/profiles_api.dart';
import '../mappers/profile_mapper.dart';
import '../models/profiles_response_dto.dart';

@LazySingleton(as: ProfilesInterface)
class ProfilesRepository implements ProfilesInterface {
  const ProfilesRepository(this._api);

  final ProfilesApi _api;

  @override
  Future<List<Profile>> getProfiles() async {
    final String rawBody;
    try {
      rawBody = await _api.getProfilesRaw();
    } on DioException catch (error) {
      throw mapDioExceptionToAppException(error);
    }

    try {
      final Object? decoded = jsonDecode(rawBody);
      if (decoded is! Map<String, dynamic>) {
        throw const ParsingException('Unexpected response format');
      }
      final ProfilesResponseDto response = ProfilesResponseDto.fromJson(
        decoded,
      );
      return response.profiles
          .map((dto) => dto.toEntity())
          .toList(growable: false);
    } on AppException {
      rethrow;
    } on Object catch (error) {
      throw ParsingException('Failed to parse profiles: $error');
    }
  }
}
