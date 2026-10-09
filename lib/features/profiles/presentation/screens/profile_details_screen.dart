import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/error/error_mapper.dart';
import '../../../../core/widgets/responsive_content.dart';
import '../../domain/entities/profile.dart';
import '../providers/profiles_providers.dart';
import '../widgets/profile_details_body.dart';
import '../widgets/profiles_status_views.dart';

class ProfileDetailsScreen extends ConsumerWidget {
  const ProfileDetailsScreen({required this.profileId, super.key});

  final int profileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Profile>> profilesAsync = ref.watch(profilesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile details')),
      body: SafeArea(
        child: profilesAsync.when(
          data: (List<Profile> profiles) {
            final Profile? profile = ref.watch(profileByIdProvider(profileId));
            if (profile == null) {
              return const ProfileNotFoundView();
            }
            return ResponsiveContent(
              child: ProfileDetailsBody(profile: profile),
            );
          },
          loading: ProfilesLoadingView.new,
          error: (Object error, StackTrace stackTrace) => ProfilesErrorView(
            message: mapExceptionToFailure(error).message,
            onRetry: () => ref.read(profilesProvider.notifier).retry(),
          ),
        ),
      ),
    );
  }
}