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
    required this.onRefresh,
    super.key,
  });

  final List<Profile> profiles;
  final String query;
  final ValueChanged<int> onProfileTap;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    if (profiles.isEmpty) {
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                height: constraints.maxHeight,
                child: const ProfilesEmptyView(),
              ),
            );
          },
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
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
      ),
    );
  }
}
