import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/error/error_mapper.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/themes/app_dimens.dart';
import '../../../../core/widgets/responsive_content.dart';
import '../../domain/entities/profile.dart';
import '../providers/profiles_providers.dart';
import '../widgets/profile_list_tile.dart';
import '../widgets/profiles_search_field.dart';
import '../widgets/profiles_status_views.dart';

class ProfilesListScreen extends ConsumerWidget {
  const ProfilesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Profile>> profilesAsync = ref.watch(
      filteredProfilesProvider,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Profiles')),
      body: SafeArea(
        child: ResponsiveContent(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(AppDimens.lg),
                child: ProfilesSearchField(),
              ),
              Expanded(
                child: profilesAsync.when(
                  data: (List<Profile> profiles) => _ProfilesList(
                    profiles: profiles,
                    query: ref.watch(profilesSearchQueryProvider),
                  ),
                  loading: ProfilesLoadingView.new,
                  error: (Object error, StackTrace stackTrace) =>
                      ProfilesErrorView(
                        message: mapExceptionToFailure(error).message,
                        onRetry: () =>
                            ref.read(profilesProvider.notifier).retry(),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfilesList extends StatelessWidget {
  const _ProfilesList({required this.profiles, required this.query});

  final List<Profile> profiles;
  final String query;

  @override
  Widget build(BuildContext context) {
    if (profiles.isEmpty) {
      return const ProfilesEmptyView();
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(
        AppDimens.lg,
        0,
        AppDimens.lg,
        AppDimens.lg,
      ),
      itemCount: profiles.length,
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: AppDimens.sm),
      itemBuilder: (BuildContext context, int index) {
        final Profile profile = profiles[index];
        final int? id = profile.id;
        return ProfileListTile(
          profile: profile,
          query: query,
          onTap: id == null
              ? null
              : () => context.pushNamed(
                  AppRoutes.profileDetailsName,
                  pathParameters: <String, String>{'id': id.toString()},
                ),
        );
      },
    );
  }
}
