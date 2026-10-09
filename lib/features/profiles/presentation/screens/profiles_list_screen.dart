import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/error/error_mapper.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/themes/app_dimens.dart';
import '../../../../core/widgets/app_background.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/responsive_content.dart';
import '../../domain/entities/profile.dart';
import '../providers/profiles_providers.dart';
import '../widgets/profile_list_view.dart';
import '../widgets/profiles_search_field.dart';
import '../widgets/profiles_status_views.dart';

class ProfilesListScreen extends ConsumerWidget {
  const ProfilesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Profile>> profilesAsync = ref.watch(
      filteredProfilesProvider,
    );
    final AsyncValue<List<Profile>> allProfilesAsync = ref.watch(
      profilesProvider,
    );

    return Scaffold(
      appBar: AppTopBar(
        title: 'Profiles',
        subtitle: allProfilesAsync.maybeWhen(
          data: (List<Profile> profiles) =>
              '${profiles.length} people in your network',
          orElse: () => 'Discover people in your network',
        ),
        actions: <Widget>[
          AppTopBarAction(
            icon: Icons.refresh_rounded,
            tooltip: 'Refresh',
            onPressed: () => ref.read(profilesProvider.notifier).retry(),
          ),
        ],
      ),
      body: AppBackground(
        child: SafeArea(
          child: ResponsiveContent(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(AppDimens.lg),
                  child: ProfilesSearchField(),
                ),
                Expanded(
                  child: profilesAsync.when(
                    data: (List<Profile> profiles) => ProfileListView(
                      profiles: profiles,
                      query: ref.watch(profilesSearchQueryProvider),
                      onProfileTap: (int id) => context.pushNamed(
                        AppRoutes.profileDetailsName,
                        pathParameters: <String, String>{'id': id.toString()},
                      ),
                      onRefresh: () {
                        final Future<List<Profile>> future = ref.refresh(
                          profilesProvider.future,
                        );
                        return future.then<void>((_) {});
                      },
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
      ),
    );
  }
}
