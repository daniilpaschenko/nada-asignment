import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/app_constants.dart';

part 'profiles_api.g.dart';

@RestApi()
abstract class ProfilesApi {
  // redirecting factory constructor
  factory ProfilesApi(Dio dio, {String? baseUrl}) = _ProfilesApi;

  @GET(AppConstants.profilesPath)
  // to get a raw body
  @DioResponseType(ResponseType.plain)
  Future<String> getProfilesRaw();
}

@module
abstract class ProfilesApiModule {
  @lazySingleton
  ProfilesApi provideProfilesApi(Dio dio) => ProfilesApi(dio);
}
