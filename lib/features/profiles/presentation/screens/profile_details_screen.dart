import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_background.dart';
import '../../../../core/widgets/app_top_bar.dart';
import '../../../../core/widgets/responsive_content.dart';
import '../../../../core/widgets/slide_fade_in.dart';
import '../../domain/entities/profile.dart';
import '../providers/profiles_providers.dart';
import '../widgets/profile_details_body.dart';
import '../widgets/profiles_async_view.dart';
import '../widgets/profiles_status_views.dart';

class ProfileDetailsScreen extends ConsumerWidget {
  const ProfileDetailsScreen({required this.profileId, super.key});

  final int profileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Profile>> profilesAsync = ref.watch(profilesProvider);

    return Scaffold(
      appBar: const AppTopBar(
        title: 'Profile details',
        subtitle: 'Full information',
      ),
      body: AppBackground(
        child: SafeArea(
          child: SlideFadeIn(
            child: ProfilesAsyncView(
              value: profilesAsync,
              onRetry: () => ref.read(profilesProvider.notifier).retry(),
              dataBuilder: (List<Profile> profiles) {
                final Profile? profile = ref.watch(
                  profileByIdProvider(profileId),
                );
                if (profile == null) {
                  return const ProfileNotFoundView();
                }
                return ResponsiveContent(
                  child: ProfileDetailsBody(profile: profile),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
