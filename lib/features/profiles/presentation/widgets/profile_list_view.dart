import 'package:flutter/material.dart';

import '../../../../core/themes/app_dimens.dart';
import '../../domain/entities/profile.dart';
import 'profile_list_tile.dart';
import 'profiles_status_views.dart';

class ProfileListView extends StatelessWidget {
  const ProfileListView({
    required this.profiles,
    required this.query,
    required this.onProfileTap,
    super.key,
  });

  final List<Profile> profiles;
  final String query;
  final ValueChanged<int> onProfileTap;

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
          onTap: id == null ? null : () => onProfileTap(id),
        );
      },
    );
  }
}