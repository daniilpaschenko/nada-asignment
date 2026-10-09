// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'profiles_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfilesSearchQuery)
final profilesSearchQueryProvider = ProfilesSearchQueryProvider._();

final class ProfilesSearchQueryProvider
    extends $NotifierProvider<ProfilesSearchQuery, String> {
  ProfilesSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profilesSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profilesSearchQueryHash();

  @$internal
  @override
  ProfilesSearchQuery create() => ProfilesSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$profilesSearchQueryHash() =>
    r'eaddd1852a41a5d915df53797552f1bcf1d3ceec';

abstract class _$ProfilesSearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(Profiles)
final profilesProvider = ProfilesProvider._();

final class ProfilesProvider
    extends $AsyncNotifierProvider<Profiles, List<Profile>> {
  ProfilesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profilesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profilesHash();

  @$internal
  @override
  Profiles create() => Profiles();
}

String _$profilesHash() => r'6ba1aaa7b83cfbf16c2fee6f962472b58418e6ee';

abstract class _$Profiles extends $AsyncNotifier<List<Profile>> {
  FutureOr<List<Profile>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Profile>>, List<Profile>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Profile>>, List<Profile>>,
              AsyncValue<List<Profile>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(filteredProfiles)
final filteredProfilesProvider = FilteredProfilesProvider._();

final class FilteredProfilesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Profile>>,
          AsyncValue<List<Profile>>,
          AsyncValue<List<Profile>>
        >
    with $Provider<AsyncValue<List<Profile>>> {
  FilteredProfilesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredProfilesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredProfilesHash();

  @$internal
  @override
  $ProviderElement<AsyncValue<List<Profile>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<List<Profile>> create(Ref ref) {
    return filteredProfiles(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Profile>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Profile>>>(value),
    );
  }
}

String _$filteredProfilesHash() => r'0beed3ae36924309da58b9c47a0754959b4c9ef3';

@ProviderFor(profileById)
final profileByIdProvider = ProfileByIdFamily._();

final class ProfileByIdProvider
    extends $FunctionalProvider<Profile?, Profile?, Profile?>
    with $Provider<Profile?> {
  ProfileByIdProvider._({
    required ProfileByIdFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'profileByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$profileByIdHash();

  @override
  String toString() {
    return r'profileByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Profile?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Profile? create(Ref ref) {
    final argument = this.argument as int;
    return profileById(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Profile? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Profile?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$profileByIdHash() => r'ed00c3056eb6fc6ca816ca1847883a15e0c0ada0';

final class ProfileByIdFamily extends $Family
    with $FunctionalFamilyOverride<Profile?, int> {
  ProfileByIdFamily._()
    : super(
        retry: null,
        name: r'profileByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProfileByIdProvider call(int id) =>
      ProfileByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'profileByIdProvider';
}
