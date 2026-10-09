// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/profiles/data/datasources/profiles_api.dart' as _i1062;
import '../../features/profiles/data/repositories/profiles_repository.dart'
    as _i282;
import '../../features/profiles/domain/interfaces/profiles_repository.dart'
    as _i696;
import '../../features/profiles/domain/usecases/filter_profiles.dart' as _i562;
import '../../features/profiles/domain/usecases/get_profiles.dart' as _i1059;
import '../network/network_module.dart' as _i200;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    final profilesApiModule = _$ProfilesApiModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio());
    gh.lazySingleton<_i562.FilterProfiles>(() => const _i562.FilterProfiles());
    gh.lazySingleton<_i1062.ProfilesApi>(
      () => profilesApiModule.provideProfilesApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i696.ProfilesInterface>(
      () => _i282.ProfilesRepository(gh<_i1062.ProfilesApi>()),
    );
    gh.lazySingleton<_i1059.GetProfiles>(
      () => _i1059.GetProfiles(gh<_i696.ProfilesInterface>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i200.NetworkModule {}

class _$ProfilesApiModule extends _i1062.ProfilesApiModule {}
